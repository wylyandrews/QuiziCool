<?php

include 'db.php';

/**
 * Get Questions
 * Arguments:
 *   categoryid - int
 */

$categoryid = $_GET['categoryid'] ?? '';
if($categoryid == '') http_response_code(400);

$result = pg_query_params(
    $db,
    'SELECT questions.questionid, questions.content, questions.answer, questionchoices.letter, questionchoices.choice, difficulties.score FROM questions INNER JOIN questionchoices ON questions.questionid=questionchoices.questionid INNER JOIN difficulties ON questions.difficultylevel=difficulties.difficultylevel WHERE categoryid = $1',
    array($categoryid)
);

print(json_encode(pg_fetch_all($result)));

?>