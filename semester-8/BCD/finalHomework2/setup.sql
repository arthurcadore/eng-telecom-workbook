USE arthurcadore;

CREATE TABLE Aluno (
    matricula INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL
);

CREATE TABLE Curso (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    minCredits INT NOT NULL
);

CREATE TABLE Disciplina (
    id INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    creditos INT NOT NULL
);

CREATE TABLE Professor (
    matricula INT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    nivel_graduacao VARCHAR(255) NOT NULL
);

CREATE TABLE Cursa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_matricula INT,
    ts_inicio DATE NOT NULL,
    ts_fim DATE,
    nota DECIMAL(5,2),
    FOREIGN KEY (aluno_matricula) REFERENCES Aluno(matricula)
);

CREATE TABLE Ofertada (
    id INT PRIMARY KEY AUTO_INCREMENT,
    curso_id INT,
    ts_inicio DATE NOT NULL,
    ts_final DATE NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);

CREATE TABLE aluno_cursa (
    aluno_matricula INT,
    cursa_id INT,
    PRIMARY KEY (aluno_matricula, cursa_id),
    FOREIGN KEY (aluno_matricula) REFERENCES Aluno(matricula),
    FOREIGN KEY (cursa_id) REFERENCES Cursa(id)
);

CREATE TABLE oferta_professor (
    ofertada_id INT,
    professor_matricula INT,
    PRIMARY KEY (ofertada_id, professor_matricula),
    FOREIGN KEY (ofertada_id) REFERENCES Ofertada(id),
    FOREIGN KEY (professor_matricula) REFERENCES Professor(matricula)
);

CREATE TABLE oferta_disciplina (
    ofertada_id INT,
    disciplina_id INT,
    PRIMARY KEY (ofertada_id, disciplina_id),
    FOREIGN KEY (ofertada_id) REFERENCES Ofertada(id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id)
);

CREATE TABLE cursa_disciplina (
    cursa_id INT,
    disciplina_id INT,
    PRIMARY KEY (cursa_id, disciplina_id),
    FOREIGN KEY (cursa_id) REFERENCES Cursa(id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id)
);

CREATE TABLE cursa_curso (
    cursa_id INT,
    curso_id INT,
    PRIMARY KEY (cursa_id, curso_id),
    FOREIGN KEY (cursa_id) REFERENCES Cursa(id),
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);

CREATE TABLE oferta_curso (
    ofertada_id INT,
    curso_id INT,
    PRIMARY KEY (ofertada_id, curso_id),
    FOREIGN KEY (ofertada_id) REFERENCES Ofertada(id),
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);

CREATE USER 'arthurcadore'@'%' IDENTIFIED BY 'arthurcadore';
GRANT ALL PRIVILEGES ON syslogdb.* TO 'arthurcadore'@'%';
FLUSH PRIVILEGES;