<?php include 'header.php' ?>
<?php
include './config.php';

$db =  new mysqli($database_hostname, $database_username, $database_password, $database_db_name, $database_port);
/* */
if(mysqli_connect_errno()) {
  echo "Failed to connect";
  $db.die();
}
$query = "SELECT Pid, Fname, Lname, Bday, Phone FROM PERSON;";

$q = $db->query($query);
?>
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
while ($t = $q->fetch_assoc()) {
  $Fname = $t['Fname'];
  $Lname = $t['Lname'];
  $Bday = $t['Bday'];
  $Phone = $t['Phone'];
  $Pid = $t['Pid'];

?>
<tr>
  <th scope="Row"><?=$Pid?></th>
  <td><?=$Fname?></td>
  <td><?=$Lname?></td>
  <td><?=$Bday?></td>
  <td><?=$Phone?></td>
</tr>
<?php
}
?>
  </table>
</div>

<?php include 'footer.php'?>
<?php mysqli_close($db)?>
