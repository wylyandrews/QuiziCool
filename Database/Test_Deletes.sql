-- QuiziCool                                           --
-- A database project                                  --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman  --
-- sql page for deleting test data  				   --
-- Created on:       April 30, 2019                    --
-- Last updated on:	 April 30, 2019                    --

DELETE FROM questions
	WHERE questionID = 1;

-- deletes fruit category and all questions, question choices, and scores related
DELETE FROM categories
	WHERE categoryID = 2; 
