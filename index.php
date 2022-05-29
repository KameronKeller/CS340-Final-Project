<?php include 'header.php' ?>
<?php
include './config.php';

$connection =  new mysqli($database_hostname, $database_username, $database_password, $database_db_name, $database_port);

if(mysqli_connect_errno()) {
  echo "Failed to connect";
  $connection.die();
}
?>

  <div class="container">
    <table class="table mt-3">
      <thead>
        <th scope="col">PHP VARIABLE</th>
        <th scope="col">PHP VARIABLE</th>
        <th scope="col">PHP VARIABLE</th>
        <th scope="col">PHP VARIABLE</th>
        <th scope="col">PHP VARIABLE</th>
      </thead>
      <tbody>
        <tr>
          <th scope="row">ID</th>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
        </tr>
        <tr>
          <th scope="row">ID</th>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
          <td>PHP VAR VALUE</td>
        </tr>
      </tbody>
    </table>
  </div>
<?php include 'footer.php'?>

