-- Considere o seguinte problema:
-- Imagine que tinha sido contratado para desenhar e implementar uma base de dados que permita
-- a uma biblioteca de uma Universidade catalogar as suas obras (livros, publicações, artigos
-- científicos), bem como armazenar informação sobre os seus utilizadores, e o registo de todos as
-- requisições feitas pelos alunos.
-- A base de dados deve ter em conta os seguintes aspectos:
--  Para cada obra é necessário guardar o seu código de identificação, o nome da obra, autor
-- ou autores, ano de publicação, localidade onde foi publicada, editora, domínio da obra,
-- tipo de obra e local onde está arrumada (andar, estante, prateleira).
--  O domínio da obra pode ser ciência, história, línguas, etc.
--  O tipo de obra pode ser Livro, Publicação, artigo, mas quando a biblioteca crescer é
-- provável que seja necessário haver novos tipos de obra.
--  Para cada Editora é necessário guardar o nome da Editora, a localidade e o seu País.
--  Para cada Autor é necessário guardar o seu nome (nome próprio e de família) e
-- nacionalidade.
--  Para cada aluno é apenas necessário saber o seu código de aluno, nome completo e o
-- curso que frequenta.
--  Existem dezenas de cursos nesta Universidade.
--  Quando um aluno requisita uma obra, é necessário guardar a hora e a data da requisição,
-- hora e data de entrega e claro que obra(s) requisitou.
-- 1. Faça o Modelo ER para o problema apresentado
-- 2. Faça o Diagrama ER do Modelo criado na pergunta anterior
-- 3. Converta o Modelo ER para o Modelo Relacional
-- 4. Crie o Diagrama de Modelo Relacional

-- !ER
Obra

id_obra (PK)

titulo

ano_publicacao

local_publicacao

tipo_obra (FK)

dominio (FK)

editora_id (FK)

localizacao (andar, estante, prateleira)

Autor

id_autor (PK)

nome_proprio

nome_familia

nacionalidade

Editora

id_editora (PK)

nome

localidade

pais

Aluno

id_aluno (PK)

nome_completo

curso

Requisicao

id_requisicao (PK)

data_hora_requisicao

data_hora_entrega

id_aluno (FK)

TipoObra

id_tipo (PK)

descricao

Dominio

id_dominio (PK)

descricao
-- !
[Obra]──(N:M)──[Autor]
   |               |
 [TipoObra]     [Editora]
   |
[Dominio]

[Aluno]──(1:N)──[Requisicao]──(N:M)──[Obra]

-- ! MR
-- Remove a base de dados se já existir (útil para testes)
DROP DATABASE IF EXISTS biblioteca_universitaria;

-- Cria a base de dados
CREATE DATABASE biblioteca_universitaria;

-- Usa a base de dados
USE biblioteca_universitaria;

-- Tabela de Tipos de Obra
CREATE TABLE TipoObra (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

-- Tabela de Domínios
CREATE TABLE Dominio (
    id_dominio INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

-- Tabela de Editoras
CREATE TABLE Editora (
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    localidade VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

-- Tabela de Obras
CREATE TABLE Obra (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao YEAR,
    local_publicacao VARCHAR(100),
    tipo_obra INT,
    dominio INT,
    editora_id INT,
    andar VARCHAR(10),
    estante VARCHAR(10),
    prateleira VARCHAR(10),
    FOREIGN KEY (tipo_obra) REFERENCES TipoObra(id_tipo),
    FOREIGN KEY (dominio) REFERENCES Dominio(id_dominio),
    FOREIGN KEY (editora_id) REFERENCES Editora(id_editora)
);

-- Tabela de Autores
CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome_proprio VARCHAR(100) NOT NULL,
    nome_familia VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50)
);

-- Tabela de relação entre Obras e Autores (N:N)
CREATE TABLE Obra_Autor (
    id_obra INT,
    id_autor INT,
    PRIMARY KEY (id_obra, id_autor),
    FOREIGN KEY (id_obra) REFERENCES Obra(id_obra),
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor)
);

-- Tabela de Alunos
CREATE TABLE Aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    curso VARCHAR(100) NOT NULL
);

-- Tabela de Requisições
CREATE TABLE Requisicao (
    id_requisicao INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_requisicao DATETIME NOT NULL,
    data_hora_entrega DATETIME,
    id_aluno INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

-- Tabela de relação entre Requisições e Obras (N:N)
CREATE TABLE Requisicao_Obra (
    id_requisicao INT,
    id_obra INT,
    PRIMARY KEY (id_requisicao, id_obra),
    FOREIGN KEY (id_requisicao) REFERENCES Requisicao(id_requisicao),
    FOREIGN KEY (id_obra) REFERENCES Obra(id_obra)
);
