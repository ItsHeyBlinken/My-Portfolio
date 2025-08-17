const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER || 'ocs-beta-db',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_NAME || 'portfolio_blog',
  password: process.env.DB_PASSWORD || '6SETisZYFCYmpmQT9tcfStVqw3iU1Rk2m5jNLSYsEwDwTcw2I878ERYH8u5WX8wL',
  port: process.env.DB_PORT || 5432,
  // SSL disabled to fix connection error
  ssl: false
});

// Test the connection
pool.on('connect', () => {
  console.log('Database connected successfully');
});

pool.on('error', (err) => {
  console.error('Unexpected error on idle client', err);
  process.exit(-1);
});

// Graceful shutdown
process.on('SIGINT', async () => {
  await pool.end();
  process.exit(0);
});

module.exports = pool;
