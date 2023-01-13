<!-- .navbar -->
<?php 

$qry = mysqli_query($con,"SELECT * FROM user_student_detail WHERE student_userID = '$login_id'");
$res = mysqli_fetch_assoc($qry);
// $res['student_fName'];
// $res['student_lName'];
// $res['student_img'];
$user_notif_qry = mysqli_query($con,"SELECT * FROM `user_notification` WHERE notif_receiverID = $login_id LIMIT 25");
                $rows=[];
if($user_notif_qry == NULL){
    echo $rows='0';
}
else{
while ($user_notif_sql = mysqli_fetch_array($user_notif_qry))
{
  
 
  $rows[] = $user_notif_sql;}}
?>
<style type="text/css">
    
/** =====================
 * Top nav Customize Dropdown notif and msg
 ========================*/
 
.panel_defaul_custom
{
    width: 430px;
  }
.panel_heading_custom
{
    margin-top: -5px;
  }
.panel_body_custom
{
    overflow-y: scroll;
    overflow-x: hidden; height:400px; width: 430px;
  }
  .panel_item_custom{
    color: black; width: 100%; background-color: #e7eaed;
  }
  .panel_item_custom:hover{
    color: black; width: 100%; background-color: #dee0e2;   
    -webkit-transition: background-color 0.2s ease-out;
    -moz-transition: background-color 0.2s ease-out;
    -o-transition: background-color 0.2s ease-out;
    transition: background-color 0.2s ease-out;
  }
  .panel_item_word_custom{
    text-overflow: ellipsis;  overflow: hidden; white-space: nowrap; 
                width: 12em;
  }
  .panel_footer_custom{
    margin-bottom: -10px; color: black; height: 15px;
  }


/** =====================
 * Top nav Customize Dropdown notif and msg END
 ========================*/
</style>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">


        <!-- Brand and toggle get grouped for better mobile display -->
        <header class="navbar-header">

            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.php" class="navbar-brand"><img src="assets/img/logo.png" alt="" style="width: 50px;">
            </a>

        </header>
        <style type="text/css">

        </style>


<ul class="nav navbar-nav pull-left">
<li><a href="dashboard.php">PSU Customizable Online Yearbook <br>and Alumni Portal</a>
                </li>

                </ul>
        <div class="collapse navbar-collapse navbar-ex1-collapse">

            <!-- .nav -->
            <ul class="nav navbar-nav pull-right">
                
                <li>
                <a href="#" id="nbAcctDD" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><center><span class="material-icons md-36">collections_bookmark<i class="icon-user"></i></span><br><?php echo "Yearbook";?></center><i class="icon-sort-down"></i></a>
                <ul class="dropdown-menu pull-right">

                    <li><a href="yearbook_student.php">Yearbook for Graduates</a>
                    </li>
                    <li><a href="yearbook_faculty.php">Yearbook for Faculty Members</a>
                    </li>
                </ul>
            </li>
        
        <li>
                <a href="http://image-editor.42web.io/" id="nbAcctDD"  target="_blank" aria-expanded="true"><center><span class="material-icons md-36">image<i class="icon-user"></span><br><?php echo "Image Editor";?></center></i><i class="icon-sort-down"></i></a>
                
            </li>
            <li class="dropdown ">
                <a href="messaging/login.php" id="nbAcctDD" target="_blank"  aria-expanded="true"><center><span class="material-icons md-36">message<i class="icon-user"></span><br><?php echo "Messages";?></center></i><i class="icon-sort-down"></i></a>
                
            </li>

            <li>
                <a href="#" id="nbAcctDD" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><center><span class="material-icons md-36 ">notifications<i class="icon-user"></span><?php if(count($rows) == 0){echo " ";}else {?><span class="badge progress-bar-danger"><?php   echo count($rows);}

 ?></span><br><?php echo "Alerts";?></center></i><i class="icon-sort-down"></i></a>
                <ul class="dropdown-menu pull-right" >
                 <?php 
                 include ("dropdown-menu_notification.php");
                 ?>
                </ul>
            </li>
            <li>
                <a href="#" id="nbAcctDD" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true"><center><span class="material-icons md-36">account_circle<i class="icon-user"></i></span><br><?php echo $login_session;?></center><i class="icon-sort-down"></i></a>
                <ul class="dropdown-menu pull-right">

                    <li><a href="profile.php">Profile</a>
                    </li>
                    <li><a href="logout.php">Log Out</a>
                    </li>
                </ul>
            </li>
            </ul>
            <!-- /.nav -->

        </div>
    </div>
    <!-- /.container-fluid -->
</nav>
<!-- /.navbar -->
<header class="head">
    <div class="search-bar">
        <div style="height: 20px;"></div>
        <!-- /.main-search -->
    </div>
    <!-- /.search-bar -->
    <div class="main-bar">
        <div style="height: 20px;"></div>
    </div>
    <!-- /.main-bar -->
</header>
<!-- /.head -->

<!-- /.For removing color of read items -->
<script>
function myFunction(divObj) {
    divObj.style.background="#f5f5f5";
}


</script>
<!-- /.For removing color of read items end-->