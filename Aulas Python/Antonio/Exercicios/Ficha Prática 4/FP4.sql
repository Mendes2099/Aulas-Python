-- Drop tables if they exist (optional, for re-running the script)
DROP TABLE IF EXISTS Compras;
DROP TABLE IF EXISTS Carros;
DROP TABLE IF EXISTS Fornecedores;
DROP TABLE IF EXISTS Vendedores;
DROP TABLE IF EXISTS Clientes;

-- Create tables
CREATE TABLE IF NOT EXISTS Fornecedores (
    CodigoFornecedor INT PRIMARY KEY,
    NomeEmpresa VARCHAR(255),
    Endereco VARCHAR(255),
    Localidade VARCHAR(255),
    CodigoPostal VARCHAR(10),
    Telefone VARCHAR(20),
    NrContribuinte VARCHAR(20),
    Contacto VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Carros (
    CodigoCarro INT PRIMARY KEY,
    Marca VARCHAR(255),
    Modelo VARCHAR(255),
    Cilindrada INT,
    Potencia INT,
    NrPortas INT,
    DescricaoProduto TEXT
);

CREATE TABLE IF NOT EXISTS Compras (
    CodigoCompra INT PRIMARY KEY,
    CodigoFornecedor INT,
    CodigoCarro INT,
    PrecoCompra DECIMAL(10,2),
    DataCompra DATE,
    Cor VARCHAR(50),
    FOREIGN KEY (CodigoFornecedor) REFERENCES Fornecedores(CodigoFornecedor),
    FOREIGN KEY (CodigoCarro) REFERENCES Carros(CodigoCarro)
);

CREATE TABLE IF NOT EXISTS Vendedores (
    CodigoVendedor INT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Localidade VARCHAR(255),
    CodigoPostal VARCHAR(10),
    Telefone VARCHAR(20),
    NrContribuinte VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Clientes (
    CodigoCliente INT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255),
    Localidade VARCHAR(255),
    CodigoPostal VARCHAR(10),
    Telefone VARCHAR(20),
    NrContribuinte VARCHAR(20)
);

-- Insert data
-- Fornecedores
INSERT IGNORE INTO Fornecedores (CodigoFornecedor, NomeEmpresa, Endereco, Localidade, CodigoPostal, Telefone, NrContribuinte, Contacto) VALUES
(1, 'AutoSupply', 'Rua A 123', 'Porto', '4400-100', '912345678', '123456789', 'Joao Silva'),
(2, 'CarParts Ltd', 'Rua B 456', 'Lisboa', '1000-200', NULL, '987654321', 'Maria Santos'),
(3, 'GlobalCars', 'Rua C 789', 'Porto', '4400-300', '913456789', '112233445', 'Pedro Oliveira'),
(4, 'EuroMotors', 'Rua D 101', 'Braga', '4700-400', '229876543', '998877665', 'Ana Costa'),
(5, 'TechVehicles', 'Rua E 112', 'Porto', '4400-500', '914567890', '554433221', 'Luis Ferreira'),
(6, 'IdleSupply', 'Rua F 131', 'Coimbra', '3000-600', '239876543', '667788990', 'Sara Mendes');

-- Carros
INSERT IGNORE INTO Carros (CodigoCarro, Marca, Modelo, Cilindrada, Potencia, NrPortas, DescricaoProduto) VALUES
(1, 'Toyota', 'Corolla', 1600, 120, 4, 'Sedan confortável e fiável'),
(2, 'Honda', 'Civic', 1500, 130, 3, 'Hatchback desportivo'),
(3, 'Ford', 'Fiesta', 1200, 100, 3, 'Carro pequeno e económico'),
(4, 'BMW', '3 Series', 2000, 180, 4, 'Sedan de luxo'),
(5, 'Tesla', 'Model 3', 0, 250, 4, 'Carro elétrico avançado');

-- Compras
INSERT IGNORE INTO Compras (CodigoCompra, CodigoFornecedor, CodigoCarro, PrecoCompra, DataCompra, Cor) VALUES
(1, 1, 1, 15000.00, '2022-01-15', 'Azul'),
(2, 1, 2, 20000.00, '2022-03-20', 'Vermelho'),
(3, 2, 3, 12000.00, '2023-05-10', 'Preto'),
(4, 3, 1, 16000.00, '2022-07-25', 'Azul'),
(5, 1, 4, 30000.00, '2024-02-05', 'Cinza'),
(6, 4, 5, 40000.00, '2022-11-30', 'Branco'),
(7, 5, 2, 21000.00, '2023-04-15', 'Vermelho'),
(8, 1, 3, 13000.00, '2024-09-01', 'Amarelo'),
(9, 1, 1, 15500.00, '2022-06-10', 'Azul'),
(10, 1, 5, 41000.00, '2023-08-20', 'Branco');

-- Vendedores
INSERT IGNORE INTO Vendedores (CodigoVendedor, Nome, Endereco, Localidade, CodigoPostal, Telefone, NrContribuinte) VALUES
(1, 'Joao Silva', 'Rua X 100', 'Porto', '4400-001', '912000001', '100000001'),
(2, 'Maria Santos', 'Rua Y 200', 'Lisboa', '1000-002', '913000002', '200000002'),
(3, 'Pedro Oliveira', 'Rua Z 300', 'Porto', '4400-003', '914000003', '300000003'),
(4, 'Ana Costa', 'Rua W 400', 'Braga', '4700-004', '915000004', '400000004'),
(5, 'Luis Ferreira', 'Rua V 500', 'Porto', '4400-005', '916000005', '500000005');

-- Clientes
INSERT IGNORE INTO Clientes (CodigoCliente, Nome, Endereco, Localidade, CodigoPostal, Telefone, NrContribuinte) VALUES
(1, 'Cliente Um', 'Rua P 600', 'Porto', '4400-101', '917000001', '600000001'),
(2, 'Cliente Dois', 'Rua Q 700', 'Lisboa', '1000-102', '918000002', '700000002'),
(3, 'Cliente Tres', 'Rua R 800', 'Porto', '4400-103', '919000003', '800000003'),
(4, 'Cliente Quatro', 'Rua S 900', 'Braga', '4700-104', '920000004', '900000004'),
(5, 'Cliente Cinco', 'Rua T 1000', 'Porto', '4400-105', '921000005', '100000005');

-- Queries
-- a. Listar a marca e o modelo dos carros com 3 portas.
SELECT Marca, Modelo FROM Carros WHERE NrPortas = 3;

-- b. Listar os fornecedores que não tenham número de telefone, mas tenham um contacto, ordenado pelo nome.
SELECT * FROM Fornecedores WHERE Telefone IS NULL AND Contacto IS NOT NULL ORDER BY NomeEmpresa;

-- c. Listar todos modelos de carro que existem na base de dados, sem repetições.
SELECT DISTINCT Modelo FROM Carros;

-- d. Listar o nome e a localidade do fornecedor com o preço da compra maior.
SELECT F.NomeEmpresa, F.Localidade 
FROM Fornecedores F 
JOIN Compras C ON F.CodigoFornecedor = C.CodigoFornecedor 
WHERE C.PrecoCompra = (SELECT MAX(PrecoCompra) FROM Compras);

-- e. Listar os fornecedores cujo número de telefone começa por 91.
SELECT * FROM Fornecedores WHERE Telefone LIKE '91%';

-- f. Listar todos os fornecedores cujo código Postal não começa por 4400.
SELECT * FROM Fornecedores WHERE CodigoPostal NOT LIKE '4400%';

-- g. Listar o número de compras por cor, ordenado pelo número de compras, de forma descendente.
SELECT Cor, COUNT(*) AS NumCompras 
FROM Compras 
GROUP BY Cor 
ORDER BY NumCompras DESC;

-- h. Listar o nome dos fornecedores dos carros que ainda não têm nenhuma compra.
SELECT F.NomeEmpresa 
FROM Fornecedores F 
LEFT JOIN Compras C ON F.CodigoFornecedor = C.CodigoFornecedor 
WHERE C.CodigoCompra IS NULL;

-- i. Listar os vendedores que já tiveram mais de 5 carros comprados.
-- (Assuming typo in exercise; querying fornecedores as per schema)
SELECT F.NomeEmpresa 
FROM Fornecedores F 
JOIN Compras C ON F.CodigoFornecedor = C.CodigoFornecedor 
GROUP BY F.CodigoFornecedor 
HAVING COUNT(*) > 5;

-- j. Listar a cor de carro mais comprada.
SELECT Cor 
FROM Compras 
GROUP BY Cor 
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- k. Listar o nome do fornecedor com mais compras em 2022.
SELECT F.NomeEmpresa 
FROM Fornecedores F 
JOIN Compras C ON F.CodigoFornecedor = C.CodigoFornecedor 
WHERE YEAR(C.DataCompra) = 2022 
GROUP BY F.CodigoFornecedor 
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- l. Listar o carro que foi vendido mais recentemente.
SELECT CA.Marca, CA.Modelo 
FROM Carros CA 
JOIN Compras C ON CA.CodigoCarro = C.CodigoCarro 
ORDER BY C.DataCompra DESC 
LIMIT 1;