-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS countries;
USE countries;

-- Remove tabelas existentes para evitar conflitos
DROP TABLE IF EXISTS countries;
DROP TABLE IF EXISTS regions;
DROP TABLE IF EXISTS continents;

-- Criação das tabelas
CREATE TABLE continents (
    continent_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE regions (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    continent_id INT,
    CONSTRAINT fk_regions_continent FOREIGN KEY (continent_id) REFERENCES continents(continent_id)
);

CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    area DECIMAL(10, 2) NOT NULL,
    national_day DATE,
    country_code2 CHAR(2) NOT NULL UNIQUE,
    country_code3 CHAR(3) NOT NULL UNIQUE,
    region_id INT,
    CONSTRAINT fk_countries_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Inserção de dados de exemplo (para testar as consultas)
INSERT INTO continents (continent_id, name) VALUES 
(1, 'Europa'),
(2, 'Ásia');

INSERT INTO regions (region_id, name, continent_id) VALUES 
(1, 'Europa Ocidental', 1),
(2, 'Europa Oriental', 1),
(3, 'Ásia Central', 2);

INSERT INTO countries (country_id, name, area, national_day, country_code2, country_code3, region_id) VALUES 
(1, 'França', 643801.00, '1789-07-14', 'FR', 'FRA', 1),
(2, 'Alemanha', 357582.00, '1990-10-03', 'DE', 'DEU', 1),
(3, 'Rússia', 17125191.00, '1990-06-12', 'RU', 'RUS', 2),
(4, 'Cazaquistão', 2724900.00, '1991-12-16', 'KZ', 'KAZ', 3),
(5, 'Polónia', 312696.00, '1918-11-11', 'PL', 'POL', 2);

-- Consultas solicitadas
-- 1. Maior área entre todos os países
SELECT name, area
FROM countries
WHERE area = (SELECT MAX(area) FROM countries);

-- 2. Maior área entre todos os países por region_id
SELECT c.region_id, r.name AS region_name, c.name AS country_name, MAX(c.area) AS max_area
FROM countries c
JOIN regions r ON c.region_id = r.region_id
GROUP BY c.region_id, r.name;

-- 3. Maior área entre todos os países por nome de região
SELECT r.name AS region_name, c.name AS country_name, MAX(c.area) AS max_area
FROM countries c
JOIN regions r ON c.region_id = r.region_id
GROUP BY r.name;

-- 4. Maior área entre todos os países por nome de região em que a área seja superior a 1000000 (um milhão de km²)
SELECT r.name AS region_name, c.name AS country_name, MAX(c.area) AS max_area
FROM countries c
JOIN regions r ON c.region_id = r.region_id
WHERE c.area > 1000000
GROUP BY r.name
HAVING MAX(c.area) > 1000000;