<?php 
session_start();
$username= $_SESSION['login_user'];
$error=''; // Variable To Store Error Message
$con = mysqli_connect('localhost','root','','tracerdata') or die("ERROR");
$logs = mysqli_query($con,"SELECT * FROM `user_account` WHERE user_name = '$username'");
$datalogs = mysqli_fetch_array($logs);
$data_id = $datalogs['user_ID']; 
$log = mysqli_query($con,"SELECT * FROM `user_student_detail` WHERE `student_userID` = '$data_id'");
    $datalog = mysqli_fetch_array($log);
	$data_ids = $datalog['student_IDNumber']; 
	$data_course = $datalog['student_department']; 
    $data_year = $datalog['student_year_grad'];
    $data_dob = $datalog['student_dob'];
    $data_status = $datalog['student_status'];
 if(isset($_POST['verify-student'])) {
		if (empty($_POST['id']) || empty($_POST['student_department']) || empty($_POST['student_year_grad']) || empty($_POST['student_dob'])) 
			{
				echo "<script>alert('Enter all fields to verify !');
										window.location='verify_student.php';
									</script>";
				// Change this to bootstrap alert
			
			}
		
		else
		{
			verify();
			
		}
}

function verify(){
    
    $username= $_SESSION['login_user'];
    $con = mysqli_connect('localhost','root','','tracerdata') or die("ERROR");
$logs = mysqli_query($con,"SELECT * FROM `user_account` WHERE user_name = '$username'");
$datalogs = mysqli_fetch_array($logs);
$data_id = $datalogs['user_ID']; 
$log = mysqli_query($con,"SELECT * FROM `user_student_detail` WHERE `student_userID` = '$data_id'");
    $datalog = mysqli_fetch_array($log);
	$data_ids = $datalog['student_IDNumber']; 
	$data_course = $datalog['student_department']; 
    $data_year = $datalog['student_year_grad'];
    $data_dob = $datalog['student_dob'];
    $data_status = $datalog['student_status'];
 $reg ='register';
if ($_POST['id'] == $data_ids && $_POST['student_department'] == $data_course && $_POST['student_year_grad'] == $data_year && $_POST['student_dob'] == $data_dob){
    mysqli_query($con,"UPDATE `user_student_detail` SET `student_status` = '$reg' WHERE `student_userID` = '$data_id'");
    $_SESSION['login_user']=$username; 
				header("location: bonafied.php");
}
else {
    session_destroy();
    echo "<script>alert('Graduate Verification Failed, Try Again!');
					window.location='index.php';
				</script>";
}
mysqli_close($con);
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <!--IE Compatibility modes-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!--Mobile first-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Index</title>
    <link rel="shortcut icon" href="assets/img/logo.ico"/>
    <meta name="description" content="Free Admin Template Based On Twitter Bootstrap 3.x">
    <meta name="author" content="">
    
    <meta name="msapplication-TileColor" content="#5bc0de" />
    <meta name="msapplication-TileImage" content="assets/img/metis-tile.png" />
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="assets/lib/bootstrap/css/bootstrap.css">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="assets/lib/font-awesome/css/font-awesome.css">
    
    <!-- Metis core stylesheet -->
    <link rel="stylesheet" href="assets/css/main.css">
    
    <!-- metisMenu stylesheet -->
    <link rel="stylesheet" href="assets/lib/metismenu/metisMenu.css">
    
    <!-- onoffcanvas stylesheet -->
    <link rel="stylesheet" href="assets/lib/onoffcanvas/onoffcanvas.css">
    
    <!-- animate.css stylesheet -->
    <link rel="stylesheet" href="assets/lib/animate.css/animate.css">


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        .custombody{
            /*Body Background*/
  /* Permalink - use to edit and share this gradient: https://colorzilla.com/gradient-editor/#c4c42f+2,296eaa+75 */
background: #c4c42f; /* Old browsers */
background: -moz-linear-gradient(top,  #c4c42f 2%, #296eaa 75%); /* FF3.6-15 */
background: -webkit-linear-gradient(top,  #c4c42f 2%,#296eaa 75%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom,  #c4c42f 2%,#296eaa 75%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#c4c42f', endColorstr='#296eaa',GradientType=0 ); /* IE6-9 */

/*End of Body Background*/
        }
 a{
     color:#ff9800;
 }
 .navbar .navbar-nav {
  display: inline-block;
  float: none;
  vertical-align: top;
}

.navbar .navbar-collapse {
  text-align: center;
}



  a > .fa-facebook-square
  {
    color: #3b5998;
  }
  a > .fa-facebook-square:hover
  {
    color: #0084ff;
  }
  a > .fa-google-plus-square
  {
    color: #dd4b39;
  }
  a > .fa-google-plus-square:hover
  {
    color: #cd201f;
  }
  a > .fa-twitter-square
  {
    color: #55acee;
  }
  a > .fa-twitter-square:hover
  {
    color: #007ee5;
  }
  a > .fa-github-square
  {
    color: #24292e;
  }
  a > .fa-github-square:hover
  {
    color: #41464c;
  }

    </style>
</head>

<body class="login custombody" >
<div id="dialogoverlay"></div>
<div id="dialogbox">
  <div>
    <div id="dialogboxhead"></div>
    <div id="dialogboxbody"></div>
    <div id="dialogboxfoot"></div>
  </div>
</div>
    <div class="form-signin">
    <div class="text-center">
        <img src="assets/img/logo.png" alt="Metis Logo" style="width: 100px;">
                <h5>Pangasinan State Univeristy</h5>
        <h3>PSU URDANETA ONLINE YEARBOOK AND ALUMNI PORTAL</h3>

    </div>
    
 
        <div id="login-student" class="tab-pane active">
            <form  method="POST" action="<?php $_PHP_SELF ?>" role="form">
                <p class="text text-center">
                <label>Verify if you are a Graduate</label>  
                </p>
                <br>
                <label>Enter ID No. (ex. 180434 - Remove 'UR')</label>
                <input name="id" type="text" placeholder="ID Number" class="form-control top" required="true" >
                <br>
                <label>Enter Course</label>
                <?php 
                                    $query_dep = mysqli_query($con,"SELECT * FROM `psu_course`");
                                    ?>
                                        <select class="form-control" name="student_department" required="">
                                        <?php
                                        while ($res_dep = mysqli_fetch_array($query_dep)) {
                                        
                                        ?>
                                            <option value="<?php echo $res_dep['course_ID'] ?>"><?php echo $res_dep['course_name'];?></option>
                                        <?php 
                                        }
                                        ?>
                                        </select>
                                        <br>
                                        
                                        <label>Enter year graduated</label>
                                        <div class="input-group date" id="">
                                        <input type="year" class="form-control" name="student_year_grad" required="">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                      </span>
                                    </div>
                                    <br>
                                    <label for="text1" class="control-label col-lg-4">Birthday</label>

                                    <div class="col-lg-8">
                                        <input type="date" id="text1" placeholder="Birthday" class="form-control" name="student_dob">
                                    </div>
		</div>

                
                <input class="btn btn-lg btn-primary btn-block"  type="submit" name="verify-student" value="Verify">

            </form>
        </div>
        

      
    <!--jQuery -->
   
    <script src="assets/lib/jquery/jquery.js"></script>

    <!--Bootstrap -->
    <script src="assets/lib/bootstrap/js/bootstrap.js"></script>


    <script type="text/javascript">
        (function($) {
            $(document).ready(function() {
                $('.list-inline li > a').click(function() {
                    var activeForm = $(this).attr('href') + ' > form';
                    //console.log(activeForm);
                    $(activeForm).addClass('animated fadeIn');
                    //set timer to 1 seconds, after that, unload the animate animation
                    setTimeout(function() {
                        $(activeForm).removeClass('animated fadeIn');
                    }, 1000);
                });
            });
        })(jQuery);

  
  //LETTER ONLY
   function letterInputOnly(elem) {
                var validChars = /[a-zA-ZñÑ .]+/;
                var strIn = elem.value;
                var strOut = '';
                for(var i=0; i < strIn.length; i++) {
                  strOut += (validChars.test(strIn.charAt(i)))? strIn.charAt(i) : '';
                }
                elem.value = strOut;
            }
    </script>

</body>

</html>

