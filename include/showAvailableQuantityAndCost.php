<?php require_once('../db/db.php'); 

$productId = (int)$_GET['productId']; 
$size = (int)$_GET['size']; 


    $sql = "SELECT * FROM inventory WHERE productId = $productId and size=$size";

	foreach ($dbh->query($sql) as $row)
        {
		
		$quantityAvailable = $row['quantityAvailable'];
		$cost = $row['cost'];
		?>
			
		<br><br>Quantity:<br> <select name="dropdown2" id="dropdown2" class="selectqty">
<?php
		
		for($i=1;$i<=$quantityAvailable;$i++){
		?>
                  <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                
	
	
		
	<?php
}
?>

</select>
<input type="hidden" id="cost1" name="cost1" value="<?php echo $cost; ?>"
	<?php
	
	echo"<br><br><br><br><b><font size=5>COST - \$$cost</font></b>";
	
	
		}
	?>
