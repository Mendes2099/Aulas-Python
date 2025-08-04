CREATE DATABASE IF NOT EXISTS countries;
USE countries;

CREATE TABLE IF NOT EXISTS continents (
    continent_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS languages (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS regions (
    region_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    continent_id INT,
    CONSTRAINT fk_regions_continent FOREIGN KEY (continent_id) REFERENCES continents(continent_id)
);

CREATE TABLE IF NOT EXISTS countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    area DECIMAL(10, 2) NOT NULL,
    national_day DATE,
    country_code2 CHAR(2) NOT NULL UNIQUE,
    country_code3 CHAR(3) NOT NULL UNIQUE,
    region_id INT,
    CONSTRAINT fk_countries_region FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

CREATE TABLE IF NOT EXISTS country_stats (
    country_id INT,
    year YEAR,
    population INT,
    gdp DECIMAL(15, 0),
    PRIMARY KEY (country_id, year),
    CONSTRAINT fk_country_stats_country FOREIGN KEY (country_id) REFERENCES countries(country_id)
);

CREATE TABLE IF NOT EXISTS country_languages (
    country_id INT,
    language_id INT,
    official TINYINT(1) NOT NULL,
    PRIMARY KEY (country_id, language_id),
    CONSTRAINT fk_country_languages_country FOREIGN KEY (country_id) REFERENCES countries(country_id),
    CONSTRAINT fk_country_languages_language FOREIGN KEY (language_id) REFERENCES languages(language_id)
);

DROP DATABASE countries

CREATE DATABASE IF NOT EXISTS countries;
USE countries;

CREATE TABLE IF NOT EXISTS continents(
continent_id INT,
name VARCHAR(255)
);

ALTER TABLE continents ADD PRIMARY KEY(continent_id);
ALTER TABLE continents DROP PRIMARY KEY;
ALTER TABLE continents DROP PRIMARY KEY;
ALTER TABLE continents MODIFY COLUMN name VARCHAR(255) NOT NULL;

ALTER TABLE regions MODIFY COLUMN region_id AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE regions MODIFY COLUMN name VARCHAR(100) NOT NULL;
ALTER TABLE regions ADD CONSTRAINT fk_continents FOREIGN KEY (continent_id);