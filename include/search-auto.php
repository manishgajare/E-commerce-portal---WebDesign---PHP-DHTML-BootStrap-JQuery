<?php 
 require_once('../db/db.php'); 

 
 // Define Output HTML Formating
$html = '';
$html .= '<li class="result">';
$html .= '<a target="_blank" href="urlString">';
$html .= '<h6>nameString</h6>';
$html .= '</a>';
$html .= '</li>';


// Get Search
$search_string = $_POST['query'];

// Check Length More Than One Character
if (strlen($search_string) >= 1 && $search_string !== ' ') {
	// Build Query
	$query = 'SELECT * FROM product WHERE description LIKE "%'.$search_string.'%"';

	// Do Search
	foreach ($dbh->query($query) as $row)
{
		$result_array[] = $row['description'];
		$result_array1[] = $row['productId'];
	}

	// Check If We Have Results
	if (isset($result_array)) {
	
	for($i=0;$i<count($result_array);$i++)
	{
	$display_name = $result_array[$i];
	$display_url = "product.php?productId=$result_array1[$i]";
	
			// Insert Name
			$output = str_replace('nameString', $display_name, $html);

			// Insert URL
			$output = str_replace('urlString', $display_url, $output);

			// Output
			echo($output);
	}
	
	}else{

		echo("Sorry, no results found");
	}
}


?>