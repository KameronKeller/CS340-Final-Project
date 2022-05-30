<?php include "./header.php" ?>

<!--Start of form -->
<div class="container">
  <form action="./joined.php" method="POST">

    <!--First Name -->    
    <label for="Fname">First Name:</label><br>
    <input type="text" name="Fname" required><br>
    
    <!--Last Name --> 
    <label for="Lname">Last Name:</label><br>
    <input type="text" name="Lname" required><br>

    <!--Date --> 
    <label for="Date">Birthdate:</label><br>
    <input type="text" name="Bday" placeholder="DD/MM/YYYY" required><br>
    
     <!-- Phone Number -->
    <label for="Phone_number">Phone Number:</label><br>
    <input type="text" name="Phone" placeholder="1231231234" maxlength="10" minlength="10" required><br>

    <!-- Address -->
    <p class="pt-3 font-weight-bold" >Address:</p>

    <!-- Street -->
    <label for="Street">Street: </label><br>
    <input type="text" name="Street" placeholder="1234 Your Address Wy." required><br>
    
    <!-- City -->
    <label for="City">City: </label><br>
    <input type="text" name="City" require><br>

    <!-- State -->
    <label for="Street">State: </label><br>
    <input type="text" name="State" placeholder="Use two letter abbreviation" maxlength="2" minlength="2" required><br>

    <!-- Email -->
    <label for="Email">Email: </label><br>
    <input type="text" name="Email" placeholder="JohnDoe@Kamflightschool.com" class="mb-3" required><br>

    <input type="submit">




    


  </form>
</div>
<?php include "./footer.php" ?>