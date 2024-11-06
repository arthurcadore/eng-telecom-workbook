USE cafeteira;

CREATE TABLE logs (
	    `id` INT AUTO_INCREMENT PRIMARY KEY,
	    `cartao` VARCHAR(16),
	    `tipo_cafe` INT(1),
	    `data` TIMESTAMP,
	    `total_devido` INT(1),
);

CREATE TABLE cadastrados (
	    `id` INT AUTO_INCREMENT PRIMARY KEY,
	    `cartao` VARCHAR(16),
	    `email` VARCHAR(16),
	    `reais` VARCHAR(16),
);


CREATE USER 'cafeteira'@'%' IDENTIFIED BY 'cafeteira#123';

GRANT ALL PRIVILEGES ON cafeteira.* TO 'cafeteira'@'%';

FLUSH PRIVILEGES;
