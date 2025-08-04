-- Criar e usar a base de dados
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

-- Tabelas
CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL
);

CREATE TABLE Funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    altura DECIMAL(4,2) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    id_departamento INT NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamentos(id_departamento)
);


-- Departamentos
INSERT INTO Departamentos (id_departamento, nome_departamento) VALUES
(1, 'Recursos Humanos'),
(2, 'Marketing'),
(3, 'Informática');

-- Funcionários
INSERT INTO Funcionarios (id_funcionario, nome_funcionario, data_nascimento, altura, cidade, id_departamento) VALUES
(1, 'João Silva', '1985-04-10', 1.85, 'Porto', 3),
(2, 'Maria Costa', NULL, 1.70, 'Valença', 3),
(3, 'Ana Rocha', '1990-06-25', 1.90, 'Lisboa', 1),
(4, 'Pedro Fonseca', '1981-11-13', 1.65, 'Valença', 2);

SELECT nome_funcionario
FROM Funcionarios F
JOIN Departamentos D ON F.id_departamento = D.id_departamento
WHERE D.nome_departamento = 'Recursos Humanos' AND F.altura > 1.80
ORDER BY nome_funcionario;

SELECT AVG(altura) AS media_altura
FROM Funcionarios F
JOIN Departamentos D ON F.id_departamento = D.id_departamento
WHERE D.nome_departamento = 'Marketing';

SELECT nome_funcionario
FROM Funcionarios F
JOIN Departamentos D ON F.id_departamento = D.id_departamento
WHERE D.nome_departamento = 'Informática' AND F.cidade IN ('Valença', 'Porto');

SELECT nome_funcionario, nome_departamento
FROM Funcionarios F
JOIN Departamentos D ON F.id_departamento = D.id_departamento
WHERE data_nascimento BETWEEN '1980-01-01' AND '1989-12-31';

SELECT nome_funcionario
FROM Funcionarios
WHERE altura = (SELECT MIN(altura) FROM Funcionarios);

SELECT id_funcionario, nome_funcionario
FROM Funcionarios
WHERE data_nascimento IS NULL;

SELECT COUNT(*) AS total_funcionarios
FROM Funcionarios;

SELECT nome_funcionario, altura
FROM Funcionarios
ORDER BY altura DESC, nome_funcionario;

SELECT nome_funcionario, data_nascimento
FROM Funcionarios
WHERE MONTH(data_nascimento) = MONTH(CURDATE()) + 1
ORDER BY DAY(data_nascimento);
