create database if not exists biblio;
use biblio;

CREATE TABLE Editora (
    codigo_editora INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localidade VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

CREATE TABLE Autor (
    codigo_autor INT PRIMARY KEY,
    nome_proprio VARCHAR(100) NOT NULL,
    nome_familia VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(100)
);

CREATE TABLE Dominio (
    codigo_dominio INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE Tipo_Obra (
    codigo_tipo INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL -- ,
    -- prazo_max_requisicao INT NOT NULL
);

CREATE TABLE Departamento (
    codigo_departamento INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Curso (
    codigo_curso INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    codigo_departamento INT,
    FOREIGN KEY (codigo_departamento) REFERENCES Departamento(codigo_departamento)
);

CREATE TABLE Aluno (
    codigo_aluno INT PRIMARY KEY,
    nome_completo VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    data_registo TIMESTAMP NOT NULL,
    codigo_curso INT,
    FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso)
);

CREATE TABLE Obra (
    codigo_obra INT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    isbn VARCHAR(13),
    doi VARCHAR(100),
    ano_publicacao INT,
    num_exemplares INT NOT NULL DEFAULT 1 CHECK(num_exemplares >= 0),
    estado VARCHAR(20) NOT NULL,
    data_aquisicao TIMESTAMP NOT NULL,
    estado_fisico VARCHAR(50),
    codigo_editora INT NOT NULL,
    codigo_dominio INT NOT NULL,
    codigo_tipo INT NOT NULL,
    FOREIGN KEY (codigo_editora) REFERENCES Editora(codigo_editora),
    FOREIGN KEY (codigo_dominio) REFERENCES Dominio(codigo_dominio),
    FOREIGN KEY (codigo_tipo) REFERENCES Tipo_Obra(codigo_tipo)
);

CREATE TABLE Localizacao (
    codigo_local INT PRIMARY KEY,
    andar INT NOT NULL,
    estante VARCHAR(10) NOT NULL,
    prateleira INT NOT NULL,
    codigo_obra INT NOT NULL,
    FOREIGN KEY (codigo_obra) REFERENCES Obra(codigo_obra)
);

CREATE TABLE Obra_Autor (
    codigo_obra INT,
    codigo_autor INT,
    PRIMARY KEY (codigo_obra, codigo_autor),
    FOREIGN KEY (codigo_obra) REFERENCES Obra(codigo_obra),
    FOREIGN KEY (codigo_autor) REFERENCES Autor(codigo_autor)
);

CREATE TABLE Requisicao (
    codigo_requisicao INT PRIMARY KEY,
    codigo_obra INT,
    codigo_aluno INT,
    data_requisicao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	data_prevista_entrega DATETIME NOT NULL,
    data_entrega_efetiva DATETIME NOT NULL,
    multa DECIMAL(10,2),
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (codigo_obra) REFERENCES Obra(codigo_obra),
    FOREIGN KEY (codigo_aluno) REFERENCES Aluno(codigo_aluno)
);