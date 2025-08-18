const express = require('express');
const router = express.Router();

// Simple test route to verify loading
router.get('/test', (req, res) => {
  res.json({ message: 'Auth route is working!' });
});

// POST login - Admin authentication endpoint
router.post('/login', async (req, res) => {
  res.json({ message: 'Login endpoint reached', method: 'POST' });
});

module.exports = router;
