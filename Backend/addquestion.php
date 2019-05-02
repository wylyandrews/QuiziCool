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

$content = $_POST['content'] ?? '';
if($content == '') {
    http_response_code(401);
    exit(1);
}

$answer = $_POST['answer'] ?? '';
if(!($answer == 'A' || $answer == 'B' || $answer == 'C' || $answer == 'D')){
    http_response_code(402);
};

$category = $_POST['category'] ?? '';
if($category == '') {
    http_response_code(403);
}

$difficulty = intval($_POST['difficulty']) ?? 0;
if($difficulty < 0) {
    http_response_code(404);
}

$choiceA = $_POST['choiceA'] ?? '';
if($choiceA == '') {
    http_response_code(405);
}

$choiceB = $_POST['choiceB'] ?? '';
if($choiceB == '') {
    http_response_code(406);
}

$choiceC = $_POST['choiceC'] ?? '';
if($choiceC == '') {
    http_response_code(407);
}

$choiceD = $_POST['choiceD'] ?? '';
if($choiceD == ''){
    http_response_code(409);
}

$result = pg_query_params($db, 'CALL generate_question($1, $2, $3, $4, $5, $6, $7, $8)',
                           array($content, $answer, $category, $difficulty, $choiceA, $choiceB, $choiceC, $choiceD));

print pg_last_error($db);
print var_dump($result);

function error() {
    http_response_code(400);
    exit(1);
}

?>