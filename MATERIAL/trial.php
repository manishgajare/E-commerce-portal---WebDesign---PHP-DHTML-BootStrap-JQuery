<?php
/*** mysql hostname ***/
$hostname = 'localhost';

/*** mysql username ***/
$username = 'root';

/*** mysql password ***/
$password = 'qwerty123$';

try {
    $dbh = new PDO("mysql:host=$hostname;dbname=webdesign", $username, $password);
    /*** echo a message saying we have connected ***/
    echo 'Connected to database<br />';

    /*** The SQL SELECT statement ***/
    $sql = "SELECT * FROM product";
    foreach ($dbh->query($sql) as $row)
        {
        print $row['productId'] .' - '. $row['desc'] . '<br />';
        }

    /*** close the database connection ***/
    $dbh = null;
}
catch(PDOException $e)
    {
    echo $e->getMessage();
    }
?>