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

<?php $page = "home"; ?>
<!-- header start-->
<?php require_once('include/header.php'); ?>
<!-- header end -->



<div id="maincontainer">
  <!-- Slider Start-->
  <section class="slider">
    <div class="container">
      <div class="flexslider" id="mainslider">
        <ul class="slides">
          <li>
            <img src="img/banner1.jpg" alt="" />
          </li>
          <li>
            <img src="img/banner2.jpg" alt="" />
          </li>
          <li>
            <img src="img/banner1.jpg" alt="" />
          </li>
          <li>
            <img src="img/banner2.jpg" alt="" />
          </li>
        </ul>
      </div>
    </div>
  </section>
  <!-- Slider End-->
  
  <!-- Section Start-->
  <section class="container otherddetails">
    <div class="otherddetailspart">
      <div class="innerclass free">
        <h2>Free shipping</h2>
        All over in world over $200 </div>
    </div>
    <div class="otherddetailspart">
      <div class="innerclass payment">
        <h2>Easy Payment</h2>
        Payment Gatway support </div>
    </div>
    <div class="otherddetailspart">
      <div class="innerclass shipping">
        <h2>24hrs Shipping</h2>
        Free For UK Customers </div>
    </div>
    <div class="otherddetailspart">
      <div class="innerclass choice">
        <h2>Over 5000 Choice</h2>
        50,000+ Products </div>
    </div>
  </section>
  <!-- Section End-->
  <div class="container">
    <div class="row">
      <!-- Featured Product-->
      <div class="span6">
        <section id="featured" class="row mt40">
          <h1 class="heading1"><span class="maintext">Featured Products</span></h1>
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
              <a class="prdocutname" href="product.php?productId=<?php echo $productId; ?>">
<?php			  
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
        </section>
      </div>
      
      <!-- Latest Product-->
      <div class="span6">
        <section id="latest" class="row mt40">
          <h1 class="heading1"><span class="maintext">Latest Products</span></h1>
          <ul class="thumbnails">
		  
<?php

	$size = array();
	$cost = array();
    $sql = "SELECT * FROM product WHERE status='active' ORDER by productId DESC LIMIT 4";

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
              <a class="prdocutname" href="product.php?productId=<?php echo $productId; ?>">
<?php			  
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
        </section>
      </div>
    </div>
  </div>
  
  <!-- Popular Brands-->
  <section id="popularbrands" class="container mt0">
    <div class="row">
      <div class="span9">
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
      </div>
      <div class="span3">
        <div class="sidewidt">
          <h1 class="heading1"><span class="maintext">Testimonials</span></h1>
          <div class="flexslider" id="testimonialsidebar">
            <ul class="slides">
  <?php            
	    $sql = "SELECT * FROM testimonial order BY RAND() LIMIT 4";

	foreach ($dbh->query($sql) as $row)
        {
		$message = $row['message'];
		$brandId = $row['brandId'];
		
		$sql1 = "SELECT * FROM brand where brandId=$brandId";
		foreach ($dbh->query($sql1) as $row1)
        {
		$name = $row1['name'];
		}
		  
	?>		  <li>
                " <?php echo $message; ?>"<br>
                <span class="pull-right orange">By : <?php echo $name; ?></span>
              </li>
      <?php
	  
}
?>      
			
			</ul>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>
<!-- /maincontainer -->


<!-- footer start -->
<?php require_once('include/footer.php'); ?>
<!-- footer end -->


