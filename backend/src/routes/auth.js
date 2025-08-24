const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

// Admin credentials (hardcoded for now)
const ADMIN_USERNAME = 'admin';
const ADMIN_PASSWORD_HASH = '$2y$10$y6vfKFJ6Za8n.qoZsz/j2e/eKZpG0KJt8B8FMerteM10iMJBDlFPi';

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
  try {
    const { username, password } = req.body;

    // Check username
    if (username !== ADMIN_USERNAME) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    // Check password
    const isValidPassword = await bcrypt.compare(password, ADMIN_PASSWORD_HASH);
    if (!isValidPassword) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    // Generate JWT token
    const token = jwt.sign(
      { username: ADMIN_USERNAME, role: 'admin' },
      process.env.JWT_SECRET || 'your-secret-key',
      { expiresIn: '24h' }
    );

    res.json({
      token,
      user: { username: ADMIN_USERNAME, role: 'admin' },
      message: 'Login successful'
    });
  } catch (error) {
    console.error('Login error:', error);
    res.status(500).json({ error: 'Login failed' });
  }
});

// GET verify token
router.get('/verify', (req, res) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) {
    return res.status(401).json({ error: 'No token provided' });
  }

  jwt.verify(token, process.env.JWT_SECRET || 'your-secret-key', (err, user) => {
    if (err) {
      return res.status(403).json({ error: 'Invalid token' });
    }
    res.json({ valid: true, user });
  });
});

// POST logout (client-side token removal)
router.post('/logout', (req, res) => {
  res.json({ message: 'Logout successful' });
});

module.exports = router;
