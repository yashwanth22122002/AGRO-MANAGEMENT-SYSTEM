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