<?php
# Query the database
$q = $db->query($query);
?>

<!-- Creating table and header -->
<div class="container">
  <table class="table mt-3">
    <thead>
<?php 
#Grabbing table col names, and appending them to 
while ($col = $q->fetch_field()) {
  $name = $col->name;
?>
<th scope="col"><?=$name?></th>
<?php
}
?>
  </thead>
<?php

# While loop iterating over PERSONS returned from $query
# Creating table
while ($t = $q->fetch_assoc()) {
?>
<tr>    
  <?php
  foreach ($t as $value) {
  ?>
    <td><?=$value?></td>
  <?php
  # Closing for each bracket
  }
?>
</tr>


<?php
# Closing while loop bracket
}
?>
  </table>
</div>
