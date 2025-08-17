const jwt = require('jsonwebtoken');

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers.authorization;
  const token = authHeader && authHeader.split(' ')[1]; // Bearer TOKEN
  
  if (!token) {
    return res.status(401).json({ error: 'Access token required' });
  }
  
  jwt.verify(token, process.env.JWT_SECRET || 'your-secret-key-change-in-production', (err, user) => {
    if (err) {
      return res.status(403).json({ error: 'Invalid or expired token' });
    }
    
    // Check if token is expired
    if (user.timestamp && Date.now() - user.timestamp > 24 * 60 * 60 * 1000) {
      return res.status(403).json({ error: 'Token expired' });
    }
    
    req.user = user;
    next();
  });
};

module.exports = { authenticateToken };
