<?php
include './header.php';
?>
<div class="container">
  <form action="./query_generator.php" method="POST" id="form">
    <h1><label for="Query">Query: </label><br></h1>
    <textarea type="text-area" name="Query" cols=80% rows=20></textarea><br>
    <input class="mt-3" type="submit" value="Submit">
  </form>
</div>
<?php
include './footer.php';
?>