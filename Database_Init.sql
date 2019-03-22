-- sql page for creating the QuiziCool Database --

DROP TABLE questions;
CREATE TABLE questions (
questionID SERIAL PRIMARY KEY NOT NULL,
content text NOT NULL,
answer varchar(1) NOT NULL,
categoryID int NOT NULL,
difficultyLevel int NOT NULL);
