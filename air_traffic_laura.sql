-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic_laura;

CREATE DATABASE air_traffic_laura;

\c air_traffic_laura



CREATE TABLE person
(
   id SERIAL PRIMARY KEY,
   last_name TEXT NOT NULL,
   first_name TEXT NOT NULL
);

CREATE TABLE airline
(
   id SERIAL PRIMARY KEY,
   name TEXT NOT NULL
);
  
CREATE TABLE locationa
( 
  id SERIAL PRIMARY KEY,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);  

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  airline_id INTEGER NOT NULL REFERENCES airline ON DELETE SET NULL, 
  location_id INTEGER NOT NULL REFERENCES locationa ON DELETE SET NULL, 
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  seat TEXT NOT NULL 
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  person_id INTEGER NOT NULL REFERENCES person ON DELETE SET NULL,
  flight_id INTEGER NOT NULL REFERENCES flight ON DELETE SET NULL 
);

INSERT INTO airline
  (name)
VALUES
  ('delta'),
  ('american'),
  ('southwest'),
  ('jetblue');

INSERT INTO person
  (last_name, first_name)
VALUES
  ('Smith', 'fred'),
  ('Look', 'Barry'),
  ('Blue', 'Tina'),
  ('White', 'Mary');  

INSERT INTO locationa
  (city, country)
VALUES
  ('Atlanta', 'US'),
  ('New York', 'US'),
  ('Mexico City', 'Mexico'),
  ('Santiago', 'Chile'); 

INSERT INTO flight
  (airline_id, location_id, departure, arrival, seat)
VALUES
  (1, 1, '2018-04-08 09:00:00', '2018-04-08 12:00:00', '33b'),
  (2, 2, '2018-12-19 12:45:00', '2018-12-19 16:15:00', '8a'),
  (3, 3, '2018-01-02 07:00:00', '2018-01-02 08:03:00', '12f'),
  (4, 4,  '2018-08-01 18:30:00', '2018-08-01 21:50:00', '23d'); 

INSERT INTO tickets
  (person_id, flight_id)
VALUES
  (1, 2),
  (2, 2),
  (3, 1),
  (4, 4),
  (2, 4);
  