<?php
#Including db configuration
include "./config.php";
session_start();

#Storing post data from the FORM in a session
$_SESSION['POST'] = $_POST;

#Connecting to the database
$db =  new mysqli($database_hostname, $database_username, $database_password, $database_db_name, $database_port);

# If the connection fails
if(!$db) {
  die("Failed: ".mysqli_connection_error());
}

# Creating query string
$string = "INSERT INTO PERSON (Fname, Lname, Birthday, Phone, Email, Street, City, State) VALUES ('$_POST[Fname]', '$_POST[Lname]', '$_POST[Bday]', '$_POST[Phone]', '$_POST[Street]', '$_POST[City]', '$_POST[Email]', '$_POST[State]');";

# Echo for testing
echo $string;

# Query db with string
$q = $db->query($string);

# Close connection to database
mysqli_close($db);

# Redirect to thanks.php
#header("Location: /thanks.php")
?>