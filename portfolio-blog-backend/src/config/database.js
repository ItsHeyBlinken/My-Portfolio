const { Pool } = require('pg');

// Database configuration
const pool = new Pool({
  user: process.env.DB_USER || 'ocs-beta-db',
  host: process.env.DB_HOST || '168.231.66.214',
  database: process.env.DB_NAME || 'portfolio_blog',
  password: process.env.DB_PASSWORD || '6SETisZYFCYmpmQT9tcfStVqw3iU1Rk2m5jNLSYsEwDwTcw2I878ERYH8u5WX8wL',
  port: process.env.DB_PORT || 5432,
  ssl: process.env.NODE_ENV === 'production' ? { rejectUnauthorized: false } : false,
  max: 20, // Maximum number of clients in the pool
  idleTimeoutMillis: 30000, // Close idle clients after 30 seconds
  connectionTimeoutMillis: 2000, // Return an error after 2 seconds if connection could not be established
});

// Test the connection
pool.on('connect', () => {
  console.log('🔌 New client connected to PostgreSQL');
});

pool.on('error', (err) => {
  console.error('❌ Unexpected error on idle client', err);
  process.exit(-1);
});

// Graceful shutdown
process.on('SIGINT', () => {
  pool.end(() => {
    console.log('🔌 Pool has ended');
    process.exit(0);
  });
});

module.exports = { pool };
