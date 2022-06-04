<?php
# Creating connection with config file
include './config.php';

$db =  new mysqli($database_hostname, $database_username, $database_password, $database_db_name, $database_port);

# If there is a connection error die
if(mysqli_connect_errno()) {
  echo "Failed to connect";
  $db.die();
}
