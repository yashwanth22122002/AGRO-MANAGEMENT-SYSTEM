import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';
import productsRouter from './routes/products.js';
import loansRouter from './routes/loans.js';
import weatherRouter from './routes/weather.js';
import authRouter from './routes/auth.js';
import ordersRouter from './routes/orders.js';
import dashboardRouter from './routes/dashboard.js';
import cropsRouter from './routes/crops.js';
import fieldsRouter from './routes/fields.js';
import pool, { initializeDatabase } from './database/init.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(express.json());
app.use(cors({
  origin: 'http://localhost:5173',
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

// Initialize database and start server
const startServer = async () => {
  try {
    await initializeDatabase();
    console.log('Database initialized successfully');

    // Routes
    app.use('/api/auth', authRouter);
    app.use('/api/products', productsRouter);
    app.use('/api/loans', loansRouter);
    app.use('/api/weather', weatherRouter);
    app.use('/api/orders', ordersRouter);
    app.use('/api/dashboard', dashboardRouter);
    app.use('/api/crops', cropsRouter);
    app.use('/api/fields', fieldsRouter);

    app.listen(PORT, () => {
      console.log(`Server running on port ${PORT}`);
    });
  } catch (error) {
    console.error('Failed to start server:', error);
    process.exit(1);
  }
};

startServer();