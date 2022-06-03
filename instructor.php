<!-- Include header -->
<?php include 'header.php';

#Connecting to the database 
include './connection.php';

# Else create query
$query = "SELECT * FROM INSTRUCTOR AS I JOIN PERSON AS P WHERE I.iid=P.pid ;";

# Query the database
include 'table_generation.php';
?>
<!-- Footer -->
<?php include 'footer.php'?>