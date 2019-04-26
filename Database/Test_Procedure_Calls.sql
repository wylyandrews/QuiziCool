-- QuiziCool                                          --
-- A database project                                 --
-- Wyly Andrews, Riley Abrahamson, and Dawson Coleman --
-- sql page for running test procedures               --
-- Created on:       April 12, 2019                   --
-- Last updated on:  April 16, 2019                   --

CALL generate_question('Does this procedure have way too many arguments?', 'C', 'Test Category', 1, 'No', 'Never', 'Definitely', 'This one is off the screen');
CALL new_score(1, 1, 2000, 20);