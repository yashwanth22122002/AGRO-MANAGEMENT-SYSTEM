import express from 'express';
import { body, validationResult } from 'express-validator';
import pool from '../database/init.js';
import { authenticateToken } from '../middleware/auth.js';

const router = express.Router();

// Get farmer's crops
router.get('/', authenticateToken, async (req, res) => {
  try {
    const [rows] = await pool.execute(
      'SELECT * FROM crops WHERE farmer_id = ? ORDER BY created_at DESC',
      [req.user.id]
    );
    res.json(rows);
  } catch (error) {
    console.error('Error fetching crops:', error);
    res.status(500).json({ 
      error: 'Failed to fetch crops',
      details: process.env.NODE_ENV === 'development' ? error.message : undefined 
    });
  }
});

// Get crop guides (public)
router.get('/guides', async (req, res) => {
  try {
    const [rows] = await pool.execute('SELECT * FROM crop_guides');
    res.json(rows);
  } catch (error) {
    console.error('Error fetching guides:', error);
    res.status(500).json({ error: 'Failed to fetch guides' });
  }
});

// Add new crop
router.post('/',
  authenticateToken,
  [
    body('name').trim().notEmpty().withMessage('Crop name is required'),
    body('area').isFloat({ min: 0.1 }).withMessage('Area must be at least 0.1 acres'),
    body('planting_date').isDate().withMessage('Valid planting date is required'),
    body('expected_harvest').isDate().withMessage('Valid expected harvest date is required'),
    body('notes').optional().trim(),
    body('status').isIn(['growing', 'harvested', 'failed']).withMessage('Invalid status')
  ],
  async (req, res) => {
    try {
      const errors = validationResult(req);
      if (!errors.isEmpty()) {
        return res.status(400).json({ 
          error: 'Validation failed', 
          details: errors.array() 
        });
      }

      const { name, area, planting_date, expected_harvest, notes, status } = req.body;
      
      const [result] = await pool.execute(
        `INSERT INTO crops (
          farmer_id, name, area, planting_date, 
          expected_harvest, notes, status
        ) VALUES (?, ?, ?, ?, ?, ?, ?)`,
        [req.user.id, name, area, planting_date, expected_harvest, notes, status]
      );

      const [newCrop] = await pool.execute(
        'SELECT * FROM crops WHERE id = ?',
        [result.insertId]
      );

      res.status(201).json(newCrop[0]);
    } catch (error) {
      console.error('Error adding crop:', error);
      res.status(500).json({ error: 'Failed to add crop' });
    }
  }
);

// Update crop status
router.patch('/:id/status',
  authenticateToken,
  [
    body('status').isIn(['growing', 'harvested', 'failed']).withMessage('Invalid status'),
  ],
  async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    try {
      const [result] = await pool.execute(
        'UPDATE crops SET status = ? WHERE id = ? AND farmer_id = ?',
        [req.body.status, req.params.id, req.user.id]
      );

      if (result.affectedRows === 0) {
        return res.status(404).json({ error: 'Crop not found' });
      }

      res.json({ message: 'Crop status updated successfully' });
    } catch (error) {
      console.error('Error updating crop status:', error);
      res.status(500).json({ error: 'Failed to update crop status' });
    }
  }
);

// Admin routes for crop guides
router.post('/guides',
  authenticateToken,
  [
    body('crop_name').trim().notEmpty(),
    body('soil_type').trim().notEmpty(),
    body('water_requirements').trim().notEmpty(),
    body('season').trim().notEmpty(),
    body('fertilizer_recommendations').trim().notEmpty(),
    body('pest_control').trim().notEmpty(),
    body('harvesting_tips').trim().notEmpty(),
  ],
  async (req, res) => {
    // Check if user is admin
    if (req.user.role !== 'admin') {
      return res.status(403).json({ error: 'Only admins can add crop guides' });
    }

    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    try {
      const {
        crop_name,
        soil_type,
        water_requirements,
        season,
        fertilizer_recommendations,
        pest_control,
        harvesting_tips
      } = req.body;

      const [result] = await pool.execute(
        `INSERT INTO crop_guides (
          crop_name, soil_type, water_requirements, season,
          fertilizer_recommendations, pest_control, harvesting_tips, created_by
        ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
        [
          crop_name, soil_type, water_requirements, season,
          fertilizer_recommendations, pest_control, harvesting_tips, req.user.id
        ]
      );

      const [newGuide] = await pool.execute(
        'SELECT * FROM crop_guides WHERE id = ?',
        [result.insertId]
      );

      res.status(201).json(newGuide[0]);
    } catch (error) {
      console.error('Error adding crop guide:', error);
      res.status(500).json({ error: 'Failed to add crop guide' });
    }
  }
);

export default router;