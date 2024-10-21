-- Create the database
CREATE DATABASE OnlineRechargePortal;
USE OnlineRechargePortal;

-- Create the user_details table
CREATE TABLE user_details (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(40) NOT NULL,
    email VARCHAR(80) UNIQUE NOT NULL,
    mobileno VARCHAR(10) UNIQUE NOT NULL,
    username VARCHAR(12) UNIQUE NOT NULL,
    password VARCHAR(12) NOT NULL
);

-- Create the operator_details table
CREATE TABLE operator_details (
    operator_id INT PRIMARY KEY,
    operator_name VARCHAR(40) UNIQUE,
    company_name VARCHAR(40)
);

-- Create the recharge_plan_details table
CREATE TABLE recharge_plan_details (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    operator_id INT NOT NULL,
    plan_details VARCHAR(100) NOT NULL,
    plan_validity VARCHAR(40) NOT NULL,
    price DECIMAL(10, 2) UNIQUE NOT NULL,
    CONSTRAINT FK_operator_details1 FOREIGN KEY (operator_id)
    REFERENCES operator_details(operator_id)
);

-- Create the mobileno_details table
CREATE TABLE mobileno_details (
    mobile_no VARCHAR(10) PRIMARY KEY,
    operator_id INT NOT NULL,
    owner_name VARCHAR(20) NOT NULL,
    CONSTRAINT FK_operator_details FOREIGN KEY (operator_id)
    REFERENCES operator_details(operator_id)
);

-- Create the mobile_recharge table
CREATE TABLE mobile_recharge (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    operator_id INT NOT NULL,
    mobile_no VARCHAR(10) NOT NULL,
    plan_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_user_details FOREIGN KEY (user_id)
    REFERENCES user_details(user_id),
    CONSTRAINT FK_operator_details2 FOREIGN KEY (operator_id)
    REFERENCES operator_details(operator_id),
    CONSTRAINT FK_mobileno_details FOREIGN KEY (mobile_no)
    REFERENCES mobileno_details(mobile_no),
    CONSTRAINT FK_recharge_plan_details FOREIGN KEY (plan_id)
    REFERENCES recharge_plan_details(plan_id)
);


-- Insert data into operator_details table
INSERT INTO operator_details (operator_id, operator_name, company_name)
VALUES (101, 'VodafoneIdea', 'VI Limited'),
       (102, 'BSNL', 'BSNL INDIA'),
       (103, 'Jio', 'Reliance');

-- Insert data into mobileno_details table
INSERT INTO mobileno_details (mobile_no, operator_id, owner_name)
VALUES ('6305017061', 101, 'Koushik'),
       ('8121069426', 103, 'Uday');

-- Insert data into user_details table
INSERT INTO user_details (full_name, email, mobileno, username, password)
VALUES ('Koushik', 'koushik@gamil.com', '6305017061', 'kk123', 'kk123');

-- Insert data into mobile_recharge table
INSERT INTO mobile_recharge (user_id, operator_id, mobile_no, amount)
VALUES (1, 103, '6305017061', 49.00);
