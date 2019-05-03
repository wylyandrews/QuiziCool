-- QuiziCool                                          --
-- A database project                                 --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman --
-- sql file for creating stored procedures            --
-- Created on:       April 12, 2019                   --
-- Last updated on:  April 30, 2019                   --

DROP PROCEDURE IF EXISTS generate_category;
CREATE OR REPLACE PROCEDURE generate_category( category_name TEXT, player_name VARCHAR(20), description TEXT)
LANGUAGE plpgsql
AS $$
DECLARE
	player_id INT;
BEGIN
	SELECT INTO player_id playerID FROM players
	WHERE username = player_name;

	INSERT INTO categories ( categoryName, creatorID, categoryDescription )
				VALUES ( category_name, player_id, description );
END;
$$;

CREATE OR REPLACE PROCEDURE generate_question( question_name TEXT, answer CHAR(1), category_id INT, diff INT, c_a TEXT, c_b TEXT, c_c TEXT, c_d TEXT )
LANGUAGE plpgsql
AS $$
DECLARE
	new_question_id INT;
	new_question_score INT;
	new_category_score INT;
BEGIN
	
	INSERT INTO questions ( content, answer, categoryID, difficultyLevel )
		VALUES ( question_name, answer, category_id, diff )
		RETURNING questionID INTO new_question_id;

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
		WHERE categoryId = category_id;

	new_category_score = new_category_score + new_question_score;

	UPDATE categories
		SET totalScore = new_category_score
		WHERE categoryID = category_id;

END;
$$;

CREATE OR REPLACE PROCEDURE generate_question( question_name TEXT, answer CHAR(1), category_name TEXT, diff INT, c_a TEXT, c_b TEXT, c_c TEXT, c_d TEXT )
LANGUAGE plpgsql
AS $$
DECLARE
	category_id INT;
BEGIN
	SELECT INTO category_id categoryID
	FROM categories
	WHERE categoryName = category_name;

	CALL generate_question( question_name, answer, category_id, diff, c_a, c_b, c_c, c_d );

END;
$$;

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

	IF old_score IS NULL THEN
		-- RAISE NOTICE 'old_score (%) = NULL. Inserting new score...', old_score;
		
		INSERT INTO scores ( playerID, categoryID, score, correctAnswers, totalAnswers )
			VALUES ( pID, cID, new_score, new_correct, total_questions );
	ELSE 
		-- RAISE NOTICE 'old_score (%) exists. Updating old score...', old_score;

		IF new_score > old_score OR ( new_score = old_score AND new_correct > old_correct ) THEN
			UPDATE scores
				SET score = new_score,
					correctAnswers = new_correct
				WHERE playerID = pID AND categoryID = cID;
		END IF;
	END IF;
END;
$$
LANGUAGE 'plpgsql';


------------- FUNCTIONS -----------


DROP FUNCTION IF EXISTS check_legal_scores();
CREATE OR REPLACE FUNCTION check_legal_scores() RETURNS TRIGGER AS $_$
DECLARE
	difference INT;
	category_score INT;
BEGIN
	difference := NEW.totalAnswers - NEW.correctAnswers;

	SELECT INTO category_score totalScore
		FROM categories
		WHERE categories.categoryID = NEW.categoryID;

	IF difference >= 0 
		AND (NEW.score <= category_score)
		AND (NEW.score >= 0)
		AND EXISTS(SELECT 1 FROM players WHERE NEW.playerID = players.playerID)
		AND EXISTS(SELECT 1 FROM categories WHERE NEW.categoryID = categories.categoryID)
	THEN
		RETURN NEW;
	ELSE
		-- RAISE NOTICE '% is an invalid score. Rejecting insert...', NEW;
		RETURN NULL;
	END IF;
END;
$_$ LANGUAGE 'plpgsql';


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

DROP FUNCTION IF EXISTS remove_all_from_category();
CREATE OR REPLACE FUNCTION remove_all_from_category() RETURNS TRIGGER AS $_$
BEGIN
	DELETE FROM questions
		WHERE OLD.categoryID = questions.categoryID;
	DELETE FROM scores
		WHERE OLD.categoryID = scores.categoryID;
	RETURN OLD;
END;
$_$ LANGUAGE 'plpgsql';

DROP FUNCTION IF EXISTS remove_all_from_player();
CREATE OR REPLACE FUNCTION remove_all_from_player() RETURNS TRIGGER AS $_$
BEGIN
	DELETE FROM categories
		WHERE OLD.playerID = categories.creatorID;
	DELETE FROM scores
		WHERE OLD.playerID = scores.playerID;
	RETURN OLD;
END;
$_$ LANGUAGE 'plpgsql';

DROP FUNCTION IF EXISTS remove_choices_from_question();
CREATE OR REPLACE FUNCTION remove_choices_from_question() RETURNS TRIGGER AS $_$
DECLARE
	category_score INT;
	question_count INT;
	question_score INT;
BEGIN
	-- RAISE NOTICE '% is the OLD', OLD;
	-- RAISE NOTICE '% is the OLD.categoryID', OLD.categoryID;
	SELECT INTO category_score totalScore
		FROM categories
		WHERE categories.categoryID = OLD.categoryID;

	SELECT INTO question_count questions
		FROM categories
		WHERE categories.categoryID = OLD.categoryID;

	SELECT INTO question_score score
		FROM difficulties
		WHERE difficulties.difficultyLevel = OLD.difficultyLevel;

	-- RAISE NOTICE '% is the question_count', question_count;
	-- RAISE NOTICE '% is the category_score', category_score;
	-- RAISE NOTICE '% is the question_score', question_score;

	category_score := category_score - question_score;
	question_count := question_count - 1;

	UPDATE categories
		SET questions = question_count,
			totalScore = category_score
		WHERE categories.categoryID = OLD.categoryID;

	DELETE FROM questionChoices
		WHERE OLD.questionID = questionChoices.questionID;
	
	RETURN OLD;
END;
$_$ LANGUAGE 'plpgsql';
