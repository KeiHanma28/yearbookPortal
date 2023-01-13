<?php
 $con = mysqli_connect('localhost','root','','tracerdata') or die("ERROR");

 if(isset($_POST["Import_teacher"])){
		
		$filename=$_FILES["file"]["tmp_name"];		
 
 	
		 if($_FILES["file"]["size"] > 0)
		 {
		  	$file = fopen($filename, "r");
		  		$count = 0;
	        while (($getData = fgetcsv($file, 10000, ",")) !== FALSE)
	         {
 
 				if ($count == 0) {
 					
 				}
 				else{
					$teacher_username = $getData[0]	;
					$teacher_Password = $getData[1];
					$teacher_facultyno = $getData[2];			
					$teacher_fName = $getData[3];
					$teacher_mName = $getData[4];
					$teacher_lName = $getData[5];
					$teacher_address = $getData[6];
					$teacher_civilStat = ucwords($getData[7]);
					$teacher_dob = $getData[8];
					$teacher_gender = $getData[9];
					$teacher_contact = $getData[10];
					$teacher_department = ucwords($getData[11]);
					$teacher_position =  $getData[12];
					$sql = mysqli_query($con,"SELECT * FROM `marital_status` WHERE marital_Name like '%$teacher_civilStat%'");
					$mstat = mysqli_fetch_array($sql);
					$teacher_civilStat = $mstat['ID'];
					$sql = mysqli_query($con,"SELECT * FROM `position` WHERE position_name like '%$teacher_position%'");
                    $pos = mysqli_fetch_array($sql);
                    $teacher_position = $pos['position_id'];
					$sql = mysqli_query($con,"SELECT * FROM `psu_department` WHERE department_name like '%$teacher_department%' || department_acronym like '%$teacher_department%'");
					$dep = mysqli_fetch_array($sql);
					$teacher_department = $dep['department_ID'];
					if (strtoupper($teacher_gender) == 'MALE') {
						$teacher_gender = "M";
					}
					if (strtoupper($teacher_gender) == 'FEMALE') {
						$teacher_gender = "F";
					}
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
								     `teacher_secretquestion`,
						               `teacher_secretanswer`) 
VALUES 
(
NULL,
'".$teacher_facultyno."',
 'temp.gif',
 '".$teacher_facultyno."',
 '".$teacher_fName."',
 '".$teacher_mName."',
 '".$teacher_lName."',
 '".$teacher_gender."',
 '".$teacher_dob."',
 '".$teacher_contact."',
 '".$teacher_address."',
 '".$teacher_civilStat."',
 '".$teacher_department."',
 'register',
 '".$teacher_position."', 
 ' ',
 ' ')";

 $result = mysqli_query($con,"INSERT INTO `user_account` (user_ID,user_level, user_name, user_password,fname,lname) 
		 			VALUES ('".$teacher_facultyno."','2','".$teacher_username."','".$teacher_Password."','".$teacher_fName."','".$teacher_lName."')");
			
				$result = mysqli_query($con,$sql);
				$last_id = mysqli_insert_id($con);
				$msg = mysqli_query($con,"INSERT INTO `users` (user_id, unique_id, fname,lname, email, password) 
				VALUES ('".$last_id."','".$teacher_facultyno."','".$teacher_fName."','".$teacher_lName."','".$teacher_username."','".$teacher_Password."')");
				$chk = "UPDATE `user_teacher_detail` 
						SET `teacher_IDNumber` = '".$teacher_facultyno."' WHERE `user_teacher_detail`.`teacher_ID` = $last_id";
	                   
					if(!isset($result))
					{
						echo "<script type=\"text/javascript\">
								alert(\"Invalid File:Please Upload CSV File.\");
								window.location = \"../recordstudent.php\"
							  </script>";		
					}
					else {
						  echo "<script type=\"text/javascript\">
							alert(\"CSV File has been successfully Imported.\");
							window.location = \"../recordstudent.php\"
						</script>";
					}
					// echo "<script>alert('successfully Imported!');
					// 									window.location='../recordstudent.php';
					// 								</script>";
 					
 				}
	         $count++;
	         }
			
	         fclose($file);	
		 }

	}	 
// if(isset($_POST["Import_teacher"])){

// 	"INSERT INTO `user_teacher_detail` 
// 	(`teacher_ID`,
// 	`teacher_userID`,
// 	`teacher_img`,
// 	`teacher_facultyID`,
// 	`teacher_fName`,
// 	`teacher_mName`,
// 	`teacher_lName`,
// 	`teacher_gender`,
// 	`teacher_dob`,
// 	`teacher_contact`,
// 	`teacher_address`,
// 	`teacher_civilStat`,
// 	`teacher_department`,
// 	`teacher_status`,
// 	`teacher_secretquestion`,
// 	`teacher_secretanswer`) 
// 	VALUES (
// 	NULL,
// 	NULL,
// 	'temp.gif',
// 	NULL,
// 	NULL,
// 	NULL,
// 	NULL,
// 	NULL,
// 	NULL,
// 	NULL,
// 	NULL,
// 	NULL,
// 	NULL,
// 	'unregister',
// 	NULL,
// 	NULL);"

// }
  if(isset($_POST["Export"])){
		 
      header('Content-Type: text/csv; charset=utf-8');  
      header('Content-Disposition: attachment; filename=data.csv');  
      $output = fopen("php://output", "w");  
      fputcsv($output, array('ID', 'First Name', 'Last Name', 'Email', 'Joining Date'));  
      $query = "SELECT * from employeeinfo ORDER BY emp_id DESC";  
      $result = mysqli_query($con, $query);  
      while($row = mysqli_fetch_assoc($result))  
      {  
           fputcsv($output, $row);  
      }  
      fclose($output);  
 } 
 
 ?>