CREATE DATABASE IF NOT EXISTS cirrus;
USE cirrus;

-- Table User
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    capacity INT DEFAULT 0
);

-- Table File Types
CREATE TABLE file_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL
);

-- Table Files 
CREATE TABLE files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    lenght INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    type_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    pointer BINARY(48) NOT NULL,
    FOREIGN KEY (type_id) REFERENCES file_types(id),
    FOREIGN KEY (user_id) REFERENCES user(id)
);

-- Table File-Users corrigida
CREATE TABLE file_users (
    file_id INT,
    user_id INT,
    type_id INT NOT NULL,
    lenght INT NOT NULL, 
    PRIMARY KEY (file_id, user_id),
    FOREIGN KEY (file_id) REFERENCES files(id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (type_id) REFERENCES file_types(id)
);

-- Table Structure
CREATE TABLE structure (
    directory_id INT,
    child_id INT, 
    PRIMARY KEY (directory_id, child_id),
    FOREIGN KEY (directory_id) REFERENCES files(id),
    FOREIGN KEY (child_id) REFERENCES files(id)
);

-- Usuário para conexão
CREATE USER 'backend'@'%' IDENTIFIED BY 'backendpwd';
GRANT ALL PRIVILEGES ON cirrus.* TO 'backend'@'%';
FLUSH PRIVILEGES;