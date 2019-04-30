-- QuiziCool                                          --
-- A database project                                 --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman --
-- sql page for running test procedures               --
-- Created on:       April 12, 2019                   --
-- Last updated on:  April 29, 2019                   --

CALL generate_question('Does this procedure have way too many arguments?', 'C', 'Test Category', 1, 'No', 'Never', 'Definitely', 'This one is off the screen');
CALL new_score(1, 1, 2000, 20);

CALL generate_category('Fruit Facts', 'QuizBot', 'This is your chance to prove your juicy knowledge!');
CALL generate_question('Which of the following is a fruit?', 'B', 'Fruit Facts', 1, 'Broccoli', 'Tomato', 'Cabbage', 'Carrot');
CALL generate_question('Which of the following is considered a berry?', 'D', 'Fruit Facts', 2, 'Strawberry', 'Apple', 'Pear', 'Banana');
CALL generate_question('What is the study of fruits?', 'A', 'Fruit Facts', 1, 'Pomology', 'Trophort', 'Floriculture', 'Botany' );
CALL generate_question('Which is NOT a fruit?', 'A', 'Fruit Facts', 1, 'Beet', 'Coconut', 'Eggplant', 'Starfruit' );

CALL generate_category('Rock''n'' Roll', 'QuizBot', 'Are you ready to rock?' );
CALL generate_question('Who was the lead singer of Aerosmith?', 'D', 'Rock''n'' Roll', 1, 'Slash', 'Gene Simmons', 'Johnny Depp', 'Steven Tyler');
CALL generate_question('Who was the original writer of the 1995 song "Hurt"?', 'C', 'Rock''n'' Roll', 2, 'Johnny Cash', 'Bob Dylan', 'Trent Reznor', 'Freddie Mercury');
CALL generate_question('Which musical group has NOT made a concept album?', 'D', 'Rock''n'' Roll', 1, 'Pink Floyd', 'David Bowie', 'The Beatles', 'Queen' );

CALL generate_category('Star Wars', 'QuizBot', 'May the force be with you in this quiz about Star Wars!');
CALL generate_question('How many movies are in the original trilogy?', 'A', 'Star Wars', 0, '1', '2', '3', '4' );
CALL generate_question('Which character is NOT a jedi master?', 'B', 'Star Wars', 0, 'Obi-Wan Kenobi', 'Anakin Skywalker', 'Qui-Gon Jinn', 'Yoda');
CALL generate_question('What is Luke Skywalker''s callsign?' , 'B', 'Star Wars', 2, 'Blue Three', 'Red Five', 'Green Seven', 'Yellow Nine');