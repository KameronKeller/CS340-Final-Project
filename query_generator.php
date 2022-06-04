<?php
// Include header material
include './header.php';

// Establish connection to database
include './connection.php';

// Grab the query
$query = $_POST['Query'];

// Query the database and generate a table with result
include './table_generation.php';

// Include footer material
include './footer.php';

