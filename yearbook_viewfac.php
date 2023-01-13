
<?php 
include('session.php'); 
include('db.php');
$page = 'alumni';

$req_course = $_REQUEST['course'];
$req_year = $_REQUEST['year'];

if ($login_level == '1')
{
    $result = mysqli_query($con,"SELECT * FROM `user_student_detail` WHERE student_userID = $login_id");
    $data = mysqli_fetch_array($result);
    $results = mysqli_query($con,"SELECT * FROM `user_teacher_detail`");
    $datas = mysqli_fetch_array($results);
    $data_img = $data['student_img']; 
    $data_background = $data['student_background'];
    $req_dep = $datas['teacher_department'];
}
else if ($login_level == '2')
{
    $result = mysqli_query($con,"SELECT * FROM `user_teacher_detail` WHERE teacher_userID = $login_id");
    $data = mysqli_fetch_array($result);
    $data_img = $data['teacher_img']; 
    $data_background = $data['teacher_background'];
   
    $req_dep = $data['teacher_department'];
}
else if ($login_level == '3')
{
    $result = mysqli_query($con,"SELECT * FROM `user_admin_detail` WHERE admin_userID = $login_id");
    $data = mysqli_fetch_array($result);
    $data_img = $data['admin_img']; 
    $results = mysqli_query($con,"SELECT * FROM `user_student_detail` WHERE student_userID = $login_id");
    $data = mysqli_fetch_array($results);
    $results = mysqli_query($con,"SELECT * FROM `user_teacher_detail`");
    $datas = mysqli_fetch_array($results);
    $req_dep = $datas['teacher_department'];
}
else
{
}
?>


<!DOCTYPE html>
<html>  
  <head>
    <?php include('meta.php');?>
    <?php include('style_css.php');?>
    <style>
    .card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 30%;
  border-radius: 5px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

img {
  border-radius: 5px 5px 0 0;
}

.container {
  padding: 2px 16px;
}
</style>
    <title>Dashboard</title>
  </head>
        <body class=" menu-affix">
            <div class="bg-dark dk" id="wrap">
                <div id="top">
                    <?php include ('top_navbar.php');?>
                </div>
                <!-- /#top -->
                    <?php  
                    if ($login_level == '1')
                    {
                        include('sidebar_student.php');
                    }
                    if ($login_level == '2')
                    {
                        include('sidebar_teacher.php');
                    }
                    else if ($login_level == '3')
                    {
                        include('sidebar_admin.php');
                    }
                    else
                    {
                    }
                    ?>                    
                      <!-- /#left -->
                <div id="content">

                    <div class="outer">
                        <header class="head">
                            <div class="main-bar">
                            <ol class="breadcrumb">
                              <li class="breadcrumb-item"><a href="dashboard.php">Dashboard</a></li>
                              <li class="breadcrumb-item "><a href="yearbook_faculty.php"> Yearbook</a></li>
                              <li class="breadcrumb-item active"> Yearbook View</li>
                            </ol>
                            </div>
                            <!-- /.main-bar -->
                        </header>
                        

<div class="inner bg-light lter">
                           <div class="col-sm-12">
                                <h2 class="text-center">
                                <?php 
                                if ($req_course == 1) {
                                  echo "Bachelor of Science in Information Technology";
                                }
                                if ($req_course == 2) {
                                    
                                    echo "Bachelor of Science in Computer Engineering";
                                }
                                if ($req_course == 3) {
                                    echo "Bachelor of Science in Office Administration";
                                }
                                ?>


