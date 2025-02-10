const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/db'); // Import the 'blail' database connection

const Message = sequelize.define('Message', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true, // Auto-increments the ID for each new message
  },
  recipient: {
    type: DataTypes.STRING,
    allowNull: false, // Ensure recipient is provided
  },
  subject: {
    type: DataTypes.STRING,
    allowNull: false, // Ensure subject is provided
  },
  body: {
    type: DataTypes.TEXT,
    allowNull: false, // Ensure body is provided
  },
  date: {
    type: DataTypes.DATE,
    defaultValue: Sequelize.NOW, // Automatically set the date to the current timestamp
  }
});

// Sync the model with the database (create/update the table if necessary)
Message.sync({ alter: true })
  .then(() => console.log('Message table created or updated in blail database'))
  .catch(err => console.log('Error syncing Message table:', err));

module.exports = Message;
