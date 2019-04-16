-- QuiziCool                                          --
-- A database project                                 --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman --
-- sql file for creating stored procedures            --
-- Created on:       April 12, 2019                   --
-- Last updated on:  April 12, 2019                   --

DROP PROCEDURE IF EXISTS generate_question;
CREATE OR REPLACE PROCEDURE generate_question( question_name TEXT, answer CHAR(1), category_name TEXT, diff INT, c_a TEXT, c_b TEXT, c_c TEXT, c_d TEXT )
LANGUAGE plpgsql
AS $$
DECLARE
	new_question_id INT;
	new_question_score INT;
	new_category_score INT;
BEGIN

	SELECT INTO new_question_id MAX(questionID) FROM questions;
	new_question_id := new_question_id + 1;

	INSERT INTO questions ( content, answer, categoryID, difficultyLevel )
			   VALUES ( question_name, answer, (SELECT categoryID FROM categories WHERE categoryName = category_name), diff );

	INSERT INTO questionChoices ( questionID, letter, choice )
					 VALUES ( new_question_id, 'A', c_a ),
					 		( new_question_id, 'B', c_b ),
					 		( new_question_id, 'C', c_c ),
					 		( new_question_id, 'D', c_d );

	SELECT INTO new_question_score score 
		FROM difficulties 
		WHERE difficultyLevel = diff;

	SELECT INTO new_category_score totalScore
		FROM categories
		WHERE categoryName = category_name;

	new_category_score = new_category_score + new_question_score;

	UPDATE categories
		SET totalScore = new_category_score
		WHERE categoryName = category_name;

END;
$$;

/* -- example function code
DROP FUNCTION IF EXISTS show_all_tables;
CREATE OR REPLACE FUNCTION show_all_tables( )
RETURNS TABLE (
	questionID INT
)
AS $$
BEGIN
	RETURN QUERY SELECT questions.questionID FROM questions;
END;
$$
LANGUAGE 'plpgsql';*/

DROP PROCEDURE IF EXISTS new_score;
CREATE OR REPLACE PROCEDURE new_score( pID INT, cID INT, new_score INT, new_correct INT )
AS $$
DECLARE
	old_score INT;
	old_correct INT;
	total_questions INT;
BEGIN
	SELECT INTO total_questions questions
		FROM categories
		WHERE categories.categoryID = cID;

	SELECT INTO old_score scores.score, old_correct correctAnswers
		FROM scores
		WHERE scores.playerID = pID AND scores.categoryID = cID;

	IF new_score > old_score OR ( new_score = old_score AND new_correct > old_correct ) THEN
		UPDATE scores
			SET score = new_score,
				correctAnswers = new_correct
			WHERE playerID = pID AND categoryID = cID;
		/*INSERT INTO scores ( playerID, categoryID, score, correctAnswers, totalAnswers )
					VALUES ( pID, cID, score, correct, total_questions );*/
	END IF;

END;
$$
LANGUAGE 'plpgsql';

DROP FUNCTION IF EXISTS increment_question_count();
CREATE OR REPLACE FUNCTION increment_question_count() RETURNS TRIGGER AS $_$
DECLARE
	question_count INT;
BEGIN
	SELECT INTO question_count questions
		FROM categories
		WHERE categories.categoryID = NEW.categoryID;

	question_count := question_count + 1;

	UPDATE categories
	SET questions = question_count
	WHERE categories.categoryID = NEW.categoryID;

	RETURN NEW;
END;
$_$ LANGUAGE 'plpgsql';