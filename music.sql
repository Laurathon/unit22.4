-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  producers TEXT[] NOT NULL,
  release_date DATE NOT NULL
)

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  album_id INTEGER NOT NULL REFERENCES albums ON DELETE SET NULL,
  artists TEXT[] NOT NULL 
);

INSERT INTO albums
(name,producers, release_date)
VALUES
  ( 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}','04-15-1997'),
  ( 'A Night at the Opera', '{"Roy Thomas Baker"}', '10-31-1975'),
  ('Daydream', '{"Walter Afanasieff"}', '11-14-1995'),
  ('A Star Is Born', '{"Benjamin Rice"}', '09-27-2018'),
  ('Silver Side Up', '{"Rick Parashar"}', '08-21-2001');
  
INSERT INTO songs
  (title, duration_in_seconds, album_id, artists)
VALUES
  ('MMMBop', 238, 1, '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, 2,'{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, 3, '{"Walter Afanasieff"}'),
  ('Shallow', 216, 4, '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, 5, '{"Rick Parashar"}');
 