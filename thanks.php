<?php require './header.php'?>
<?php
session_start();
$POST = $_SESSION['POST'];
?>
<div class="container">
  <h3>Thank you, <?= $POST['Fname']?>!</h3>
  <p>Some one will reach out and contact you via email, and phone to contact you about joining our school. Feel free to reach out and contact us at (111)111-1111</p>
</div>
<?php require './footer.php'?>