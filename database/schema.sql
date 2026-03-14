CREATE DATABASE campus_gate_manager;
USE campus_gate_manager
SHOW DATABASES;
CREATE TABLE users(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
email VARCHAR(100) UNIQUE,
password VARCHAR(100),
role VARCHAR(50),
created_by INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE students(
id INT PRIMARY KEY AUTO_INCREMENT,
student_name VARCHAR(100),
register_number VARCHAR(50),
department VARCHAR(50),
year INT,
parent_phone VARCHAR(15),
user_id INT,
FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE outpass_requests(
id INT PRIMARY KEY AUTO_INCREMENT,
student_id INT,
reason TEXT,
out_time DATETIME,
return_time DATETIME,
status VARCHAR(20) DEFAULT 'PENDING',
approved_by INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(student_id) REFERENCES students(id),
FOREIGN KEY(approved_by) REFERENCES users(id)
);

CREATE TABLE visitors(
id INT PRIMARY KEY AUTO_INCREMENT,
visitor_name VARCHAR(100),
phone VARCHAR(15),
purpose TEXT,
person_to_meet VARCHAR(100),
entry_time DATETIME,
exit_time DATETIME,
entered_by INT,
FOREIGN KEY(entered_by) REFERENCES users(id)
);

CREATE TABLE bus_logs(
id INT PRIMARY KEY AUTO_INCREMENT,
bus_number VARCHAR(50),
driver_name VARCHAR(100),
arrival_time DATETIME,
departure_time DATETIME,
entered_by INT,
FOREIGN KEY(entered_by) REFERENCES users(id)
);

CREATE TABLE notifications(
id INT PRIMARY KEY AUTO_INCREMENT,
message TEXT,
user_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY(user_id) REFERENCES users(id)
);

SHOW TABLES;

INSERT INTO users(name,email,password,role)
VALUES
('Managing Director','md@college.com','1234','MD'),
('Principal','principal@college.com','1234','PRINCIPAL'),
('Watchman','watchman@college.com','1234','WATCHMAN');

SELECT * FROM users;
