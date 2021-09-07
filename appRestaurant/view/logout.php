<?php 
	

    if((isset($_SESSION['uid']) && isset($_SESSION['username']) && isset($_SESSION['user_role'])) )  {
        if($_SESSION['user_role'] == "ADMIN") {
        	session_destroy();
         	header("Location: login.php");
        }
        else
        	header("Location: login.php");
    }

    else
    	header("Location: login.php");

?>