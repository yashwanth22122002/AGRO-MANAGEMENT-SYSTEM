import mysql from 'mysql2/promise';
import dotenv from 'dotenv';

dotenv.config();

const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'agromanage',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

export const initializeDatabase = async () => {
  try {
    const connection = await pool.getConnection();
    console.log('Database connected successfully');

    // Create database if it doesn't exist
    await connection.query(`CREATE DATABASE IF NOT EXISTS ${process.env.DB_NAME}`);
    
    // Use query instead of execute for USE command
    await connection.query(`USE ${process.env.DB_NAME}`);

    // Create fields table
    await connection.query(`
      CREATE TABLE IF NOT EXISTS fields (
        id INT PRIMARY KEY AUTO_INCREMENT,
        farmer_id INT NOT NULL,
        name VARCHAR(255) NOT NULL,
        area DECIMAL(10,2) NOT NULL,
        location VARCHAR(255) NOT NULL,
        soil_type VARCHAR(255) NOT NULL,
        soil_ph VARCHAR(50) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (farmer_id) REFERENCES users(id)
      );
    `);

    connection.release();
    return true;
  } catch (error) {
    console.error('Database initialization error:', error);
    throw error;
  }
};

export default pool;