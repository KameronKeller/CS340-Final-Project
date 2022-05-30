<?php include "./header.php" ?>
<!--Header-->
<div class="container pt-4">
  <h3>Join Us!</h3>
  <p>Leave your contact info and we will reach out to you!</p>
</div>

<!--Start of form -->
<div class="container pt-4">
  <div class="row justify-content-md-cente">
    <div class="col">
    <p class="pt-3 font-weight-bold" >Address:</p>
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
      <input type="text" name="Phone" placeholder="1231231234" maxlength="10"   minlength="10" required><br>
    </div>
  
    <div class="col">
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
      <input type="text" name="State" placeholder="Use two letter abbreviation"   maxlength="2" minlength="2" required><br>
  
      <!-- Email -->
      <label for="Email">Email: </label><br>
      <input type="text" name="Email" placeholder="JohnDoe@Kamflightschool.com"   class="mb-3" required><br>
    </div>
  </div>
  <div class="row pt-4 pl-3">
      <input type="submit">
  </div>





    


  </form>
</div>
<?php include "./footer.php" ?>