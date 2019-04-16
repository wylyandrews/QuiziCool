
CREATE  TRIGGER trig_questions_insert
AFTER INSERT
ON questions
FOR EACH ROW
EXECUTE PROCEDURE increment_question_count();