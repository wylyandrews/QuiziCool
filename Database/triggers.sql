-- QuiziCool                                          --
-- A database project                                 --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman --
-- sql page for creating triggers	                  --
-- Created on:       April 16, 2019                   --
-- Last updated on:  April 16, 2019                   --

CREATE  TRIGGER trig_questions_insert
AFTER INSERT
ON questions
FOR EACH ROW
EXECUTE PROCEDURE increment_question_count();

CREATE TRIGGER trig_score_insert
BEFORE INSERT
ON scores
FOR EACH ROW
EXECUTE PROCEDURE check_legal_scores();