<section id="photos-section" class="photos-section">
                                </h2>
                               <h1 class="text-center">Batch of <?php echo $req_year?></h1>
                               <hr>
                              <?php 
                              if ($login_level == '1')
                              {?>
                                <?php
                              }
                              if ($login_level == '2')
                              {?>
                                  <a href="" class="pull-left btn btn-primary" data-toggle="modal" data-target="#edit-modal">Customize Yearbook</a>
                                  <?php }
                              ?>
                              </h1>
                              <a class="btn btn-danger pull-left" href="assets/lib/FPDF/galleryprint.php?course=<?php echo $req_course?>&year=<?php echo $req_year?>" target="_BLANK">Print Batch Gallery</a><br>
                                  
                                   
                               <a class="btn btn-info pull-right" href="assets/lib/FPDF/facultyprint.php?course=<?php echo $req_course?>&year=<?php echo $req_year?>" target="_BLANK">Print Batch Yearbook</a><br><center>
                          <h2> Faculty Members:</h2>
                                   <?php 
                                   
                                   
                                   $t = mysqli_query($con,"SELECT * FROM `user_teacher_detail` WHERE teacher_department = $req_dep"); 
                                   $query = mysqli_query($con,"SELECT * FROM `user_student_detail` WHERE student_department = $req_course AND student_year_grad LIKE '%$req_year%' ORDER BY `student_fName`  ASC");

                                   while ($data = mysqli_fetch_array($t)) {
                                    $data['teacher_fName'];
                                    $req_pos =$data['teacher_position'];
                                    ?> 
                                   <div class="card-deck">
                                   <div class="card">
                                   <img class="card-img-top" src="assets/img/profile_img/<?php echo $data['teacher_img']?>" alt="Card image cap" style="width:100%">
                                        <div class="card-body">
                                        <h5 class="card-title"><?php echo   $data['teacher_fName']." ".$data['teacher_mName']." ".  $data['teacher_lName']?></h5>
                                        <p class="card-text">"<?php echo $data['teacher_motto']?>"</p>
                                        <p class="card-text"><small class="text-muted"> <?php
                                                   
                                                   if ($req_pos == 1) {
                                                     echo "College Dean";
                                                   }
                                                   if ($req_pos == 2) {
                                                       
                                                       echo "Department Chair";
                                                   }
                                                   if ($req_pos == 3) {
                                                       echo "Faculty";
                                                   }
                                                   
                                                   ?></small></p>
                                        </div>
                                    </div>
                                    
                                       <?php 
                                       }
                                       ?>
                                       <h2> Graduates Handled:</h2>
                                       <?php
                                  while ($data = mysqli_fetch_array($query)) {
                                    $data['student_fName']
                                    
                                   ?> 
                                 <div class="card-deck">
                                   <div class="card">
                                   <img class="card-img-top" src="assets/img/profile_img/<?php echo $data['student_img']?>" alt="Card image cap" style="width:100%">
                                        <div class="card-body">
                                        <h5 class="card-title"><?php echo   $data['student_fName']." ".$data['student_mName']." ".  $data['student_lName']?></h5>
                                        <p class="card-text">"<?php echo $data['student_motto']?>"</p>
                                        <p class="card-text"><small class="text-muted"> <?php
                                                    $b = mysqli_query($con,"SELECT cc.course_name FROM `user_teacher_detail` usd
INNER JOIN psu_course cc ON usd.teacher_department = cc.course_ID ");
                                                    $b = mysqli_fetch_array($b);
                                                   echo $b['course_name'];?></small></p>
                                        </div>
                                    </div>
                    
                                       <?php 
                                       }
                                       ?>
                                  
                           </div>
                           

                           
                        </div>
                                   
                        <!-- /.inner -->
                    </div>
                    <!-- /.outer -->
                </div>
                <!-- /#content -->
                
                    <!-- /#right -->
            </div>

            <!-- /#wrap -->
            <?php include('footer.php');?>
            <!-- /#footer -->
            <?php include ('script.php');?>

            <div class="modal fade" id="edit-modal" data-modal-index="1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">Edit Yearbook</h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal" id="editModal" action="action/update.php" name="editModal">
       <div class="form-group">
            <label class="control-label col-lg-4">Change Base Template Image(Background): </label>
            <div class="col-lg-4">
                <a class="btn btn-default" data-toggle="modal" data-target="#modal-changebackground">Update Picture</a>
            </div>
        </div>
        
       </form>
            
            </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- Change Background Modal-->
<div class="modal fade" id="modal-changebackground" data-modal-index="2" >
  <div class="modal-dialog">
    <div class="modal-content"  >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">Change Picture</h4>
      </div>
      <div class="modal-body center" style="height: 250px;">
              <div class="col-sm-6">
              <div class="mt-3 mb-1" style="font-size: 15px;">Example Size and Layout: (843 x 1192) pixels</div>
                  <img class="rounded shadow" width="100%" src="'" alt="">
                <form class="form" action="upload_yearback.php?login_id=<?php echo $login_id?>" method="POST" enctype="multipart/form-data">
                Select image to upload:
                <div class="form-group">
                   <input type="file" name="fileToUpload" id="fileToUpload">
                </div>
               <input type="submit" value="Upload Image" name="submit" class="btn btn-primary">
              </form>
              </div>
              <div class="col-sm-6">
                
               <a class="user-link" href="#">
                  <img class="media-object img-thumbnail user-img" alt="background Picture" src="assets/img/<?php echo $data_background?>" style="width: 128px; height: 128px;">
              </a>
              </div>
    

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


        </body>
</html>
