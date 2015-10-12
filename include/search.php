<?php
 /*
 require_once('../db/db.php'); 


$sql = "SELECT * "
	."FROM product "
	."WHERE desc LIKE '%".$_REQUEST['term']."%' "; 

	$return = array();
	
	foreach ($dbh->query($sql) as $row)
{
	$results[] = array('label' => $row['desc']);
}

echo json_encode($results);
*/
?>


<?php
  $mysqli = new mysqli("localhost", "root", "qwerty123$", "webdesign");
 
  // check connection
  if ($mysqli->connect_errno){
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
  }
 
  $query = 'SELECT desc FROM product';
 
  if(isset($_POST['query'])){
    // Add validation and sanitization on $_POST['query'] here
 
    // Now set the WHERE clause with LIKE query
    $query .= ' WHERE desc LIKE "%'.$_POST['query'].'%"';
  }
 
  $return = array();
 
  if($result = $mysqli->query($query)){
    // fetch object array
    while($obj = $result->fetch_object()) {
      $return[] = $obj->desc;
    }
    // free result set
    $result->close();
  }
 
  // close connection
  $mysqli->close();
 
  $json = json_encode($return);
  print_r($json);
  
  ?>