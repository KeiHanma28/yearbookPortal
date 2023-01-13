<?php 
		$con = mysqli_connect('localhost','root','','tracerdata') or die("ERROR");
	if (isset($_POST['submit_recordteacher'])) {

		// Defining post variable names 
		 $teacher_username = $_POST['teacher_username'];
		 $teacher_Password = $_POST['teacher_Password'];
		 $teacher_rePassword = $_POST['teacher_rePassword'];
		 $teacher_finumber = $_POST['teacher_finumber'];
		 $teacher_firstname = $_POST['teacher_firstname'];
		 $teacher_bday = $_POST['teacher_bday'];
		 $teacher_contact= $_POST['teacher_contact'];
		 $teacher_middlename = $_POST['teacher_middlename'];
		 $teacher_lastname = $_POST['teacher_lastname'];
		 $teacher_gender = $_POST['teacher_gender'];
		 $teacher_address = $_POST['teacher_address'];
		 $teacher_civilStat = $_POST['teacher_civilStat'];
		 $teacher_department = $_POST['teacher_department'];
		 $teacher_position = $_POST['teacher_position'];
		 $teacher_motto = $_POST['teacher_motto'];

		// To protect MySQL injection for Security purpose
		$teacher_username = stripslashes($teacher_username);
		$teacher_Password = stripslashes($teacher_Password);
		$teacher_rePassword = stripslashes($teacher_rePassword);
		$teacher_finumber = stripslashes($teacher_finumber);
		$teacher_firstname = stripslashes($teacher_firstname);
		$teacher_middlename = stripslashes($teacher_middlename);
		$teacher_lastname = stripslashes($teacher_lastname);
		$teacher_gender = stripslashes($teacher_gender);
		$teacher_address = stripslashes($teacher_address);
		$teacher_civilStat = stripslashes($teacher_civilStat);
		$teacher_department = stripslashes($teacher_department);
		$teacher_bday = stripslashes($teacher_bday);
		$teacher_contact = stripslashes($teacher_contact);
		$teacher_position = stripslashes($teacher_position);
		$teacher_motto = stripslashes($teacher_motto);

		$teacher_username = mysqli_real_escape_string($con,$teacher_username);
		$teacher_Password = mysqli_real_escape_string($con,$teacher_Password);
		$teacher_rePassword = mysqli_real_escape_string($con,$teacher_rePassword);
		$teacher_finumber = mysqli_real_escape_string($con,$teacher_finumber);
		$teacher_firstname = mysqli_real_escape_string($con,$teacher_firstname);
		$teacher_middlename = mysqli_real_escape_string($con,$teacher_middlename);
		$teacher_lastname = mysqli_real_escape_string($con,$teacher_lastname);
		$teacher_gender = mysqli_real_escape_string($con,$teacher_gender);
		$teacher_address = mysqli_real_escape_string($con,$teacher_address);
		$teacher_civilStat = mysqli_real_escape_string($con,$teacher_civilStat);
		$teacher_department = mysqli_real_escape_string($con,$teacher_department);
		$teacher_bday = mysqli_real_escape_string($con,$teacher_bday);
		$teacher_contact = mysqli_real_escape_string($con,$teacher_contact);
		$teacher_position = mysqli_real_escape_string($con,$teacher_position);
		$teacher_motto = mysqli_real_escape_string($con,$teacher_motto);


		if ($teacher_Password == $teacher_rePassword)  
		{

			$sql ="SELECT * FROM `user_teacher_detail` WHERE `teacher_facultyID` = '$teacher_finumber' ";
		    $result = mysqli_query($con,$sql);
		    $res = mysqli_num_rows($result);
			
			// if student has record perform add query
			if ($res > 0)  
			{	
				echo "<script>alert('You cannot use this id because its already exist!');
												window.location='../recordteacher.php';
											</script>";
			}
			else
			{

			
					$result = mysqli_query($con,"INSERT INTO `user_account` (user_ID,user_level, user_name, user_password,fname,lname) 
					VALUES ('$teacher_finumber','2','$teacher_username','$teacher_Password','$teacher_firstname','$teacher_lastname')");
		 		// geting the last insert created account
				$last_id = mysqli_insert_id($con);

					
				$msg = mysqli_query($con,"INSERT INTO `users` (user_id, unique_id, fname,lname, email, password) 
				VALUES ('$last_id','$teacher_finumber','$teacher_firstname','$teacher_lastname','$teacher_username','$teacher_Password')");
		
		
				

						$sql = "INSERT INTO `user_teacher_detail` (
						`teacher_ID`,
						 `teacher_userID`,
						  `teacher_img`,
						   `teacher_facultyID`,
						    `teacher_fName`,
						     `teacher_mName`,
						      `teacher_lName`,
						       `teacher_gender`,
						        `teacher_dob`,
						         `teacher_contact`,
						          `teacher_address`,
						           `teacher_civilStat`,
						            `teacher_department`,
						             `teacher_status`,
									  `teacher_position`,
									 `teacher_motto`,
						              `teacher_secretquestion`,
						               `teacher_secretanswer`) 
						VALUES (
						NULL,
						 '$teacher_finumber',
						  'temp.gif',
						  $teacher_finumber,
						    '$teacher_firstname',
						     '$teacher_middlename',
						      '$teacher_lastname',
						       '$teacher_gender',
						        '$teacher_bday',
						         '$teacher_contact',
						          '$teacher_address',
						           '$teacher_civilStat',
						            '$teacher_department',
						             'register',
									 '$teacher_position',
						            '$teacher_motto',
						              '',
						               '');
							";
							$res = mysqli_query($con,$sql);
							$last_id = mysqli_insert_id($con);
							$chk = "UPDATE `user_teacher_detail` 
									SET `teacher_facultyID` = '$teacher_finumber' WHERE `user_teacher_detail`.`teacher_ID` = $last_id";
							
							if ($chk = mysqli_query($con,$chk)){

										echo "<script>alert('Successfully Update!');
																				window.location='../recordteacher.php';
																			</script>";
								
								
							}
							else{
								echo "<script>alert('Faculty Id Must be unique!');
																				window.location='../recordteacher.php';
																			</script>";
							}

							echo "<script>alert('Successfully Added!');
															window.location='../recordteacher.php';
														</script>";
					

					
				}
				
				
				
			}

		
		}
		else
		{

		echo "<script>alert('Password not match!');
												window.location='../recordteacher.php';
											</script>";
		}
		
	
?>