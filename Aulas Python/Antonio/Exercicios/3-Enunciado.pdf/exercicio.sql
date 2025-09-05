CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

CREATE TABLE Departamentos (
    id_departamento INT PRIMARY KEY,         -- Identificador único do departamento
    nome_departamento VARCHAR(100) NOT NULL  -- Nome do departamento
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

INSERT INTO Departamentos (id_departamento, nome_departamento) VALUES
(1, 'Recursos Humanos'),
(2, 'Marketing'),
(3, 'Informática');

INSERT INTO Funcionarios (id_funcionario, nome_funcionario, data_nascimento, altura, cidade, id_departamento) VALUES
(1, 'João Silva', '1985-04-10', 1.85, 'Porto', 3),
(2, 'Maria Costa', NULL, 1.70, 'Valença', 3),
(3, 'Ana Rocha', '1990-06-25', 1.90, 'Lisboa', 1),
(4, 'Pedro Fonseca', '1981-11-13', 1.65, 'Valença', 2);

-- a) Funcionários do departamento de Recursos Humanos com mais de 1.80m
SELECT nome_funcionario
FROM Funcionarios F
JOIN Departamentos D ON F.id_departamento = D.id_departamento
WHERE D.nome_departamento = 'Recursos Humanos'
  AND F.altura > 1.80
ORDER BY nome_funcionario;

-- b) Média de altura dos funcionários do departamento de Marketing
SELECT AVG(altura) AS media_altura
FROM Funcionarios F
JOIN Departamentos D ON F.id_departamento = D.id_departamento
WHERE D.nome_departamento = 'Marketing';

-- c) Funcionários de Valença ou Porto no departamento de Informática
SELECT nome_funcionario
FROM Funcionarios F
JOIN Departamentos D ON F.id_departamento = D.id_departamento
WHERE D.nome_departamento = 'Informática'
  AND F.cidade IN ('Valença', 'Porto');

-- d) Funcionários nascidos na década de 1980
SELECT nome_funcionario, nome_departamento
FROM Funcionarios F
JOIN Departamentos D ON F.id_departamento = D.id_departamento
WHERE data_nascimento BETWEEN '1980-01-01' AND '1989-12-31';

-- e) Funcionário mais baixo
SELECT nome_funcionario
FROM Funcionarios
WHERE altura = (SELECT MIN(altura) FROM Funcionarios);

-- f) Funcionários sem data de nascimento registada
SELECT id_funcionario, nome_funcionario
FROM Funcionarios
WHERE data_nascimento IS NULL;

-- g) Total de funcionários
SELECT COUNT(*) AS total_funcionarios
FROM Funcionarios;

-- h) Funcionários ordenados por altura (desc) e depois por nome
SELECT nome_funcionario, altura
FROM Funcionarios
ORDER BY altura DESC, nome_funcionario;

-- i) Funcionários que fazem anos no próximo mês
SELECT nome_funcionario, data_nascimento
FROM Funcionarios
WHERE MONTH(data_nascimento) = MONTH(DATE_ADD(CURDATE(), INTERVAL 1 MONTH))
ORDER BY DAY(data_nascimento);
