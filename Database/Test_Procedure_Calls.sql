-- QuiziCool                                          --
-- A database project                                 --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman --
-- sql page for running test procedures               --
-- Created on:       April 12, 2019                   --
-- Last updated on:  April 16, 2019                   --

CALL generate_question('Does this procedure have way too many arguments?', 'C', 'Test Category', 1, 'No', 'Never', 'Definitely', 'This one is off the screen');
CALL new_score(1, 1, 2000, 20);

CALL generate_category('Fruit Facts', 'QuizBot', 'This is your chance to prove your juicy knowledge!');
CALL generate_question('Which of the following is a fruit?', 'B', 'Fruit Facts', 1, 'Broccoli', 'Tomato', 'Cabbage', 'Carrot');
CALL generate_question('Which of the following is considered a berry?', 'D', 'Fruit Facts', 2, 'Strawberry', 'Apple', 'Pear', 'Banana');
CALL generate_question('What is the study of fruits?', 'A', 'Fruit Facts', 1, 'Pomology', 'Trophort', 'Floriculture', 'Botany' );
CALL generate_question('Which is NOT a fruit?', 'A', 'Fruit Facts', 1, 'Beet', 'Coconut', 'Eggplant', 'Starfruit' )