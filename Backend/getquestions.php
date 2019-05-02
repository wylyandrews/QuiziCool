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

$rows = pg_fetch_all($result);
//print var_dump($rows);
$processed = array();
for($i = 0; $i < count($rows); $i += 4) {
    $q = new stdClass();
    $q->choiceA = $rows[$i]['choice'];
    $q->choiceB = $rows[$i+1]['choice'];
    $q->choiceC = $rows[$i+2]['choice'];
    $q->choiceD = $rows[$i+3]['choice'];
    $q->content = $rows[$i]['content'];
    $q->answer = $rows[$i]['answer'];
    $q->score = $rows[$i]['score'];
    array_push($processed, $q);
}

print(json_encode($processed));

?>