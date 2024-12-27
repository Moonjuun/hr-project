-- 데이터베이스 존재 여부 확인 후 생성
CREATE DATABASE IF NOT EXISTS hr_db;

USE hr_db;

-- departments 테이블 생성
CREATE TABLE IF NOT EXISTS departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

-- positions 테이블 생성
CREATE TABLE IF NOT EXISTS positions (
    position_id INT AUTO_INCREMENT PRIMARY KEY,
    position_name VARCHAR(100) NOT NULL UNIQUE
);

-- qualifications 테이블 생성
CREATE TABLE IF NOT EXISTS qualifications (
    qualification_id INT AUTO_INCREMENT PRIMARY KEY,
    qualification_name VARCHAR(100) NOT NULL UNIQUE
);

-- candidates 테이블 생성
CREATE TABLE IF NOT EXISTS candidates (
    candidate_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    position_id INT NOT NULL,
    age INT NOT NULL,
    gender ENUM('남', '여') NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    education_level VARCHAR(50),
    experience_years INT,
    desired_start_date DATE,
    current_status VARCHAR(50) DEFAULT '면접대기',
    desired_salary VARCHAR(50),
    interview_score INT,
    evaluator_name VARCHAR(100),
    interview_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (position_id) REFERENCES positions(position_id)
);

-- candidate_qualifications 테이블 생성
CREATE TABLE IF NOT EXISTS candidate_qualifications (
    candidate_id INT NOT NULL,
    qualification_id INT NOT NULL,
    PRIMARY KEY (candidate_id, qualification_id),
    FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id),
    FOREIGN KEY (qualification_id) REFERENCES qualifications(qualification_id)
);

-- employee_information 테이블 생성
CREATE TABLE IF NOT EXISTS employee_information (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender ENUM('M', 'F', 'Other') NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    education VARCHAR(255),
    experience TEXT,
    desired_join_date DATE,
    certifications TEXT,
    current_status VARCHAR(100),
    desired_salary DECIMAL(10, 2),
    interview_score DECIMAL(5, 2),
    evaluator VARCHAR(100),
    interview_date DATE
);

-- applicants 테이블 생성
CREATE TABLE IF NOT EXISTS applicants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender ENUM('남', '여') NOT NULL,
    phone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL,
    education VARCHAR(50) NOT NULL,
    experience VARCHAR(50) NOT NULL,
    desired_join_date DATE NOT NULL,
    certification VARCHAR(50),
    current_status VARCHAR(50) NOT NULL,
    desired_salary VARCHAR(50) NOT NULL,
    interview_score INT NOT NULL,
    evaluator VARCHAR(50) NOT NULL,
    interview_date DATE NOT NULL
);
