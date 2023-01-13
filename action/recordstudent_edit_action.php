<?php 
	$con = mysqli_connect('localhost','root','','tracerdata') or die("ERROR");
	if (isset($_POST['Submit'])) {
		$studentID = $_REQUEST['studentID'];
		// Defining post variable names 
		echo $student_sinumber = $_POST['student_sinumber'];
		echo $student_motto = $_POST['student_motto'];
		echo $student_firstname = $_POST['student_firstname'];
		echo $student_middlename = $_POST['student_middlename'];
		echo $student_lastname = $_POST['student_lastname'];
		echo $student_address = $_POST['student_address'];
		echo $student_semester = $_POST['student_semester'];
		echo $student_year_grad = $_POST['student_year_grad'];
		echo $student_department = $_POST['student_department'];
		echo $student_civil = $_POST['student_civil'];
		echo $student_contact = $_POST['student_contact'];
		echo $student_parents = $_POST['student_parents'];
		echo $student_achievements = $_POST['student_achievements'];

		// To protect MySQL injection for Security purpose
		$student_sinumber = stripslashes($student_sinumber);
		$student_motto = stripslashes($student_motto);
		$student_firstname = stripslashes($student_firstname);
		$student_middlename = stripslashes($student_middlename);
		$student_lastname = stripslashes($student_lastname);
		$student_address = stripslashes($student_address);
		$student_semester = stripslashes($student_semester);
		$student_year_grad = stripslashes($student_year_grad);
		$student_department = stripslashes($student_department);
		$student_contact = stripslashes($student_contact);
		$student_civil = stripslashes($student_civil);
		$student_parents = stripslashes($student_parents);
		$student_achievements = stripslashes($student_achievements);

		$student_sinumber = mysqli_real_escape_string($con,$student_sinumber);
		$student_motto = mysqli_real_escape_string($con,$student_motto);
		$student_semester = mysqli_real_escape_string($con,$student_semester);
		$student_firstname = mysqli_real_escape_string($con,$student_firstname);
		$student_middlename = mysqli_real_escape_string($con,$student_middlename);
		$student_lastname = mysqli_real_escape_string($con,$student_lastname);
		$student_address = mysqli_real_escape_string($con,$student_address);
		$student_year_grad = mysqli_real_escape_string($con,$student_year_grad);
		$student_department = mysqli_real_escape_string($con,$student_department);
		$student_contact = mysqli_real_escape_string($con,$student_contact);
		$student_civil = mysqli_real_escape_string($con,$student_civil);
		$student_parents = mysqli_real_escape_string($con,$student_parents);
		$student_achievements = mysqli_real_escape_string($con,$student_achievements);

if (empty($student_sinumber) || empty($student_motto)||empty($student_firstname)|| empty($student_middlename)|| empty($student_lastname)|| empty($student_address)|| empty($student_year_grad)||empty($student_parents)||empty($student_semester)||empty($student_achievements)|| empty($student_department)) {
	if (empty($student_sinumber) ) {
		echo "<script>alert('Empty student_sinumber !');
												window.location='../recordstudent.php';
											</script>";
	}
	if (empty($student_motto) ) {
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
		echo "<script>alert('Empty student_semester!');
												window.location='../recordstudent.php';
											</script>";
	}
}
else{
		


		$chk = "UPDATE `user_student_detail` 
				SET `student_IDNumber` = '$student_sinumber' WHERE `user_student_detail`.`student_ID` = $studentID";
		
		if ($chk = mysqli_query($con,$chk)){

			

			//insert query
			$sql = "UPDATE `user_student_detail` SET  student_IDNumber = '$student_sinumber', student_motto = '$student_motto', student_fName = '$student_firstname', student_mName = '$student_middlename', student_lName = '$student_lastname', student_address = '$student_address', student_semester = '$student_semester', student_year_grad = '$student_year_grad', student_department = '$student_department',student_contact = $student_contact, student_civilStat = '$student_civil', student_parents = '$student_parents', student_achievements = '$student_achievements'";

			$sql.= "  WHERE `user_student_detail`.`student_ID` = $studentID;";
			$res = mysqli_query($con,$sql);
			
			echo "<script>alert('Successfully Update!');
													window.location='../recordstudent.php';
												</script>";
			
			
		}
		else{
			echo "<script>alert('Faculty Id Must be unique!');
															window.location='../recordstudent.php';
														</script>";
		}
}
	
	}
?>