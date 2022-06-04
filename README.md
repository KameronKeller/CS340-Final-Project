# CS340-Final-Project
*By Dalton Shults and Kameron Keller*

Final Project for Introduction to Databases (CS 340), Spring 2022

### INSTALLATION
**Requires PHP and MySQL or MariaDB**

1. Create a user and database to match what is specified in config.php. Alternatively, update config.php to match the user and database you would like to use. Ensure that the database port matches your database software.
2. Start a web server in the directory of the website files.
3. Import the SQL file, ensure foreign key checks are turned off.
	* If using command line tools, try this: https://stackoverflow.com/questions/15938786/disabling-foreign-key-checks-on-the-command-line
	* If using phpMyAdmin to import, uncheck "Enable foreign key checks" as shown [here](assets/import.png).
4. Navigate to localhost:[port_number] in your browser, where port_number is the port your web server is running on.
