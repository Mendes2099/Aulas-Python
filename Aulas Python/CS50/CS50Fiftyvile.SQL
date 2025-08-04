sql
-- info Tables
CREATE TABLE crime_scene_reports (
    id INTEGER,
    year INTEGER,
    month INTEGER,
    day INTEGER,
    street TEXT,
    description TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE interviews (
    id INTEGER,
    name TEXT,
    year INTEGER,
    month INTEGER,
    day INTEGER,
    transcript TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE atm_transactions (
    id INTEGER,
    account_number INTEGER,
    year INTEGER,
    month INTEGER,
    day INTEGER,
    atm_location TEXT,
    transaction_type TEXT,
    amount INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE bank_accounts (
    account_number INTEGER,
    person_id INTEGER,
    creation_year INTEGER,
    FOREIGN KEY(person_id) REFERENCES people(id)
);

CREATE TABLE airports (
    id INTEGER,
    abbreviation TEXT,
    full_name TEXT,
    city TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE flights (
    id INTEGER,
    origin_airport_id INTEGER,
    destination_airport_id INTEGER,
    year INTEGER,
    month INTEGER,
    day INTEGER,
    hour INTEGER,
    minute INTEGER,
    PRIMARY KEY(id),
    FOREIGN KEY(origin_airport_id) REFERENCES airports(id),
    FOREIGN KEY(destination_airport_id) REFERENCES airports(id)
);

CREATE TABLE passengers (
    flight_id INTEGER,
    passport_number INTEGER,
    seat TEXT,
    FOREIGN KEY(flight_id) REFERENCES flights(id)
);

CREATE TABLE phone_calls (
    id INTEGER,
    caller TEXT,
    receiver TEXT,
    year INTEGER,
    month INTEGER,
    day INTEGER,
    duration INTEGER,
    PRIMARY KEY(id)
);

CREATE TABLE people (
    id INTEGER,
    name TEXT,
    phone_number TEXT,
    passport_number INTEGER,
    license_plate TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE bakery_security_logs (
    id INTEGER,
    year INTEGER,
    month INTEGER,
    day INTEGER,
    hour INTEGER,
    minute INTEGER,
    activity TEXT,
    license_plate TEXT,
    PRIMARY KEY(id)
);

-- Note Queries
-- I need to find 3 things
-- The THIEF
-- The city he ESCAPED TO
-- The ACCOMPLICE

-- All I know now is that the crime took place at a specific point and time so I'll get that information and take it from there.

SELECT * FROM crime_scene_reports WHERE street = 'Humphrey Street' AND day = 28 AND month = 7 AND year = 2024;

-- Output
-- | id  | year | month | day |     street      | description
-- | 295 | 2024 | 7     | 28  | Humphrey Street | Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. |

-- Well I see that there is a specific time and place that this happened, there are also 3 witnesses that mention the bakery
-- There is a bakery_security_logs, interviews and people tables. Maybe I'll look into that, but first I'll check the interview transcripts for that day.

SELECT * FROM interviews WHERE day = 28 AND month = 7 AND year = 2024;

-- Output
-- | id  |  name   | year | month | day |  transcript
-- | 158 | Jose    | 2024 | 7     | 28  | “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”                                                                                                                               |
-- | 159 | Eugene  | 2024 | 7     | 28  | “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”
-- | 160 | Barbara | 2024 | 7     | 28  | “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.                                                                                                                   |
-- | 161 | Ruth    | 2024 | 7     | 28  | Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
-- | 162 | Eugene  | 2024 | 7     | 28  | I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
-- | 163 | Raymond | 2024 | 7     | 28  | As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |
-- | 191 | Lily    | 2024 | 7     | 28  | Our neighboring courthouse has a very annoying rooster that crows loudly at 6am every day. My sons Robert and Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have successfully arrived in Paris.                                                                        |

-- This Query gave me a lot of data to work with, maybe I could have specified it a little bit better but I can work with this. Specifically Ruth, Eugene and Raymond seem to mention a bakery specifically Emma's. There are some other instances that don't seem related to the theft, although I'll keep them in mind.

-- Ruth mentioned that within 10 minutes of the theft, she saw the thief get into a car in the bakery parking lot and drive away. So I'll look into the bakery_security_logs sometime between 10:15am and 10:30am for good measure but I'm specifically looking for a license plate I can connect to somebody.

SELECT * FROM bakery_security_logs WHERE day = 28 AND month = 7 AND year = 2024 AND hour = 10 AND 15 <= minute AND minute <= 35 AND activity = 'exit';

-- Output
-- | id  | year | month | day | hour | minute | activity | license_plate |
-- +-----+------+-------+-----+------+--------+----------+---------------+
-- | 260 | 2024 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
-- | 261 | 2024 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
-- | 262 | 2024 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
-- | 263 | 2024 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
-- | 264 | 2024 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
-- | 265 | 2024 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
-- | 266 | 2024 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
-- | 267 | 2024 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
-- | 268 | 2024 | 7     | 28  | 10   | 35     | exit     | 1106N58       |
-- +-----+------+-------+-----+------+--------+----------+---------------+

-- Eugene mentioned that he recognizes the thief and that he saw him drawing money sometime before 10:15 so I'll look into the atm_transactions before 10:15am

SELECT * FROM atm_transactions WHERE day = 28 AND month = 7 AND year = 2024 AND atm_location = "Leggett Street" AND transaction_type = 'withdraw';

-- Output
-- | id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
-- +-----+----------------+------+-------+-----+----------------+------------------+--------+
-- | 246 | 28500762       | 2024 | 7     | 28  | Leggett Street | withdraw         | 48     |
-- | 264 | 28296815       | 2024 | 7     | 28  | Leggett Street | withdraw         | 20     |
-- | 266 | 76054385       | 2024 | 7     | 28  | Leggett Street | withdraw         | 60     |
-- | 267 | 49610011       | 2024 | 7     | 28  | Leggett Street | withdraw         | 50     |
-- | 269 | 16153065       | 2024 | 7     | 28  | Leggett Street | withdraw         | 80     |
-- | 288 | 25506511       | 2024 | 7     | 28  | Leggett Street | withdraw         | 20     |
-- | 313 | 81061156       | 2024 | 7     | 28  | Leggett Street | withdraw         | 30     |
-- | 336 | 26013199       | 2024 | 7     | 28  | Leggett Street | withdraw         | 35     |
-- +-----+----------------+------+-------+-----+----------------+------------------+--------+

-- Raymond mentioned that after 10:15am the thief called someone who talked to them for < 1 minute.

SELECT * FROM phone_calls WHERE day = 28 AND month = 7 AND year = 2024 AND duration < 60;

-- Output
-- | id  |     caller     |    receiver    | year | month | day | duration |
-- +-----+----------------+----------------+------+-------+-----+----------+
-- | 221 | (130) 555-0289 | (996) 555-8899 | 2024 | 7     | 28  | 51       |
-- | 224 | (499) 555-9472 | (892) 555-8872 | 2024 | 7     | 28  | 36       |
-- | 233 | (367) 555-5533 | (375) 555-8161 | 2024 | 7     | 28  | 45       |
-- | 251 | (499) 555-9472 | (717) 555-1342 | 2024 | 7     | 28  | 50       |
-- | 254 | (286) 555-6063 | (676) 555-6554 | 2024 | 7     | 28  | 43       |
-- | 255 | (770) 555-1861 | (725) 555-3243 | 2024 | 7     | 28  | 49       |
-- | 261 | (031) 555-6622 | (910) 555-3251 | 2024 | 7     | 28  | 38       |
-- | 279 | (826) 555-1652 | (066) 555-9701 | 2024 | 7     | 28  | 55       |
-- | 281 | (338) 555-6650 | (704) 555-2131 | 2024 | 7     | 28  | 54       |
-- Note I assume that the duration is represented in seconds,otherwise people here would be talking for at least 30m
-- +-----+----------------+----------------+------+-------+-----+----------+

-- The thief said that he plans to take the earliest flight out of Fiftyville on the 29-07-2024. The thief then asked the person on the other end of the phone to purchase the flight ticket so from here I can probably find the accomplice.

SELECT * FROM flights WHERE day = 29 AND month = 7 AND year = 2024 ORDER BY hour ASC LIMIT 1;

-- +Output
-- | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
-- +----+-------------------+------------------------+------+-------+-----+------+--------+
-- | 36 | 8                 | 4                      | 2024 | 7     | 29  | 8    | 20     |
-- Note This seems to be the correct flight
-- +----+-------------------+------------------------+------+-------+-----+------+--------+

-- SO a person that is connected in all of these queries most likely could be the thief

-- Okay so I have a lot of data to skin through, my though here is first to connect all tables and find the data common to all of them through the connections.Maybe I have to craft a super specific query to find a connection
-- Here I have the people table, this is information that I need to find out first

-- CREATE TABLE people (
--     id INTEGER,
--     name TEXT,
--     phone_number TEXT,
--     passport_number INTEGER,
--     license_plate TEXT,
--     PRIMARY KEY(id)
-- );

-- Lets try and dig into the thief's information first

SELECT *
FROM people
WHERE phone_number IN (
    SELECT caller
    FROM phone_calls
    WHERE day = 28 AND month = 7 AND year = 2024 AND duration < 60
)
AND license_plate IN (
    SELECT license_plate
    FROM bakery_security_logs
    WHERE day = 28 AND month = 7 AND year = 2024
      AND hour = 10
      AND minute BETWEEN 15 AND 35
      AND activity = 'exit'
);

-- Output
-- +--------+--------+----------------+-----------------+---------------+
-- |   id   |  name  |  phone_number  | passport_number | license_plate |
-- +--------+--------+----------------+-----------------+---------------+
-- | 398010 | Sofia  | (130) 555-0289 | 1695452385      | G412CB7       |
-- | 449774 | Taylor | (286) 555-6063 | 1988161715      | 1106N58       |
-- | 514354 | Diana  | (770) 555-1861 | 3592750733      | 322W7JE       |
-- | 560886 | Kelsey | (499) 555-9472 | 8294398571      | 0NTHK55       |
-- | 686048 | Bruce  | (367) 555-5533 | 5773159633      | 94KL13X       |
-- +--------+--------+----------------+-----------------+---------------+

-- Okay so these people seem to be connected to the info I specified on the previous query, now I just have to narrow it down. The last details I couldn't specify are the passport numbers so let's try and go through that

-- For that I need to connect the last query and the fligths table with the passangers and airports


-- Find passengers on those flights
SELECT *
FROM passengers
WHERE passport_number IN (
    SELECT passport_number
    FROM people
    WHERE phone_number IN (
        SELECT caller FROM phone_calls
        WHERE year = 2024 AND month = 7 AND day = 28 AND duration < 60
    )
    AND license_plate IN (
        SELECT license_plate FROM bakery_security_logs
        WHERE year = 2024 AND month = 7 AND day = 28
          AND hour = 10 AND minute BETWEEN 15 AND 35
          AND activity = 'exit'
    )
)
AND flight_id IN (
    SELECT id FROM flights
    WHERE day = 29 AND month = 7 AND year = 2024 ORDER BY hour ASC LIMIT 1;
);

-- +-----------+-----------------+------+
-- | flight_id | passport_number | seat |
-- +-----------+-----------------+------+
-- | 36        | 1695452385      | 3B   |
-- | 36        | 5773159633      | 4A   |
-- | 36        | 8294398571      | 6C   |
-- | 36        | 1988161715      | 6D   |
-- +-----------+-----------------+------+

-- Great the thief must be one of these 4 guys. 

-- Now lets look at who withdrew money on Leggett Street before the theft.

SELECT people.name, people.passport_number, bank_accounts.account_number
FROM bank_accounts
JOIN people ON people.id = bank_accounts.person_id
WHERE account_number IN (
    28500762, 28296815, 76054385, 49610011,
    16153065, 25506511, 81061156, 26013199
);

-- +---------+-----------------+----------------+
-- |  name   | passport_number | account_number |
-- +---------+-----------------+----------------+
-- | Bruce   | 5773159633      | 49610011       |
-- | Diana   | 3592750733      | 26013199       |
-- | Brooke  | 4408372428      | 16153065       |
-- | Kenny   | 9878712108      | 28296815       |
-- | Iman    | 7049073643      | 25506511       |
-- | Luca    | 8496433585      | 28500762       |
-- | Taylor  | 1988161715      | 76054385       |
-- | Benista | 9586786673      | 81061156       |
-- +---------+-----------------+----------------+

-- Gotcha! I deduce the thief must be Bruce (lol)

SELECT * FROM people WHERE name = "Bruce";

-- +--------+-------+----------------+-----------------+---------------+
-- |   id   | name  |  phone_number  | passport_number | license_plate |
-- +--------+-------+----------------+-----------------+---------------+
-- | 686048 | Bruce | (367) 555-5533 | 5773159633      | 94KL13X       |
-- +--------+-------+----------------+-----------------+---------------+

-- Now let's try and find the city he escaped to

SELECT * FROM airports;

-- +----+--------------+-----------------------------------------+---------------+
-- | id | abbreviation |                full_name                |     city      |
-- +----+--------------+-----------------------------------------+---------------+
-- | 1  | ORD          | O'Hare International Airport            | Chicago       |
-- | 2  | PEK          | Beijing Capital International Airport   | Beijing       |
-- | 3  | LAX          | Los Angeles International Airport       | Los Angeles   |
-- | 4  | LGA          | LaGuardia Airport                       | New York City |
-- | 5  | DFS          | Dallas/Fort Worth International Airport | Dallas        |
-- | 6  | BOS          | Logan International Airport             | Boston        |
-- | 7  | DXB          | Dubai International Airport             | Dubai         |
-- | 8  | CSF          | Fiftyville Regional Airport             | Fiftyville    |
-- | 9  | HND          | Tokyo International Airport             | Tokyo         |
-- | 10 | CDG          | Charles de Gaulle Airport               | Paris         |
-- | 11 | SFO          | San Francisco International Airport     | San Francisco |
-- | 12 | DEL          | Indira Gandhi International Airport     | Delhi         |
-- +----+--------------+-----------------------------------------+---------------+

SELECT * FROM flights WHERE id = 36;

-- +----+-------------------+------------------------+------+-------+-----+------+--------+
-- | id | origin_airport_id | destination_airport_id | year | month | day | hour | minute |
-- +----+-------------------+------------------------+------+-------+-----+------+--------+
-- | 36 | 8                 | 4                      | 2024 | 7     | 29  | 8    | 20     |
-- +----+-------------------+------------------------+------+-------+-----+------+--------+

--  He seems to have fled to (-- | 4  | LGA          | LaGuardia Airport                       | New York City |)
-- Now to pinpoint the accomplice

SELECT * FROM phone_calls WHERE day = 28 AND month = 7 AND year = 2024 AND duration < 60 AND caller = (367) 555-5533;

-- Output
-- | id  |     caller     |    receiver    | year | month | day | duration |
-- +-----+----------------+----------------+------+-------+-----+----------+
-- | 233 | (367) 555-5533 | (375) 555-8161 | 2024 | 7     | 28  | 45       |
-- Note Taking a second look at the calle Bruce made we and backtrace the caller to the number (375) 555-8161 
-- +-----+----------------+----------------+------+-------+-----+----------+

SELECT name,phone_number FROM people WHERE phone_number = "(375) 555-8161";

-- +-------+----------------+
-- | name  |  phone_number  |
-- +-------+----------------+
-- | Robin | (375) 555-8161 |
-- +-------+----------------+

-- Seems like Robin ben Robin'. Case closed!