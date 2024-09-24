USE ifsc;

CREATE TABLE alunos (
	    `id_matricula` INT,
	    `nome` VARCHAR(50),
	    `usuario` VARCHAR(50)
		`email` VARCHAR(50),
		`senha` VARCHAR(200),
);

CREATE TABLE cursos (
	    `id_curso` INT,
	    `nome_curso` VARCHAR(50),
	    `duracao_minima` FLOAT,
		`duracao_maxima` FLOAT,
);

CREATE TABLE ingresso (
	    `id_matricula` INT,
	    `id_cursos` INT,
	    `data_ingresso` TIMESTAMP, 
);

CREATE TABLE cursos_campos (
	    `id_campus` INT,
	    `id_cursos` INT,
);

CREATE TABLE campus (
	    `id_campus` INT,
	    `nome_campus` VARCHAR(50),
		`cidade` VARCHAR(50),
		`estado` VARCHAR(50),
);

CREATE TABLE funcionario (
		`id_funcionario` INT,
	    `nome` VARCHAR(50),
		`email` VARCHAR(50),
		`senha` VARCHAR(200),
		`tipo` INT,
);

CREATE TABLE funcionario_campus (
		`id_funcionario` INT,
	    `id_campus` INT,
);

CREATE TABLE funcionario_tipos (
		`id_tipo` INT,
		`nome_tipo` VARCHAR(50),
);

CREATE USER 'ifsc'@'%' IDENTIFIED BY 'ifsc#123';

GRANT ALL PRIVILEGES ON ifsc.* TO 'ifsc'@'%';

FLUSH PRIVILEGES;
