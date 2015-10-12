<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">

<title>SHOP & SHOP</title>


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- links start-->
<?php require_once('include/links.php'); ?>
<!-- links end -->


<script>
function addToCart(){
 var ajaxRequest;  // The variable that makes Ajax possible!
	
 try{
   // Opera 8.0+, Firefox, Safari
   ajaxRequest = new XMLHttpRequest();
 }catch (e){
   // Internet Explorer Browsers
   try{
      ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
   }catch (e) {
      try{
         ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
      }catch (e){
         // Something went wrong
         alert("Your browser broke!");
         return false;
      }
   }
 }
 // Create a function that will receive data 
 // sent from the server and will update
 // div section in the same page.
 ajaxRequest.onreadystatechange = function(){
   if(ajaxRequest.readyState == 4){
      var ajaxDisplay = document.getElementById('message');
      ajaxDisplay.innerHTML = ajaxRequest.responseText;
   }
 }
 // Now get the value from user and pass it to
 // server script.
 var productId = document.getElementById('productId1').value;
 var size = document.getElementById('dropdown1').value;
 var orderQuantity = document.getElementById('dropdown2').value;
 var queryString = "?productId=" + productId ;
 queryString +=  "&size=" + size;
 queryString +=  "&orderQuantity=" + orderQuantity;
 ajaxRequest.open("GET", "include/addToCart.php" + queryString, true);
 ajaxRequest.send(null); 
}
</script>


















</head>


<body>


<!-- header start-->
<?php require_once('include/header.php'); ?>
<!-- header end -->


<div id="maincontainer">


<?php
$productId = $_GET['productId']; 
    $sql = "SELECT * FROM product WHERE productId = $productId and status='active'";

	foreach ($dbh->query($sql) as $row)
        {
		$subCategoryId = $row['subCategoryId'];
		$name = $row['name'];
		$description = $row['description'];
		$style = $row['style'];
		$fullDescription = $row['fullDescription'];
		$productCode = $row['productCode'];
		}
		
    $sql = "SELECT size,cost FROM inventory WHERE productId = $productId and quantityAvailable>0";

	$size = array();
	$cost = array();

	$count=0;
	foreach ($dbh->query($sql) as $row)
        {
		$size[$count] = $row['size'];
		$cost[$count] = $row['cost'];
		$count++;
		}
		
    $sql = "SELECT * FROM product_image WHERE productId = $productId ";

	$imagePath = array();
	$thumbnailPath = array();
	$count1=0;
	foreach ($dbh->query($sql) as $row)
        {
		$imagePath[$count1] = $row['imagePath'];
		$thumbnailPath[$count1] = $row['thumbnailPath'];
		$count1++;
		}
		
		?>




  <section id="product">
    <div class="container">      
      <!-- Product Details-->
      <div class="row">
       <!-- Left Image-->
        <div class="span5">

		
		
		<ul class="thumbnails mainimage">
		
		<?php
		foreach($imagePath as $value){
		?>
		  <li class="span5">
              <a  rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4" class="thumbnail cloud-zoom" href="img/clothing/shirt/main/<?php echo $value;?>.jpg">
                <img src="img/clothing/shirt/main/<?php echo $value;?>.jpg" alt="" title="">
              </a>
            </li>
		<?php
		}
		?>
			</ul>
          <span>Mouse move on Image to zoom</span>
          <ul class="thumbnails mainimage">
	
	<?php foreach($thumbnailPath as $value){
		?>

		<li class="producthtumb">
              <a class="thumbnail" >
                <img  src="img/clothing/shirt/thumbnail/<?php echo $value;?>.jpg" alt="" title="">
              </a>
            </li>

		<?php
		}
		?>

			</ul>
        </div>
         <!-- Right Details-->
        <div class="span7">
		<form id="addProductForm" method="get" >
          <div class="row">
            <div class="span7">
              <h1 class="productname"><span class="bgnone"><?php echo $description;?></span></h1>
              <div class="productprice">
                <div class="productpageprice">
                  <span class="spiral"></span>$<?php echo $cost[0]; ?>-$<?php echo $cost[$count-1]; ?></div>
             <!--   <div class="productpageoldprice">Old price : $345.00</div> -->
             <!--   <ul class="rate">
                  <li class="on"></li>
                  <li class="on"></li>
                  <li class="on"></li>
                  <li class="off"></li>
                  <li class="off"></li>
                </ul> -->
              </div>
			  
