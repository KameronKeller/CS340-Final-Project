<?php
#Including db configuration
include "./config.php";
session_start();

#Storing post data from the FORM in a session
$_SESSION['POST'] = $_POST;

#Connecting to the database
$db =  new mysqli($database_hostname, $database_username, $database_password, $database_db_name, $database_port);

# If the connection fails
if(mysqli_connect_errno()) {
  echo "Failed to connect";
  $db.die();
}

# Creating query string
$string = "INSERT INTO PERSON (Fname, Lname, Bday, Phone, Street, City, State, Email) VALUES ('$_POST[Fname]', '$_POST[Lname]', '$_POST[Bday]', '$_POST[Phone]', '$_POST[Street]', '$_POST[City]', '$_POST[State]', '$_POST[Email]');";

# Echo for testing
echo $string;

# Query db with string
$q = $db->query($string);

# Close connection to database
mysqli_close($db);

# Redirect to thanks.php
header("Location: /thanks.php")
?>