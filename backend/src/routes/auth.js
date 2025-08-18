const express = require('express');
const router = express.Router();
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');

// Admin credentials (should be in environment variables)
const ADMIN_USERNAME = process.env.ADMIN_USERNAME || 'admin';
const ADMIN_PASSWORD_HASH = process.env.ADMIN_PASSWORD_HASH || '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi';

// Debug logging to see what's actually loaded
console.log('=== AUTH DEBUG INFO ===');
console.log('ADMIN_USERNAME:', ADMIN_USERNAME);
console.log('ADMIN_PASSWORD_HASH:', ADMIN_PASSWORD_HASH ? 'SET' : 'NOT SET');
console.log('ADMIN_PASSWORD_HASH length:', ADMIN_PASSWORD_HASH ? ADMIN_PASSWORD_HASH.length : 0);
console.log('Environment variables loaded:', Object.keys(process.env).filter(key => key.includes('ADMIN')));
console.log('========================');

// Simple test route to verify loading
router.get('/test', (req, res) => {
  res.json({ 
    message: 'Auth route is working!',
    adminUsername: ADMIN_USERNAME,
    passwordHashSet: !!ADMIN_PASSWORD_HASH,
    passwordHashLength: ADMIN_PASSWORD_HASH ? ADMIN_PASSWORD_HASH.length : 0,
    envVars: Object.keys(process.env).filter(key => key.includes('ADMIN'))
  });
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
