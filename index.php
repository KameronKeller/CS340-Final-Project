<!-- Include header -->
<?php include 'header.php' ?>
<?php

# Connecting config file
include './config.php';

# Creating connection with config file
$db =  new mysqli($database_hostname, $database_username, $database_password, $database_db_name, $database_port);

# If there is a connection error die
if(!$db) {
  die("Failed: ".mysqli_connection_error());
}

# Else create query
$query = "SELECT Pid, Fname, Lname, Bday, Phone FROM PERSON;";

# Query the database
$q = $db->query($query);
?>

<!-- Creating table and header -->
<div class="container">
  <table class="table mt-3">
    <thead>
      <th scope="col">ID</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Birthday</th>
      <th scope="col">Phone</th>
    </thead>

<?php 
# While loop iterating over PERSONS returned from $query
# Creating table
while ($t = $q->fetch_assoc()) {
  $Fname = $t['Fname'];
  $Lname = $t['Lname'];
  $Bday = $t['Bday'];
  $Phone = $t['Phone'];
  $Pid = $t['Pid'];

?>
<!--Creating table records for each PERSON -->
<tr>
  <th scope="Row"><?=$Pid?></th>
  <td><?=$Fname?></td>
  <td><?=$Lname?></td>
  <td><?=$Bday?></td>
  <td><?=$Phone?></td>
</tr>

<!--Closing bracket for while loop -->
<?php
}
?>
  </table>
</div>

<!-- Include footer -->
<?php include 'footer.php'?>

<!-- Close database connection -->
<?php mysqli_close($db)?>
