const express = require('express');
const multer = require('multer');
const axios = require('axios');
const fs = require('fs');
const path = require('path');
const sequelize = require('../config/db'); // Sequelize DB connection
const Message = require('../models/messageModel'); // Import the model
const { SpeechRecord } = require('../models/speechRecordModel'); // Import the speech record model

const router = express.Router();

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/audio/'); // Save audio files to this folder
  },
  filename: (req, file, cb) => {
    cb(null, Date.now() + path.extname(file.originalname)); // Name the file based on timestamp
  }
});

const upload = multer({ storage: storage });

// Route to upload audio and start transcription
router.post('/upload', upload.single('audio'), async (req, res) => {
  const { file } = req;
  const userId = req.body.user_id;  // Assuming user_id is passed in the request

  try {
    // Store audio file info in the database (initially with pending transcription status)
    const newSpeechRecord = await SpeechRecord.create({
      user_id: userId,
      file_url: file.path, // Store the file path
      status: 'pending',   // Mark status as pending initially
    });

    // Call OpenAI API for transcription
    const transcription = await transcribeAudio(file.path);

    // Update the transcription and status
    newSpeechRecord.transcription = transcription;
    newSpeechRecord.status = 'completed'; // Mark as completed
    await newSpeechRecord.save();

    // Send response with transcription
    res.status(200).json({
      message: 'Audio uploaded and transcription completed',
      transcription: transcription,
      file_url: file.path,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error uploading or transcribing audio', error });
  }
});

// Function to send audio to OpenAI and get transcription
async function transcribeAudio(filePath) {
  const fileContent = fs.readFileSync(filePath); // Read the audio file content

  try {
    const response = await axios.post('https://api.openai.com/v1/audio/transcriptions', fileContent, {
      headers: {
        'Authorization': `Bearer ${process.env.OPENAI_API_KEY}`,
        'Content-Type': 'audio/wav', // Change to correct format if necessary
      },
      params: {
        model: 'whisper-1', // Specify OpenAI's Whisper model for transcription
        language: 'en',     // Specify language if necessary
      },
    });

    return response.data.text; // Return the transcription text
  } catch (error) {
    console.error('Error during OpenAI transcription:', error);
    throw new Error('Error transcribing audio');
  }
}

module.exports = router;
