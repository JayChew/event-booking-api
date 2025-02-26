-- Create database
CREATE DATABASE eventdb;

-- Use the database (For MySQL only; PostgreSQL users should connect separately)
USE eventdb;

-- Create the events table
CREATE TABLE events (
    id SERIAL PRIMARY KEY,          -- Auto-increment ID
    title VARCHAR(255) NOT NULL,    -- Event title
    description TEXT,               -- Event description
    date DATE NOT NULL,             -- Event date
    location VARCHAR(255) NOT NULL, -- Event location
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Created timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Updated timestamp
    deleted_at TIMESTAMP -- Delete timestamp
);

-- Ensure updated_at is updated automatically
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_timestamp
BEFORE UPDATE ON events
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Insert dummy data
INSERT INTO events (title, description, date, location) VALUES
('Tech Conference 2025', 'A conference on the latest in technology.', '2025-05-15', 'New York, USA'),
('Music Festival', 'A grand festival featuring top artists.', '2025-06-20', 'Los Angeles, USA'),
('Startup Pitch Event', 'Entrepreneurs pitch their startup ideas.', '2025-07-10', 'San Francisco, USA'),
('Art Exhibition', 'A showcase of contemporary artworks.', '2025-08-05', 'Paris, France'),
('Sports Championship', 'An international sports championship.', '2025-09-25', 'Tokyo, Japan'),
('Coding Bootcamp', 'A 3-day intensive programming workshop.', '2025-10-15', 'Berlin, Germany');

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);