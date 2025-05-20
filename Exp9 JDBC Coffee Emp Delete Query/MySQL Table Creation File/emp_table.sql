-- Use the test database (make sure it exists)
USE test;

-- Create Emp table
CREATE TABLE IF NOT EXISTS Emp (
    Emp_NO INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Basicsalary INT
);
