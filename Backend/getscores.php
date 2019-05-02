<?php

include 'db.php';

$categoryid = $_GET['categoryid'];

$result = pg_query_params(
    $db, 'SELECT username, score FROM scores INNER JOIN players ON scores.playerid=players.playerid WHERE categoryid = $1;',
    array($categoryid)
);

print(json_encode(pg_fetch_all($result)));

?>