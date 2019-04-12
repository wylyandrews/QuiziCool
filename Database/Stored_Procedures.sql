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