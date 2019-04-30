<?php

/**
 * Adds a question to the database.
 * Arguments (use POST):
 *   question   - string
 *   answer     - one of: 'a', 'b', 'c', 'd'
 *   category   - string
 *   difficulty - int, >= 1
 *   choiceA    - string
 *   choiceB    - string
 *   choiceC    - string
 *   choiceD    - string
 */

include 'db.php';

$question = $_POST['question'] ?? '';
if($question == '') error();

$answer = $_POST['answer'] ?? '';
if(!($answer == 'a' || $answer == 'b' || $answer == 'c' || $answer == 'd')) error();

$category = $_POST['category'] ?? '';
if($category == '') error();

$difficulty = intval($_POST['difficulty']) ?? 0;
if($difficulty < 1) error();

$choiceA = $_POST['choiceA'] ?? '';
if($choiceA == '') error();

$choiceB = $_POST['choiceB'] ?? '';
if($choiceB == '') error();

$choiceC = $_POST['choiceC'] ?? '';
if($choiceC == '') error();

$choiceD = $_POST['choiceD'] ?? '';
if($choiceD == '') error();

$result = pg_query_params($db, 'CALL generate_question($1, $2, $3, $4, $5, $6, $7, $8)',
                           array($question, $answer, $category, $difficulty, $choiceA, $choiceB, $choiceC, $choiceD));

//print pg_last_error($db);
//print var_dump($result);

function error() {
    http_response_code(400);
    exit(1);
}

?>