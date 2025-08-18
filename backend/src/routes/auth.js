const express = require('express');
const router = express.Router();

// Simple test route to verify loading
router.get('/test', (req, res) => {
  res.json({ message: 'Auth route is working!' });
});

// GET login test route
router.get('/login', (req, res) => {
  res.json({ message: 'Login endpoint reached via GET', method: 'GET' });
});

// POST login - Admin authentication endpoint
router.post('/login', async (req, res) => {
  res.json({ message: 'Login endpoint reached via POST', method: 'POST' });
});

module.exports = router;
