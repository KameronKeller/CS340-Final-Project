<!-- 
Class: CS 340
Assignment: Final Project
Authors:
  Dalton Shults
  Kameron Keller
Date: 06/04/2022
 -->

<?php
include './header.php';
?>
<div class="container">
  <form action="./query_generator.php" method="POST" id="form">
    <h1><label for="Query">Query: </label><br></h1>
    <textarea type="text-area" name="Query" cols=100 rows=10></textarea><br>
    <button class="btn-lg btn-dark mt-5" type="submit" form="form" value="Submit">Submit</button>    
  </form>
</div>
<?php
include './footer.php';
?>
