-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Remove tabelas existentes para evitar conflitos
DROP TABLE IF EXISTS Funcionarios;
DROP TABLE IF EXISTS Departamentos;

-- 1. Criação das tabelas
CREATE TABLE Departamentos (
    ID_Departamento INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);

CREATE TABLE Funcionarios (
    Numero INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Data_Nascimento DATE,
    Altura DECIMAL(3,2) NOT NULL,
    Localidade VARCHAR(50) NOT NULL,
    ID_Departamento INT NOT NULL,
    FOREIGN KEY (ID_Departamento) REFERENCES Departamentos(ID_Departamento)
);

-- 2. Inserção de dados
-- Departamentos
INSERT INTO Departamentos (ID_Departamento, Nome) VALUES 
(41, 'Marketing'),
(42, 'Informática'),
(43, 'Recursos Humanos'),
(44, 'Financeiro'),
(45, 'Higiene e Segurança');

-- Funcionarios
INSERT INTO Funcionarios (Numero, Nome, Data_Nascimento, Altura, Localidade, ID_Departamento) VALUES 
(1, 'João Santos', '1980-02-24', 1.80, 'Valença', 41),
(2, 'Miguel Silva', '1966-04-02', 1.75, 'Viana do Castelo', 43),
(3, 'Carolina Sousa', '1971-11-12', 1.61, 'Valença', 44),
(4, 'Patrícia Patrício', '1975-01-31', 1.69, 'Braga', 42),
(5, 'Maria Santos', '1969-03-21', 1.85, 'Porto', 42),
(6, 'Rodrigo Gomes', NULL, 1.65, 'Viana do Castelo', 44);

-- 3. Consultas
-- a. Nome dos funcionários do Departamento de Recursos Humanos com altura > 1,80, ordenado por nome
SELECT F.Nome
FROM Funcionarios F
JOIN Departamentos D ON F.ID_Departamento = D.ID_Departamento
WHERE D.Nome = 'Recursos Humanos' AND F.Altura > 1.80
ORDER BY F.Nome;

-- b. Média de altura dos funcionários de Marketing
SELECT AVG(F.Altura) AS Media_Altura
FROM Funcionarios F
JOIN Departamentos D ON F.ID_Departamento = D.ID_Departamento
WHERE D.Nome = 'Marketing';

-- c. Nome dos funcionários de Valença ou Porto, do departamento de Informática
SELECT F.Nome
FROM Funcionarios F
JOIN Departamentos D ON F.ID_Departamento = D.ID_Departamento
WHERE F.Localidade IN ('Valença', 'Porto') AND D.Nome = 'Informática';

-- d. Nome do funcionário e departamento dos que nasceram na década de 1980
SELECT F.Nome, D.Nome AS Departamento
FROM Funcionarios F
JOIN Departamentos D ON F.ID_Departamento = D.ID_Departamento
WHERE YEAR(F.Data_Nascimento) BETWEEN 1980 AND 1989;

-- e. Nome do funcionário mais baixo
SELECT F.Nome
FROM Funcionarios F
WHERE F.Altura = (SELECT MIN(Altura) FROM Funcionarios);

-- f. Número e Nome dos funcionários sem data de nascimento
SELECT F.Numero, F.Nome
FROM Funcionarios F
WHERE F.Data_Nascimento IS NULL;

-- g. Total de funcionários
SELECT COUNT(*) AS Total_Funcionarios
FROM Funcionarios;

-- h. Lista de funcionários ordenada por altura (descendente) e nome (ascendente)
SELECT F.Numero, F.Nome, F.Altura
FROM Funcionarios F
ORDER BY F.Altura DESC, F.Nome ASC;

-- i. Nome e data de nascimento dos funcionários com aniversário no próximo mês, ordenado por dia
SELECT F.Nome, F.Data_Nascimento
FROM Funcionarios F
WHERE MONTH(F.Data_Nascimento) = MONTH(DATE_ADD(CURDATE(), INTERVAL 1 MONTH))
ORDER BY DAY(F.Data_Nascimento) ASC;