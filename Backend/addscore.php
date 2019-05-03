<?php

include 'db.php';

$username = $_GET['username'];
$categoryid = $_GET['categoryid'];
$score = $_GET['score'];
$numcorrect = $_GET['numcorrect'];

//get player id
$playerid = intval(pg_fetch_row(
    pg_query_params($db, "SELECT * FROM players WHERE username = $1", array($username))
)[0]);
print pg_last_error();

//Make a new user if they don't exist
if($playerid == NULL) {
    $playerid = intval(pg_fetch_row(
        pg_query_params($db, "INSERT INTO players (username) VALUES ($1) RETURNING playerid", array($username))
    )[0]);
}
print pg_last_error();

//Add the score
$result = pg_query_params(
    $db, 'CALL new_score($1, $2, $3, $4)',
    array($playerid, $categoryid, $score, $numcorrect)
);
print pg_last_error();

?>