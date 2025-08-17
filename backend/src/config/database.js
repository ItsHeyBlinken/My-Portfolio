const { Pool } = require('pg');

// Use DATABASE_URL if available, otherwise fall back to individual variables
const pool = new Pool(
  process.env.DATABASE_URL ? {
    connectionString: process.env.DATABASE_URL,
    ssl: process.env.DB_SSL_MODE === 'require' ? { rejectUnauthorized: false } : false
  } : {
    user: process.env.DB_USER || 'ocs-beta-db',
    host: process.env.DB_HOST || '168.231.66.214',
    database: process.env.DB_NAME || 'Portfolio_Blog',
    password: process.env.DB_PASSWORD || '6SETisZYFCYmpmQT9tcfStVqw3iU1Rk2m5jNLSYsEwDwTcw2I878ERYH8u5WX8wL',
    port: process.env.DB_PORT || 5432,
    ssl: process.env.DB_SSL_MODE === 'require' ? { rejectUnauthorized: false } : false
  }
);

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
