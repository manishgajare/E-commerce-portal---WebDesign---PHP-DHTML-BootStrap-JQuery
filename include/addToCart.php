<?php 
session_start();
require_once('../db/db.php'); 
?>

<?php 
 
 if( isset($_GET["productId"]) &&  isset($_GET["size"]) ) 
{

 $productId = $_GET["productId"];
 $size = $_GET["size"];
 $quantity = $_GET["orderQuantity"];
 


$sql = "SELECT * FROM product WHERE productId = $productId";
foreach ($dbh->query($sql) as $row)
        {
  		$productCode = $row['productCode'];
		
		}




 
    $sql = "SELECT * FROM inventory WHERE productId = $productId and size=$size";




	
	
	foreach ($dbh->query($sql) as $row)
        {
  		$cost = $row['cost'];
		
		
		
 if( !isset($_SESSION['order_item_product_id']) && !isset($_SESSION['order_item_size']) )
{
$_SESSION['order_item_product_id']  = array();
$_SESSION['order_item_size']  = array();
$_SESSION['order_item_cost']  = array();
$_SESSION['order_item_quantity']  = array();
$_SESSION['order_product_code']  = array();
$_SESSION['count']  = 0;

$_SESSION['order_item_product_id'][$_SESSION['count']] = $productId;
$_SESSION['order_item_size'][$_SESSION['count']] = $size;
$_SESSION['order_item_cost'][$_SESSION['count']] = $cost;
$_SESSION['order_item_quantity'][$_SESSION['count']] = $quantity;
$_SESSION['order_product_code'][$_SESSION['count']] = $productCode;


$_SESSION['count']++;

echo "first order item added";

}
else if( isset($_SESSION['order_item_product_id']) && isset($_SESSION['order_item_size']) )
{

$_SESSION['order_item_product_id'][$_SESSION['count']] = $productId;
$_SESSION['order_item_size'][$_SESSION['count']] = $size;
$_SESSION['order_item_cost'][$_SESSION['count']] = $cost;
$_SESSION['order_item_quantity'][$_SESSION['count']] = $quantity;
$_SESSION['order_product_code'][$_SESSION['count']] = $productCode;


$_SESSION['count']++;




}

  
}


for($a=0;$a<sizeof($_SESSION['order_item_product_id']);$a++){
?>


				<table>
                  <tbody>
					<tr>
                      <td class="name"><a href="product.html"><?php echo $_SESSION['order_product_code'][$a]; ?></a></td>
                      <td class="quantity">x&nbsp;<?php echo $_SESSION['order_item_quantity'][$a]; ?></td>
                      <td class="total">$<?php echo $_SESSION['order_item_cost'][$a]; ?></td>
                      <td class="remove"><i class="icon-remove"></i></td>
                    </tr>
                  </tbody>
                </table>
				
				
	<?php
				
}

}  
  ?>
