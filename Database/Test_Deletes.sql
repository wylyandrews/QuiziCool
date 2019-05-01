-- QuiziCool                                           --
-- A database project                                  --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman  --
-- sql page for deleting test data  				   --
-- Created on:       April 30, 2019                    --
-- Last updated on:	 April 30, 2019                    --

DELETE FROM questions
	WHERE questionID = 1;

-- deletes fruit category and all questions, question choices, and scores related

INSERT INTO players ( username ) 
			 VALUES ( 'DeleteMePlayer');

CALL generate_category('Delete Me!', 'DeleteMePlayer', 'This is a category that is being created for the sole purpose of testing delete triggers.');
CALL generate_question('Can you delete questions from a category safely?', 'A', 'Delete Me!', 0, 'yes', 'no', 'nah', 'nope' );
CALL generate_question('Can you delete categories from the table safely?', 'A', 'Delete Me!', 0, 'yes', 'no', 'nah', 'nope' );

CALL generate_category('Delete the Player!', 'DeleteMePlayer', 'This category should be deleted when the player is deleted.');

CALL new_score(2, 1, 0, 0);
CALL new_score(2, 2, 10, 0);

DELETE FROM questions 
	WHERE questionID = 13;

DELETE FROM categories
	WHERE categoryID = 2; 

DELETE FROM players 
	WHERE playerID = 2;
