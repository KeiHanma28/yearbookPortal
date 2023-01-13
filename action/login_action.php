<?php
session_start(); // Starting Session
$error=''; // Variable To Store Error Message
$con = mysqli_connect('localhost','root','','tracerdata') or die("ERROR");
$log = mysqli_query($con,"SELECT * FROM `user_account`");
    $datalog = mysqli_fetch_array($log);
	$data_username = $datalog['user_name']; 
	$data_password = $datalog['user_password']; 
if (isset($_POST['submit-student'])) {
		if (empty($_POST['username']) || empty($_POST['password'])) 
			{
				echo "<script>alert('Username or Password is empty !');
										window.location='index.php';
									</script>";
				// Change this to bootstrap alert
			
			}
		
		else
		{
			login();
			
		}
}
if (isset($_POST['submit-teacher'])) {
		if (empty($_POST['username']) || empty($_POST['password'])) 
			{
				echo "<script>alert('Username or Password is empty !');
					window.location='index.php';
				</script>";
				// Change this to bootstrap alert
			
			}
		
		else
		{
			login();
		}
}

function login(){

			$con = mysqli_connect('localhost','root','','tracerdata') or die("ERROR");
			// Define $username and $password
			$username=$_POST['username'];
			$password=$_POST['password'];
			// To protect MySQL injection for Security purpose
			$username = stripslashes($username);
			$password = stripslashes($password);
			$username = mysqli_real_escape_string($con,$username);
			$password = mysqli_real_escape_string($con,$password);
			
 			$input = "$password";
			// SQL query to fetch information of registerd users and finds user match.
			$query = mysqli_query($con,"SELECT * FROM `user_account` WHERE `user_name` = '$username' AND `user_password` = '$password'");
			$rows = mysqli_fetch_assoc($query);
			$sid= $rows['user_ID'];
			$query = mysqli_query($con,"SELECT * FROM `user_student_detail` WHERE `student_userID` = '$sid'");
			$srows= mysqli_fetch_assoc($query);
			

			if ($rows['user_level'] == '0') 
			{	
				$_SESSION['login_user']=$username; // Initializing Session
				header("location: dashboard.php"); //go to dashboard
			} 
			if ($rows['user_level'] == '1') 
			{
				if($srows['student_status'] == 'unregister'){
					$_SESSION['login_user'] = $username;
					if(!isset($_SESSION['login_user'])) {
						echo "<script>alert('Username not set please try again.');
						window.location='index.php';
					  </script>";
					  }
					  if(isset($_SESSION['login_user'])){
					echo "<script>
					alert('You are not a bonified graduate. Please verify your account !');
				window.location='verify_student.php';
				</script>";}
				
				}
				if($srows['student_status'] == 'register'){
				$_SESSION['login_user']=$username; // Initializing Session
				header("location: dashboard.php"); //go to dashboard
				}
				else{
					echo "<script>alert('Graduate does not exist, please try again.');
					window.location='index.php';
				</script>";
				}
			} 
			if ($rows['user_level'] == '2') 
			{
				$_SESSION['login_user']=$username; // Initializing Session
				header("location: dashboard.php"); //go to dashboard
			} 
			if ($rows['user_level'] == '3') 
			{
				$_SESSION['login_user']=$username; // Initializing Session
				header("location: dashboard.php"); //go to dashboard
			} 
			else 
			{
				echo "<script>swal('Good job!', 'You clicked the button!', 'success');
									window.location='index.php';
								</script>";
								// Change this to bootstrap alert
			}
			if ($rows['user_name'] != $username || $rows['user_password'] != $username) {
				echo "<script>
				alert('Username or Password is incorrect try again !');
				window.location='index.php';
				</script>";
				include('alert/danger.php');
									
			}
			mysqli_close($con); // Closing Connection
}




?>