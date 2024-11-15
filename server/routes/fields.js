import express from 'express';
import { body, validationResult } from 'express-validator';
import pool from '../database/init.js';
import { authenticateToken } from '../middleware/auth.js';

const router = express.Router();

router.get('/', authenticateToken, async (req, res) => {
  try {
    const [rows] = await pool.execute(
      'SELECT * FROM fields WHERE farmer_id = ? ORDER BY created_at DESC',
      [req.user.id]
    );
    res.json(rows);
  } catch (error) {
    console.error('Error fetching fields:', error);
    res.status(500).json({ error: 'Failed to fetch fields' });
  }
});

router.post('/',
  authenticateToken,
  [
    body('name').trim().notEmpty().withMessage('Field name is required'),
    body('area').isFloat({ min: 0.1 }).withMessage('Area must be at least 0.1 acres'),
    body('location').trim().notEmpty().withMessage('Location is required'),
    body('soil_type').trim().notEmpty().withMessage('Soil type is required'),
    body('soil_ph').trim().notEmpty().withMessage('Soil pH is required'),
  ],
  async (req, res) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ error: errors.array()[0].msg });
      }

      const { name, area, location, soil_type, soil_ph } = req.body;
      
      // Log the request data
      console.log('Request body:', req.body);
      console.log('User ID:', req.user.id);

      // First, check if the user exists
      const [userCheck] = await pool.execute(
        'SELECT id FROM users WHERE id = ?',
        [req.user.id]
      );

      if (!userCheck.length) {
        return res.status(400).json({ error: 'Invalid user ID' });
      }

      const [result] = await pool.execute(
        `INSERT INTO fields (farmer_id, name, area, location, soil_type, soil_ph) 
         VALUES (?, ?, ?, ?, ?, ?)`,
        [req.user.id, name, area, location, soil_type, soil_ph]
      );

      // Log the insert result
      console.log('Insert result:', result);

      const [newField] = await pool.execute(
        'SELECT * FROM fields WHERE id = ?',
        [result.insertId]
      );

      res.status(201).json(newField[0]);
    } catch (error) {
      // Detailed error logging
      console.error('Full error object:', error);
      console.error('Error message:', error.message);
      console.error('Error code:', error.code);
      console.error('Error stack:', error.stack);
      
      res.status(500).json({ 
        error: 'Database error', 
        details: error.message,
        code: error.code 
      });
    }
  }
);

export default router; 