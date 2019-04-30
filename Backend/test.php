<?php

include 'db.php';

//Anything with options should use pg_query params to avoid SQL injection attacks
$result = pg_query($dbcon, 'SELECT * FROM questions');
$i = pg_num_fields($result);

/*
for($j = 0; $j < $i; $j++) {
  print "column $j\n";
  $fieldname = pg_field_name($result, $j);
  print "fieldname: $fieldname\n";
}*/

print json_encode(pg_fetch_assoc($result))

?>