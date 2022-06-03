<!-- Include header -->
<?php include 'header.php';

#Connecting to the database 
include './connection.php';

# Else create query
$query = "SELECT Pid, Fname, Lname, Bday, Phone FROM PERSON;";

include "table_generation.php";
?>
<!-- Footer -->
<?php include 'footer.php'?>
