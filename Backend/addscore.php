<?php

include 'db.php';

$playerid = $_GET['playerid'];
$categoryid = $_GET['categoryid'];
$score = $_GET['score'];
$numcorrect = $_GET['numcorrect'];

$result = pg_query_params(
    $db, 'CALL new_score($1, $2, $3, $4)',
    array($playerid, $categoryid, $score, $numcorrect)
);

?>