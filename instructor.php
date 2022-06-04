<!-- Include header -->
<?php include 'header.php';

#Connecting to the database 
include './connection.php';

# Else create query
$query = "SELECT * FROM INSTRUCTOR NATURAL JOIN PERSON;";

# Query the database
include 'table_generation.php';
?>
<!-- Footer -->
<?php include 'footer.php'?>