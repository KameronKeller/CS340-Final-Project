<!-- Include header -->
<?php include 'header.php';

#Connecting to the database 
include './connection.php';

# Else create query
$query = "SELECT Fname AS 'First Name', Lname AS 'Last Name', Phone, Email FROM INSTRUCTOR NATURAL JOIN PERSON;";

# Query the database
include 'table_generation.php';
?>
<!-- Footer -->
<?php include 'footer.php'?>