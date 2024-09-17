USE syslogdb;

CREATE TABLE logs (
	    `id` INT AUTO_INCREMENT PRIMARY KEY,
	    `cartao` VARCHAR(16),
	    `tipo_cafe` INT(1),
	    `email` VARCHAR(16),
	    `data` TIMESTAMP,
	    `total_devido` INT(1),
);

CREATE TABLE cadastrados (
	    `id` INT AUTO_INCREMENT PRIMARY KEY,
	    `cartao` VARCHAR(16),
	    `email` VARCHAR(16),
);


CREATE USER 'syslogserver'@'%' IDENTIFIED BY 'Syslog#123db';

GRANT ALL PRIVILEGES ON syslogdb.* TO 'syslogserver'@'%';

FLUSH PRIVILEGES;
