const express = require('express');
const router = express.Router();
const Message = require('../models/messageModel'); // Import the Message model

// Route to send a new message
router.post('/send', async (req, res) => {
  const { recipient, subject, body } = req.body;

  try {
    const message = await Message.create({ recipient, subject, body });
    res.status(201).json({ message: 'Message sent successfully', message });
  } catch (error) {
    console.log(error);
    res.status(400).json({ message: 'Error sending message', error });
  }
});

// Route to get messages (for a specific recipient)
router.get('/messages/:recipient', async (req, res) => {
  const { recipient } = req.params;

  try {
    const messages = await Message.findAll({ where: { recipient } });

    if (messages.length > 0) {
      res.status(200).json({ message: 'Messages found', messages });
    } else {
      res.status(404).json({ message: 'No messages found for this recipient' });
    }
  } catch (error) {
    res.status(400).json({ message: 'Error fetching messages', error });
  }
});

module.exports = router;
