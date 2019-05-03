<?php

include 'db.php';

$categoryid = $_GET['categoryid'];

$result = pg_query_params(
    $db, 'DELETE FROM categories WHERE categoryid = $1',
    array($categoryid)
);

?>