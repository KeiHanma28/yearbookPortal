<?php  
	$con = mysqli_connect('localhost','root','','tracerdata') or die("ERROR");
	if (isset($_POST['submit_recordstudent'])) {

		// Defining post variable names 
		$student_username = $_POST['student_username'];
		$student_password = $_POST['student_password'];
		$student_usernumber = $_POST['student_usernumber'];
		$student_sinumber = $_POST['student_sinumber'];
		$student_motto = $_POST['student_motto'];
		$student_firstname = $_POST['student_firstname'];
		$student_middlename = $_POST['student_middlename'];
		$student_lastname = $_POST['student_lastname'];
		$student_dob = $_POST['student_dob'];
		$student_contact = $_POST['student_contact'];
		$student_semester = $_POST['student_semester'];
		$student_gender = $_POST['student_gender'];
		$student_civilStat = $_POST['student_civil'];
		$student_address = $_POST['student_address'];
		$student_department = $_POST['student_department'];
		$student_year_grad = $_POST['student_year_grad'];
		$student_achievements = $_POST['student_achievements'];
		$student_parents = $_POST['student_parents'];
		if ($student_gender == "M") {
			$profileimg= "male.jpg";
		}
		if ($student_gender == "F") {
			$profileimg= "female.jpg";
		}
		if (empty($student_sinumber) || empty($student_usernumber)|| empty($student_firstname) || empty($student_middlename)|| empty($student_achievements)||empty($student_parents)|| empty($student_lastname)|| empty($student_address)|| empty($student_year_grad)|| empty($student_department)|| empty($student_semester)) {
			if (empty($student_sinumber) ) {
				echo "<script>alert('Empty student_sinumber !');
														window.location='../recordstudent.php';
													</script>";
			}
			
			if (empty($student_firstname)) {
				echo "<script>alert('Empty student_firstname !');
														window.location='../recordstudent.php';
													</script>";
			}
			if (empty($student_middlename)) {
				echo "<script>alert('Empty student_middlename !');
														window.location='../recordstudent.php';
													</script>";
			}
			if (empty($student_lastname)) {
				echo "<script>alert('Empty student_lastname !');
														window.location='../recordstudent.php';
													</script>";
			}
			if (empty($student_address)) {
				echo "<script>alert('Empty student_address !');
														window.location='../recordstudent.php';
													</script>";
			}
			if (empty($student_year_grad)) {
				echo "<script>alert('Empty student_year_grad !');
														window.location='../recordstudent.php';
													</script>";
			}
			
			if (empty($student_department)) {
				echo "<script>alert('Empty student_department !');
														window.location='../recordstudent.php';
													</script>";
			}
			if (empty($student_semester)) {
				echo "<script>alert('Empty student_semester !');
														window.location='../recordstudent.php';
													</script>";
			}
			
		}
		else{
			//insert query
			
			
		
				$sql = "INSERT INTO `user_student_detail` (
				`student_ID`,
				 `student_userID`,
				  `student_img`,
				   `student_IDNumber`,
				    `student_fName`,
				     `student_mName`,
				      `student_lName`,
				       `student_address`,
				        `student_civilStat`,
				         `student_dob`,
				          `student_gender`,
				           `student_contact`,
				            `student_semester`,
				             `student_year_grad`,
				              `student_department`,
				               `student_status`,
				                `student_secretquestion`,
				                 `student_secretanswer`,
								 `student_motto`,
								 `student_achievements`,
								 `student_parents`) 

				VALUES (
				NULL,
				'$student_usernumber',
				  '$profileimg',
				   '$student_sinumber',
				    '$student_firstname' ,
				     '$student_middlename' ,
				      '$student_lastname',
				       '$student_address' ,
				        '$student_civilStat',
				         '$student_dob',
				          '$student_gender',
				          '$student_contact' ,
				            '$student_semester',
				             '$student_year_grad',
				              '$student_department',
							  'unregister',
				                NULL,
				                 NULL,
							  'Enter Your Motto Here',
							  '$student_achievements',
							  '$student_parents'
				               );";
				
				$result = mysqli_query($con,"INSERT INTO `user_account` (user_ID, user_level, user_name, user_password,fname,lname) 
				VALUES ('$student_usernumber','1','$student_username','$student_password','$student_firstname','$student_lastname')");
			
				$res = mysqli_query($con,$sql);
				$last_id = mysqli_insert_id($con);
				$msg = mysqli_query($con,"INSERT INTO `users` (user_id, unique_id, fname,lname, email, password) 
				VALUES ('$last_id','$student_usernumber','$student_firstname','$student_lastname','$student_username','$student_password')");
				$chk = "UPDATE `user_student_detail` 
						SET `student_IDNumber` = '$student_sinumber' WHERE `user_student_detail`.`student_ID` = $last_id";
				if ($chk = mysqli_query($con,$chk)){

					echo "<script>alert('Successfully Update!');
															window.location='../recordstudent.php';
														</script>";
			
			
		}
		else{
			echo "<script>alert('Faculty Id Must be unique!');
															window.location='../recordstudent.php';
														</script>";
		}
				echo "<script>alert('Successfully Update!');
																	window.location='../recordstudent.php';
																</script>";
		}
				
				
		
	
	}


?>