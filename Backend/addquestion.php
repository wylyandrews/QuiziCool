<?php

/**
 * Adds a question to the database.
 * Arguments:
 *   question   - string
 *   answer     - one of: 'a', 'b', 'c', 'd'
 *   category   - string
 *   difficulty - integer (currently 1-2)
 *   choiceA    - string
 *   choiceB    - string
 *   choiceC    - string
 *   choiceD    - string
 */

include 'db.php';

//Make sure the request is POST
if(!isset($_POST)) error();

//Validate fields
$question = $_POST['question'] ?? '';
if($question == '') error();

$answer = $_POST['answer'] ?? '';
if(!($answer == 'a' || $answer == 'b' || $answer == 'c' || answer == 'd')) error();

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

//pg_query_params($db, 'DO $$ BEGIN PERFORM generate_question($1, $2, $3, $4, $5, $6, $7, $8) END $$',
//                array($question, $answer, $category, $difficulty, $choiceA, $choiceB, $choiceC, $choiceD));
print 'all good<br>';

function error() {
    print 'uh oh you did a nono<br>';
    //http_response_code(400);
}

print var_dump($_POST);
print var_dump($_GET);

?>