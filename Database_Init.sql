-- sql page for creating the QuiziCool Database --

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
categoryID INT NOT NULL PRIMARY KEY,
creatorID INT NOT NULL,
catDescription TEXT NOT NULL,
totalScore INT NOT NULL
);

DROP TABLE players;
CREATE TABLE players (
playerID INT NOT NULL PRIMARY KEY,
username VARCHAR(20) NOT NULL,
score INT NOT NULL,
correctAnswers INT NOT NULL,
totalAnswers INT NOT NULL
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