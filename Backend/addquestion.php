<?php

/**
 * Adds a question to the database.
 * Arguments (use POST):
 *   content   - string
 *   choiceA    - string
 *   choiceB    - string
 *   choiceC    - string
 *   choiceD    - string
 *   answer     - one of: 'a', 'b', 'c', 'd'
 *   category   - string
 *   difficulty - int, >= 0
 */

include 'db.php';

$content = $_GET['content'] ?? '';
$answer = $_GET['answer'] ?? '';
$category = $_GET['category'] ?? '';
$difficulty = intval($_GET['difficulty']) ?? 0;
$choiceA = $_GET['choiceA'] ?? '';
$choiceB = $_GET['choiceB'] ?? '';
$choiceC = $_GET['choiceC'] ?? '';
$choiceD = $_GET['choiceD'] ?? '';
$playername = $_GET['playername'] ?? '';
$description = $_GET['description'] ?? '';

//check if category exists
$categoryexists = pg_fetch_row(
    pg_query_params($db, 'SELECT * FROM categories WHERE categoryname = $1', array($category))
)[1];

//create if it doesn't
if($categoryexists == null) {
    pg_query_params($db, "CALL generate_category($1, $2, $3)", array($category, $playername, $description));
}

$result = pg_query_params($db, 'CALL generate_question($1, $2, $3, $4, $5, $6, $7, $8)',
                           array($content, $answer, $category, $difficulty, $choiceA, $choiceB, $choiceC, $choiceD));

?>