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






</head>


<body>


<!-- header start-->
<?php require_once('include/header.php'); ?>
<!-- header end -->


<div id="maincontainer">
  <section id="product">
    <div class="container">
     <!--  breadcrumb -->  
      <ul class="breadcrumb">
        <li>
          <a href="#">Home</a>
          <span class="divider">/</span>
        </li>
        <li class="active">Category</li>
      </ul>
      <div class="row">        
        <!-- Sidebar Start-->
        <aside class="span3">

		
		
          <!--  Must have -->  
          <div class="sidewidt">




     <div class="sorting well"> <center><font size=5 ><b>Popular Products</b></font></center> </div>

  <?php      
	$size = array();
	$cost = array();
	//SELECT TOP 4 * FROM product ORDER By NEWID()
    $sql = "SELECT * FROM product  WHERE status='active' order BY RAND() LIMIT 2";

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
		
	            
              <center><a href="product.php?productId=<?php echo $productId; ?>"><font size=4>
<?php			  
$arr = explode(' ',trim($row['description']));
for($i=0;$i<count($arr);$i++){
echo $arr[$i]." ";
if($i==3)
echo"<br>";
}
?>
			</font>  </a></center>
             <br> <div class="thumbnail"><center>
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
            
		<br><br>
	<?php	
		}
?>		  
	
		







          </div>
		  
		  
		  
        </aside>
        <!-- Sidebar End-->
        <!-- Category-->
        <div class="span9">          
          <!-- Category Products-->
          <section id="category">
            <div class="row">
              <div class="span9">
               <!-- Sorting-->
     <div class="sorting well"> <center><font size=5 ><b>All Products</b></font></center> </div>
               <!-- Category-->
                <section id="categorygrid">
				
                  <ul class="thumbnails grid" >
			



			
<?php




 
	$size = array();
	$cost = array();
    $sql = "SELECT * FROM product WHERE status='active' ORDER by productId DESC";

	foreach ($dbh->query($sql) as $row)
        {
		$productId = $row['productId'];
	
    	$sql1 = "SELECT * FROM inventory WHERE productId=$productId and quantityAvailable>0";
		$count=0;
		foreach ($dbh->query($sql1) as $row1)
        {
		$size[$count]=$row1['size'];
		$cost[$count]=$row1['cost'];
		$count++;
		}
		
	?>
		  


	            <li class="span3">
              <a class="prdocutname" href="product.php?productId=<?php echo $productId; ?>"><?php

$arr = explode(' ',trim($row['description']));
for($i=0;$i<count($arr);$i++){
echo $arr[$i]." ";
if($i==3)
echo"<br>";
}


					?>
			  
			  </a>
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
                  <ul class="thumbnails list row">
                    <li>
                      <div class="thumbnail">
                        <div class="row">
                          <div class="span3">
                            <span class="offer tooltip-test" >Offer</span>
                            <a href="#"><img alt="" src="img/product1.jpg"></a>
                          </div>
                          <div class="span6">
                            <a class="prdocutname" href="product.html">Product Name Here</a>
                            <div class="productdiscrption"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.<br>
                              <br>
                              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.
                              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's stan </div>
                            <div class="pricetag">
                              <span class="spiral"></span><a href="#" class="productcart">ADD TO CART</a>
                              <div class="price">
                                <div class="pricenew">$4459.00</div>
                                <div class="priceold">$5000.00</div>
                              </div>
                            </div>
                            <div class="shortlinks">
                              <a class="details" href="#">DETAILS</a>
                              <a class="wishlist" href="#">WISHLIST</a>
                              <a class="compare" href="#">COMPARE</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="thumbnail">
                        <div class="row">
                          <div class="span3">
                            <span class="offer tooltip-test" >Offer</span>
                            <a href="#"><img alt="" src="img/product1.jpg"></a>
                          </div>
                          <div class="span6">
                            <a class="prdocutname" href="product.html">Product Name Here</a>
                            <div class="productdiscrption"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.<br>
                              <br>
                              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.
                              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's stan </div>
                            <div class="pricetag">
                              <span class="spiral"></span><a href="#" class="productcart">ADD TO CART</a>
                              <div class="price">
                                <div class="pricenew">$4459.00</div>
                                <div class="priceold">$5000.00</div>
                              </div>
                            </div>
                            <div class="shortlinks">
                              <a class="details" href="#">DETAILS</a>
                              <a class="wishlist" href="#">WISHLIST</a>
                              <a class="compare" href="#">COMPARE</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div class="thumbnail">
                        <div class="row">
                          <div class="span3">
                            <span class="offer tooltip-test" >Offer</span>
                            <a href="#"><img alt="" src="img/product1.jpg"></a>
                          </div>
                          <div class="span6">
                            <a class="prdocutname" href="product.html">Product Name Here</a>
                            <div class="productdiscrption"> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.<br>
                              <br>
                              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard.
                              Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's stan </div>
                            <div class="pricetag">
                              <span class="spiral"></span><a href="#" class="productcart">ADD TO CART</a>
                              <div class="price">
                                <div class="pricenew">$4459.00</div>
                                <div class="priceold">$5000.00</div>
                              </div>
                            </div>
                            <div class="shortlinks">
                              <a class="details" href="#">DETAILS</a>
                              <a class="wishlist" href="#">WISHLIST</a>
                              <a class="compare" href="#">COMPARE</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>


				  </section>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
  </section>
</div>


<!-- footer start -->
<?php require_once('include/footer.php'); ?>
<!-- footer end -->
