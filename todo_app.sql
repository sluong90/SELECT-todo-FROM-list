
DROP DATABASE IF EXISTS todo_app;
DROP ROLE IF EXISTS michael;
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
CREATE DATABASE todo_app;
 --connect to new database
 \c todo_app;

DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
     id SERIAL PRIMARY KEY NOT NULL,
     title VARCHAR(255) NOT NULL,
     description TEXT NULL,
     created_at TIMESTAMP WITHOUT time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at TIMESTAMP WITHOUT time zone NULL,
     completed boolean NOT NULL DEFAULT false --or 0
 );

--ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

ALTER TABLE tasks
    DROP COLUMN IF EXISTS completed;

ALTER TABLE tasks
    ADD COLUMN completed_at TIMESTAMP WITHOUT time zone NULL DEFAULT NULL;

ALTER TABLE tasks
    ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;

INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES ('Study SQL', 'Complete this exercise', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL);

INSERT INTO tasks (title, description)
VALUES('Study PostgresSQL', 'Read all the documentation');

SELECT tasks.title FROM tasks WHERE completed_at IS NULL;

UPDATE tasks 
    SET completed_at = CURRENT_TIMESTAMP
    WHERE title = 'Study SQL';


SELECT tasks.title, tasks.description FROM tasks WHERE completed_at IS NULL;

SELECT * FROM tasks
    ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES 
('mistake 1', 'a test entry'), ('mistake 2', 'another test entry'), ('third mistake', 'another test entry');

SELECT tasks.title FROM tasks WHERE (title LIKE '%mistake%');

DELETE FROM tasks WHERE title = 'mistake 1';

SELECT tasks.title, tasks.description FROM tasks WHERE (title LIKE '%mistake%');

DELETE FROM tasks WHERE title LIKE '%mistake%';

SELECT * FROM tasks
    ORDER BY title ASC;









