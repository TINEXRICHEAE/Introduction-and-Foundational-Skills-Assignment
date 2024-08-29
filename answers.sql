-- Part 2: Creating a database
CREATE DATABASE hospital_db;
-- Select the database to use
USE hospital_db;
-- Part 3: Creating tables
-- Create the patients table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    language VARCHAR(50) NOT NULL
);
-- Create the providers table
CREATE TABLE providers (
    provider_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    provider_speciality VARCHAR(50) NOT NULL,
    email_address VARCHAR(100),
    phone_number VARCHAR(15),
    date_joined DATE NOT NULL
);
-- Create the visits table
CREATE TABLE visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    provider_id INT NOT NULL,
    date_of_visit DATE NOT NULL,
    date_scheduled DATE NOT NULL,
    visit_department_id INT,
    visit_type VARCHAR(50) NOT NULL,
    blood_pressure_systollic INT,
    blood_pressure_diastollic DECIMAL(5, 2),
    pulse DECIMAL(5, 2),
    visit_status VARCHAR(50) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (provider_id) REFERENCES providers(provider_id)
);
-- Create the ed_visits table
CREATE TABLE ed_visits (
    ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
    visit_id INT NOT NULL,
    patient_id INT NOT NULL,
    acuity INT NOT NULL,
    reason_for_visit VARCHAR(255) NOT NULL,
    disposition VARCHAR(255) NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES visits(visit_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
-- Create the admissions table
CREATE TABLE admissions (
    admission_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT NOT NULL,
    admission_date DATE NOT NULL,
    discharge_date DATE NOT NULL,
    discharge_disposition VARCHAR(255) NOT NULL,
    service VARCHAR(50) NOT NULL,
    primary_diagnosis VARCHAR(255) NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
-- Create the discharges table
CREATE TABLE discharges (
    discharge_id INT PRIMARY KEY AUTO_INCREMENT,
    admission_id INT NOT NULL,
    patient_id INT NOT NULL,
    discharge_date DATE NOT NULL,
    discharge_disposition VARCHAR(255) NOT NULL,
    FOREIGN KEY (admission_id) REFERENCES admissions(admission_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
-- Show all the tables
SHOW TABLES;