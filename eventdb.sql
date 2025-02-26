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
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP -- Updated timestamp
);

-- Insert dummy data
INSERT INTO events (title, description, date, location) VALUES
('Tech Conference 2025', 'A conference on the latest in technology.', '2025-05-15', 'New York, USA'),
('Music Festival', 'A grand festival featuring top artists.', '2025-06-20', 'Los Angeles, USA'),
('Startup Pitch Event', 'Entrepreneurs pitch their startup ideas.', '2025-07-10', 'San Francisco, USA'),
('Art Exhibition', 'A showcase of contemporary artworks.', '2025-08-05', 'Paris, France'),
('Sports Championship', 'An international sports championship.', '2025-09-25', 'Tokyo, Japan'),
('Coding Bootcamp', 'A 3-day intensive programming workshop.', '2025-10-15', 'Berlin, Germany');