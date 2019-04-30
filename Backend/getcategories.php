<?php

include 'db.php';

$result = pg_query($db, 'SELECT * FROM categories');
print(json_encode(pg_fetch_assoc($result)));

?>