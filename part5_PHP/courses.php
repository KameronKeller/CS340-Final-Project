<!-- Include header -->
<?php include 'header.php';

#Connecting to the database 
include './connection.php';

# Else create query
$query = "SELECT Cname as 'Name', Required_hours AS 'Total Hours', Cost AS 'Price' FROM COURSE_TYPE;";

include './table_generation.php';
?>
<!-- Footer -->
<?php include 'footer.php'?>



