-- QuiziCool                                          --
-- A database project                                 --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman --
-- sql page for creating triggers	                  --
-- Created on:       April 16, 2019                   --
-- Last updated on:  April 30, 2019                   --

CREATE  TRIGGER trig_question_insert
AFTER INSERT
ON questions
FOR EACH ROW
EXECUTE PROCEDURE increment_question_count();

CREATE TRIGGER trig_score_insert
BEFORE INSERT
ON scores
FOR EACH ROW
EXECUTE PROCEDURE check_legal_scores();

CREATE TRIGGER trig_category_delete
AFTER DELETE
ON categories
FOR EACH ROW
EXECUTE PROCEDURE remove_all_from_category();

CREATE TRIGGER trig_player_delete
BEFORE DELETE
ON players
FOR EACH ROW
EXECUTE PROCEDURE remove_all_from_player();

CREATE TRIGGER trig_question_delete
BEFORE DELETE
ON questions
FOR EACH ROW
EXECUTE PROCEDURE remove_choices_from_question();
