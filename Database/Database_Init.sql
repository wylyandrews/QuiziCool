-- QuiziCool                                           --
-- A database project                                  --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman  --
-- sql page for creating the QuiziCool Database tables --
-- Created on:       March 28, 2019                    --
-- Last updated on:	 April 12, 2019                    --

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
questionID SERIAL NOT NULL PRIMARY KEY,
content TEXT NOT NULL,
answer VARCHAR(1) NOT NULL,  CONSTRAINT answer_choices CHECK (answer IN ('A', 'B', 'C', 'D')),
categoryID INT NOT NULL,
difficultyLevel INT NOT NULL
);

DROP TABLE IF EXISTS questionChoices;
CREATE TABLE questionChoices (
questionID INT NOT NULL,
letter CHAR(1) NOT NULL, CONSTRAINT letter_choices CHECK (letter IN ('A', 'B', 'C', 'D')),
choice TEXT NOT NULL,
CONSTRAINT PK_Choice PRIMARY KEY(questionID,letter)
);

DROP TABLE IF EXISTS difficulties;
CREATE TABLE difficulties (
difficultyLevel INT NOT NULL PRIMARY KEY,
score INT NOT NULL
);

DROP TABLE IF EXISTS categories;
CREATE TABLE categories (
categoryID SERIAL NOT NULL PRIMARY KEY,
categoryName TEXT NOT NULL UNIQUE,
creatorID INT NOT NULL,
categoryDescription TEXT,
totalScore INT NOT NULL,
questions INT NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS players;
CREATE TABLE players (
playerID SERIAL NOT NULL PRIMARY KEY,
username VARCHAR(20) NOT NULL UNIQUE,
score INT NOT NULL DEFAULT 0,
correctAnswers INT NOT NULL DEFAULT 0,
totalAnswers INT NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS scores;
CREATE TABLE scores (
playerID INT NOT NULL,
categoryID INT NOT NULL,
score INT NOT NULL,
correctAnswers INT NOT NULL,
totalAnswers INT NOT NULL,
CONSTRAINT PKscore PRIMARY KEY (playerID, categoryID)
);