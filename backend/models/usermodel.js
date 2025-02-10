const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/db'); // Your database connection file

const User = sequelize.define('User', {
  id: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
  },
  username: {
    type: DataTypes.STRING,
    allowNull: false,
    unique: true,  // Ensures that each username is unique in the database
  },
  created_at: {
    type: DataTypes.DATE,
    defaultValue: Sequelize.NOW,
  }
});

// Syncing model with database
User.sync({ alter: true }) // You can use this to create/update the table in the DB
  .then(() => console.log('User table created or updated'))
  .catch(err => console.log('Error syncing User table:', err));

module.exports = User;
