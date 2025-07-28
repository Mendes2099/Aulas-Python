-- sqlite3 movies.db
-- .tables
-- .schema (table)

-- info Tables

-- CREATE TABLE directors (
--     movie_id INTEGER NOT NULL,
--     person_id INTEGER NOT NULL,
--     FOREIGN KEY(movie_id) REFERENCES movies(id),
--     FOREIGN KEY(person_id) REFERENCES people(id)
-- );

-- CREATE TABLE movies (
--     id INTEGER,
--     title TEXT NOT NULL,
--     year NUMERIC,
--     PRIMARY KEY(id)
-- );

-- CREATE TABLE people (
--     id INTEGER,
--     name TEXT NOT NULL,
--     birth NUMERIC,
--     PRIMARY KEY(id)
-- );

-- CREATE TABLE ratings (
--     movie_id INTEGER NOT NULL,
--     rating REAL NOT NULL,
--     votes INTEGER NOT NULL,
--     FOREIGN KEY(movie_id) REFERENCES movies(id)
-- );

-- CREATE TABLE stars (
--     movie_id INTEGER NOT NULL,
--     person_id INTEGER NOT NULL,
--     FOREIGN KEY(movie_id) REFERENCES movies(id),
--     FOREIGN KEY(person_id) REFERENCES people(id)
-- );

-- Note Queries

-- 1

SELECT title FROM movies WHERE year = 2008;

-- 2

SELECT birth from people WHERE name = "Emma Stone";

-- 3.sql – List titles of all movies released on or after 2018, in alphabetical order.

SELECT title FROM movies WHERE year >= 2018 ORDER BY title;

-- 4.sql – Determine the number of movies with an IMDb rating of 10.0.

SELECT COUNT(rating) FROM ratings WHERE rating = 10.0;

-- 5.sql – List titles and release years of all Harry Potter movies, in chronological order.

SELECT title, year FROM movies WHERE title LIKE "%Harry Potter%" ORDER BY year ASC;

-- 6.sql – Determine the average rating of all movies released in 2012.

SELECT AVG(rating)
FROM ratings
JOIN movies ON ratings.movie_id = movies.id
WHERE movies.year = 2012;

-- 7.sql – List all movies released in 2010 and their ratings, in descending order by rating (then by title).

SELECT title, rating
FROM movies
LEFT JOIN ratings ON movies.id = ratings.movie_id WHERE year = 2010
ORDER BY rating DESC, title;


-- 8.sql – List names of all people who starred in Toy Story.

SELECT people.name
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE movies.title = "Toy Story";


-- 9.sql – List names of all people who starred in a movie released in 2004, ordered by birth year.

SELECT people.name 
FROM people 
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
WHERE movies.year = 2004 
ORDER BY people.birth ASC;


-- 10.sql – List names of all people who directed a movie with a rating of at least 9.0.

SELECT people.name 
FROM people 
JOIN directors ON people.id = directors.person_id
JOIN movies ON directors.movie_id = movies.id
JOIN ratings ON movies.id = ratings.movie_id
WHERE ratings.rating >= 9.0;


-- 11.sql – List the titles of the five highest rated movies that Chadwick Boseman starred in, ordered highest first.

SELECT movies.title 
FROM people
JOIN stars ON people.id = stars.person_id
JOIN movies ON stars.movie_id = movies.id
JOIN ratings ON movies.id = ratings.movie_id
WHERE people.name = "Chadwick Boseman"
ORDER BY ratings.rating DESC 
LIMIT 5;

-- 12.sql – List the titles of all movies in which both Bradley Cooper and Jennifer Lawrence starred.

SELECT title
FROM movies
WHERE id IN (
    SELECT movie_id
    FROM stars
    JOIN people ON stars.person_id = people.id
    WHERE people.name = "Bradley Cooper"
)
AND id IN (
    SELECT movie_id
    FROM stars
    JOIN people ON stars.person_id = people.id
    WHERE people.name = "Jennifer Lawrence"
);

-- 13.sql – List names of all people who starred in a movie that Kevin Bacon (born 1958) also starred in, excluding Kevin Bacon.

SELECT DISTINCT p2.name
FROM people p1
JOIN stars s1 ON p1.id = s1.person_id
JOIN stars s2 ON s1.movie_id = s2.movie_id
JOIN people p2 ON p2.id = s2.person_id
WHERE p1.name = "Kevin Bacon"
AND p2.name != "Kevin Bacon";
