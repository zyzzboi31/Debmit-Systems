-- CEMK Portal — Database Setup Script
-- Run this on your MySQL instance (local or Railway)

CREATE DATABASE IF NOT EXISTS cemk_db;
USE cemk_db;

-- Users table (for login)
CREATE TABLE IF NOT EXISTS user_info (
  user_id   VARCHAR(50)  NOT NULL PRIMARY KEY,
  user_pwd  VARCHAR(100) NOT NULL,
  user_role VARCHAR(20)  NOT NULL
);

-- Students table
CREATE TABLE IF NOT EXISTS student (
  student_id    VARCHAR(50)  NOT NULL PRIMARY KEY,
  student_name  VARCHAR(100) NOT NULL,
  student_email VARCHAR(100),
  student_city  VARCHAR(50),
  student_age   INT
);

-- Default admin user (change password before going live!)
INSERT IGNORE INTO user_info (user_id, user_pwd, user_role)
VALUES ('admin', 'admin123', 'admin');

-- Sample student data
INSERT IGNORE INTO student VALUES ('STU001', 'Arjun Sharma',  'arjun@email.com',  'Kolkata',   21);
INSERT IGNORE INTO student VALUES ('STU002', 'Priya Dey',     'priya@email.com',  'Siliguri',  20);
INSERT IGNORE INTO student VALUES ('STU003', 'Rahul Mondal',  'rahul@email.com',  'Howrah',    22);
