<?php
include "./config.php";
session_start();
$_SESSION['POST'] = $_POST;

$db =  new mysqli($database_hostname, $database_username, $database_password, $database_db_name, $database_port);

if(mysqli_connect_errno()) {
  echo "Failed to connect";
  $db.die();
}

$string = "INSERT INTO PERSON (Fname, Lname, Bday, Phone, Street, City, State, Email) VALUES ('$_POST[Fname]', '$_POST[Lname]', '$_POST[Bday]', '$_POST[Phone]', '$_POST[Street]', '$_POST[City]', '$_POST[State]', '$_POST[Email]');";

echo $string;


$q = $db->query($string);

mysqli_close($db);
header("Location: /thanks.php")
?>