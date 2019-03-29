-- QuiziCool											--
-- A database project									--
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman	--
-- sql page for creating the QuiziCool Database tables	--
-- Created on:			March 28, 2019					--
-- Last updated on:		March 28, 2019					--

DROP TABLE questions;
CREATE TABLE questions (
questionID SERIAL NOT NULL PRIMARY KEY,
content TEXT NOT NULL,
answer VARCHAR(1) NOT NULL,
categoryID INT NOT NULL,
difficultyLevel INT NOT NULL
);

DROP TABLE questionChoices;
CREATE TABLE questionChoices (
questionID INT NOT NULL,
letter CHAR(1) NOT NULL,
choice TEXT NOT NULL,
CONSTRAINT PK_Choice PRIMARY KEY(questionID,letter)
);

DROP TABLE difficulties;
CREATE TABLE difficulties (
difficultyLevel INT NOT NULL PRIMARY KEY,
score INT NOT NULL
);

DROP TABLE categories;
CREATE TABLE categories (
categoryID SERIAL NOT NULL PRIMARY KEY,
creatorID INT NOT NULL,
catDescription TEXT NOT NULL,
totalScore INT NOT NULL
);

DROP TABLE players;
CREATE TABLE players (
playerID SERIAL NOT NULL PRIMARY KEY,
username VARCHAR(20) NOT NULL,
score INT NOT NULL DEFAULT 0,
correctAnswers INT NOT NULL DEFAULT 0,
totalAnswers INT NOT NULL DEFAULT 0
);

DROP TABLE scores;
CREATE TABLE scores (
playerID INT NOT NULL,
categoryID INT NOT NULL,
score INT NOT NULL,
correctAnswers INT NOT NULL,
totalAnswers INT NOT NULL,
CONSTRAINT PKscore PRIMARY KEY (playerID, categoryID)
);