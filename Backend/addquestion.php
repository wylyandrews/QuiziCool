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

$result = pg_query_params($db, 'CALL generate_question($1, $2, $3, $4, $5, $6, $7, $8)',
                           array($content, $answer, $category, $difficulty, $choiceA, $choiceB, $choiceC, $choiceD));

print pg_last_error($db);
print var_dump($result);

function error() {
    http_response_code(400);
    exit(1);
}

?>