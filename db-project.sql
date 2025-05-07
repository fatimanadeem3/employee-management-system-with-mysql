-- Drop existing database if you want a clean setup
DROP DATABASE IF EXISTS employee_management;

-- Create new database
CREATE DATABASE employee_management;
USE employee_management;

-- Create domains table
CREATE TABLE domains (
    id INT AUTO_INCREMENT PRIMARY KEY,
    domain_name VARCHAR(100) NOT NULL UNIQUE
);

-- Create departments table
CREATE TABLE departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    domain_id INT,
    FOREIGN KEY (domain_id) REFERENCES domains(id)
);

-- Create employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE NOT NULL,
    position VARCHAR(100),
    salary INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

-- Insert initial domain data
INSERT INTO domains (domain_name) VALUES ('Education'), ('Business'), ('Medical');

-- Insert sample departments
INSERT INTO departments (department_name, domain_id) VALUES
('Computer Science', 1),
('Mathematics', 1),
('HR', 2),
('Finance', 2),
('Surgery', 3),
('Radiology', 3);

-- (Optional) Insert sample employees
INSERT INTO employees (name, dob, position, salary, department_id) VALUES
('Ali Khan', '1990-05-20', 'Lecturer', 70000, 1),
('Sara Ahmed', '1985-07-15', 'HR Manager', 90000, 3),
('Dr. Usman', '1978-03-12', 'Surgeon', 150000, 5);


