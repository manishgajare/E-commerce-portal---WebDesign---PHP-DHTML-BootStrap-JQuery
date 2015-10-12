<?php 
session_start();
require_once('database/db.php'); 


 
 if( isset($_GET["product_id"]) &&  isset($_GET["size"])  && $_GET["action"] == "add" ) 
{

 $product_id = $_GET["product_id"];
 $size = $_GET["size"];
 

 
 
$dbobj =  MySqlConnection::getInstance();
$result = $dbobj->execQuery('select * from product where product_id = %i',$product_id);

  if($result->notEmpty())
  {
  
  
 if( !isset($_SESSION['order_product_id']) && !isset($_SESSION['order_size']) )
{
$_SESSION['order_product_id']  = array();
$_SESSION['order_size']  = array();
$_SESSION['count']  = 0;

$_SESSION['order_product_id'][$_SESSION['count']] = $product_id;
$_SESSION['order_size'][$_SESSION['count']] = $size;


$_SESSION['count']++;

echo "<meta http-equiv=\"refresh\" content=\"0; url=shopping_cart.php\">";		


}
else if( isset($_SESSION['order_product_id']) && isset($_SESSION['order_size']) )
{

$_SESSION['order_product_id'][$_SESSION['count']] = $product_id;
$_SESSION['order_size'][$_SESSION['count']] = $size;


$_SESSION['count']++;


echo "<meta http-equiv=\"refresh\" content=\"0; url=shopping_cart.php\">";		








}
  
  
  
  
  
  
  
  
  
}

}  
  ?>