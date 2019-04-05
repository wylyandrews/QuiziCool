-- QuiziCool											--
-- A database project									--
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman	--
-- sql page for inserting test data						--
-- Created on:			March 28, 2019					--
-- Last updated on:		March 28, 2019					--

DELETE FROM questions;
DELETE FROM questionChoices;
DELETE FROM difficulties;
DELETE FROM categories;
DELETE FROM players;
DELETE FROM scores;

INSERT INTO players ( username, score, correctAnswers, totalAnswers) 
			 VALUES ( 'QuizBot', DEFAULT, DEFAULT, DEFAULT);

INSERT INTO players ( username ) 
			 VALUES ( 'QuizBot2');


INSERT INTO difficulties( difficultyLevel, score )
			 	 VALUES ( 0, 0 );

INSERT INTO difficulties( difficultyLevel, score )
			 	 VALUES ( 1, 10 );

INSERT INTO difficulties( difficultyLevel, score )
			 	 VALUES ( 2, 20 );

-- should fail, no duplicate difficultyLevel --
INSERT INTO difficulties( difficultyLevel, score )
			 	 VALUES ( 1, 5 );
-- end fail --

INSERT INTO categories ( categoryName, creatorID, categoryDescription, totalScore )
				VALUES ( 'Test Category', (SELECT playerID FROM players WHERE username = 'QuizBot'), 'Good luck on your quiz!', 100 );

INSERT INTO questions ( content, answer, categoryID, difficultyLevel )
			   VALUES ( 'Which choice is choice B?', 'B', (SELECT categoryID FROM categories WHERE categoryName = 'Test Category'), 0 );

INSERT INTO questionChoices ( questionID, letter, choice )
					 VALUES ( 1, 'A', 'Option A' );

INSERT INTO questionChoices ( questionID, letter, choice )
					 VALUES ( 1, 'B', 'Choice B' );

INSERT INTO questionChoices ( questionID, letter, choice )
					 VALUES ( 1, 'C', 'Selection C' );

INSERT INTO questionChoices ( questionID, letter, choice )
					 VALUES ( 1, 'D', 'Possibility D' );

-- should fail, no option E allowed --
INSERT INTO questionChoices ( questionID, letter, choice )
					 VALUES ( 1, 'E', 'Error E' );
-- end fail --

-- right now, this works, but we should implement constraints to make this fail ( invalid total answers, too many ) --
INSERT INTO scores ( playerID, categoryID, score, correctAnswers, totalAnswers )
			VALUES ( (SELECT playerID FROM players WHERE username = 'QuizBot'),
					 (SELECT categoryID FROM categories WHERE categoryName = 'Test Category'),
					 100, 10, 10 );

