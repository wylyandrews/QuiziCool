<?php

include 'db.php';

$result = pg_query($db, 'SELECT * FROM categories INNER JOIN players ON categories.creatorid=players.playerid');
print(json_encode(pg_fetch_all($result)));

?>