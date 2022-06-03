<!-- Include header -->
<?php include 'header.php';

#Connecting to the database 
include './connection.php';

# Else create query
$query = "SELECT * FROM PERSON;";

include './table_generation.php';
?>
<!-- Footer -->
<?php include 'footer.php'?>