<script>			  
function showAvailableQuantityAndCost(size,productId){
 var ajaxRequest;  // The variable that makes Ajax possible!
	
 try{
   // Opera 8.0+, Firefox, Safari
   ajaxRequest = new XMLHttpRequest();
 }catch (e){
   // Internet Explorer Browsers
   try{
      ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
   }catch (e) {
      try{
         ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
      }catch (e){
         // Something went wrong
         alert("Your browser broke!");
         return false;
      }
   }
 }
 // Create a function that will receive data 
 // sent from the server and will update
 // div section in the same page.
 ajaxRequest.onreadystatechange = function(){
   if(ajaxRequest.readyState == 4){
      var ajaxDisplay = document.getElementById('showResult');
      ajaxDisplay.innerHTML = ajaxRequest.responseText;
   }
 }
 // Now get the value from user and pass it to
 // server script.
 var queryString = "?size=" + size ;
 queryString +=  "&productId=" + productId;
 ajaxRequest.open("GET", "include/showAvailableQuantityAndCost.php" + queryString, true);
 ajaxRequest.send(null); 
}
</script>
			  
			  
			  
              <div class="quantitybox">
			  <input type="hidden" name="productId1" id="productId1" value="<?php echo $productId; ?>" />
			  Size:<br>
                <select name="dropdown1" id="dropdown1" onchange="showAvailableQuantityAndCost(this.value,<?php echo $productId; ?>)" class="selectsize">
                  <option>Select Size</option>
                  <?php
					foreach($size as $value){				  
				  ?>
				  <option value="<?php echo $value; ?>" ><?php echo $value; ?></option>
                  <?php
					}
				  ?>
                </select>
				
				<div id="showResult">Please Select Size to get Available Quantity & Price</div>
                <!--<select name="dropdown2" class="selectqty">
                  <option>Select</option>
                  <option>24</option>
                  <option>36</option>
                  <option>48</option>
                </select> -->
                <div class="clear"></div>
              </div>
              <ul class="productpagecart">
	<!--		  document.getElementById('addProductForm').submit() -->
                <li><a class="cart" href="#" onclick="addToCart();">Add to Cart</a>
                </li>
              </ul>
         <!-- Product Description tab & comments-->
         <div class="productdesc">
                <ul class="nav nav-tabs" id="myTab">
                  <li class="active"><a href="#description">Description</a>
                  </li>
                  <li><a href="#specification">Specification</a>
                  </li>
                  <li><a href="#review">Review</a>
                  </li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
                    <h2>Description</h2><br>
                    <?php echo $fullDescription; ?>
					<br><br>
					Style - <?php echo $style; ?>
					<br><br><br><br>
					</div>

					<div class="tab-pane " id="specification">
						<h2>Specification</h2><br>
					<ul class="productinfo">
                      <li>
                        <span class="productinfoleft"> Product Code:</span> <?php echo $productCode; ?> </li>
                      <li>
                        <span class="productinfoleft"> Availability: </span> In Stock ( <?php for($i=0;$i<$count;$i++)echo "$size[$i] "; ?>)</li>
                      <li>
                        <span class="productinfoleft"> Price:</span> $<?php echo $cost[0]; ?> - $<?php echo $cost[$count-1]; ?> (depends on size) </li>
                      <li>
                        <span class="productinfoleft"> Extra Amount: </span> Tax + Shipping Charges (free if order is above $200) </li>
                    </ul>
					<br><br>
                  </div>
                  <div class="tab-pane" id="review" style="overflow: auto;">
                    <h2>Reviews - </h2>
<br>
Reviews by the customers will be posted here
<br><br><br><br><br><br><br><br>
					
					</div>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
		</form>
      </div>
    </div>
  </section>
  <!--  Related Products-->
  <section id="related" class="row">
    <div class="container">
      <h1 class="heading1"><span class="maintext">Related Products</span><span class="subtext"> See Our Most featured Products</span></h1>
      <ul class="thumbnails">
  
  <?php      
	$size = array();
	$cost = array();
	//SELECT TOP 4 * FROM product ORDER By NEWID()
    $sql = "SELECT * FROM product  WHERE status='active' order BY RAND() LIMIT 4";

	foreach ($dbh->query($sql) as $row)
        {
		$productId = $row['productId'];
	
    	$sql1 = "SELECT * FROM inventory WHERE productId=$productId and quantityAvailable>0 ";
		$count=0;
		foreach ($dbh->query($sql1) as $row1)
        {
		$size[$count]=$row1['size'];
		$cost[$count]=$row1['cost'];
		$count++;
		}
		
	?>
		
	            <li class="span3">
              <a class="prdocutname" href="product.php?productId=<?php echo $productId; ?>"><?php echo $row['description']; ?></a>
              <div class="thumbnail"><center>
                <a href="product.php?productId=<?php echo $productId; ?>"><img alt="" src="img/clothing/shirt/thumbnail/<?php echo $row['name']; ?>a.jpg"></a>
				</center>
                <div class="pricetag">
                  <span class="spiral"></span><a href="#" class="productcart">QUICK ADD</a>
                  <div class="price">
                    <div class="pricenew">$<?php echo $cost[0]; ?>-$<?php echo $cost[$count-1]; ?></div>
                    <div class="priceold">(<?php for($i=0;$i<$count;$i++)echo "$size[$i] "; ?>)</div>
                  </div>
                </div>
				
              </div>
            </li>
		
	<?php	
		}
?>		  
	
		
      </ul>
    </div>
  </section>
  <!-- Popular Brands-->
  <section id="popularbrands" class="container">
    <h1 class="heading1"><span class="maintext">Popular Brands</span><span class="subtext"> See Our  Popular Brands</span></h1>
    <div class="brandcarousalrelative">
      <ul id="brandcarousal">
            <li><img src="img/brand1.jpg" alt="" title=""/></li>
            <li><img src="img/brand2.jpg" alt="" title=""/></li>
            <li><img src="img/brand3.jpg" alt="" title=""/></li>
            <li><img src="img/brand4.jpg" alt="" title=""/></li>
            <li><img src="img/brand5.jpg" alt="" title=""/></li>
            <li><img src="img/brand6.jpg" alt="" title=""/></li>
            <li><img src="img/brand7.jpg" alt="" title=""/></li>
            <li><img src="img/brand8.jpg" alt="" title=""/></li>
            <li><img src="img/brand9.jpg" alt="" title=""/></li>
            <li><img src="img/brand10.jpg" alt="" title=""/></li>
      </ul>
      <div class="clearfix"></div>
      <a id="prev" class="prev" href="#">&lt;</a>
      <a id="next" class="next" href="#">&gt;</a>
    </div>
  </section>
</div>

<!-- footer start -->
<?php require_once('include/footer.php'); ?>
<!-- footer end -->
