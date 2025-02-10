import express from "express";
import multer from "multer";
import fs from "fs";
import OpenAI from "openai";
import { Sequelize } from "sequelize";


const port = 4040;
// Set up Sequelize connection to MySQL


const sequelize = new Sequelize(
     "mysql://root:Ngwudalu12345.@localhost:4939/blail");

const app = express();
const upload = multer({ dest: "uploads/" });

const openai = new OpenAI({ apiKey: "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" });

app.post("/transcribe", upload.single("audio"), async (req, res) => {
  try {
    const audioPath = req.file.path;
    const transcription = await openai.audio.transcriptions.create({
      file: fs.createReadStream(audioPath),
      model: "whisper-1",
      response_format: "verbose_json",
      timestamp_granularities: ["word"]
    });

    // Store transcription in MySQL (Sequelize)
    const { Catchphrase } = await sequelize.define("Catchphrase", {
      phrase: {
        type: Sequelize.STRING,
        allowNull: false
      }
    });

    const catchphrase = transcription.words.join(" ");
    if (catchphrase.split(" ").length === 6) {
      await Catchphrase.create({ phrase: catchphrase });
      res.json({ success: true, transcription: catchphrase });
    } else {
      res.status(400).json({ success: false, message: "Catchphrase must contain 6 words" });
    }

    fs.unlinkSync(audioPath); // Delete file after processing
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: "Error transcribing audio" });
  }
});

app.listen(port, () => console.log("Server running on port" + port));
