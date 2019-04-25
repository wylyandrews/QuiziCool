<?php

$dbcon = pg_connect('host=isilo.db.elephantsql.com port=5432 dbname=uqyvztel user=uqyvztel password=fPnxEhQQJnHhEKWMWLkM39fiYIv8FP8w');
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