
<?php 
include('session.php'); 
include('db.php');

$survey_maxcount_qry = mysqli_query($con,"SELECT survey_maxattemp FROM `survey_maxcount` WHERE survey_ownerID = '$login_id'");
$survey_maxattemp = mysqli_fetch_array($survey_maxcount_qry);
$page = 'recordstudent';

if ($login_level == '1')
{
    $result = mysqli_query($con,"SELECT * FROM `user_student_detail` WHERE student_userID = $login_id");
    $data = mysqli_fetch_array($result);
    $data_img = $data['student_img']; 
}
else if ($login_level == '2')
{
    $result = mysqli_query($con,"SELECT * FROM `user_teacher_detail` WHERE teacher_userID = $login_id");
    $data = mysqli_fetch_array($result);
    $data_img = $data['teacher_img']; 
}
else if ($login_level == '3')
{
    $result = mysqli_query($con,"SELECT * FROM `user_admin_detail` WHERE admin_userID = $login_id");
    $data = mysqli_fetch_array($result);
    $data_img = $data['admin_img']; 
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
    <title></title>
  </head>
        <body class="menu-affix">
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
                    elseif ($login_level == '3')
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
                              <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                              <li class="breadcrumb-item active"> Record Graduate Detail</li>
                            </ol>
                            </div>
                            <!-- /.main-bar -->
                        </header>
                        <div class="inner bg-light lter" >
                                
                            <div class="box col-sm-12">
                             <header>
                              <h5>List</h5>
                             </header>
                             <div class="body" >
                                <div class="btn-group">
                                 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add New</button>
                                 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal1">Import Excel</button>
                                    </div>
                                <table id="registerstud_serverside" class="table table-bordered table-advance table-hover  dataTable">
                                <thead>
                                    <tr>
                                        <th class="text-center col-sm-1">Student #</th>
                                        <th class="text-center col-sm-3">Name</th>
                                        <th class="text-center col-sm-1">Course</th>
                                        <th class="text-center col-sm-1">Semester Graduated</th>
                                        <th class="text-center col-sm-1">Year graduated</th>
                                        <th class="text-center col-sm-1">Action</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                      <th></th>
                                      <th></th>
                                      <th></th>
                                      <th></th>
                                      <th></th>
                                      <th></th>
                                    </tr>
                                  </tfoot>
                                  

                                </table>
                             </div>
                            </div>
                        </div>
                        <!-- /.inner -->
                    </div>
                    <!-- /.outer -->
                </div>
                <!-- /#content -->

            </div>
  <!-- Modal for add form -->
<!-- Edit Modal -->
<div class="container">
      <div class="modal fade" id="myModal" data-modal-index="1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">Add Student Record</h4>
      </div>
      <div class="modal-body">
                             <div class="body">
                                <form id="myform" class="form-horizontal" method="POST" action="action/recordstudent_action.php">
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Username</label>

                                    <div class="col-lg-8">
                                        <input type="text" id="Username" placeholder="Username" class="form-control" name="student_username" required="true" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Password</label>

                                    <div class="col-lg-8">
                                        <input type="Password" id="text1" placeholder="Password" class="form-control" name="student_password" required="true" >
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">User Number</label>
                                    <div class="col-lg-8">
                                        <input type="text" id="text1" placeholder="User Number" class="form-control" name="student_usernumber" onkeyup="numberInputOnly(this);" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">ID Number</label>

                                    <div class="col-lg-8">
                                        <input type="text" id="text1" placeholder="ID Number" class="form-control" name="student_sinumber" onkeyup="numberInputOnly(this);" required="true">
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Full Name</label>

                                    <div class="col-lg-3">
                                        <input type="text" id="text1" placeholder="First Name" class="form-control" name="student_firstname" onkeyup="letterInputOnly(this);" required="true">
                                    </div>
                                

                                    <div class="col-lg-2">
                                        <input type="text" id="text1" placeholder="Middle Name" class="form-control" name="student_middlename" onkeyup="letterInputOnly(this);" required="true"  maxlength="1">
                                    </div>
                             

                                    <div class="col-lg-3">
                                        <input type="text" id="text1" placeholder="Last Name" class="form-control" name="student_lastname" onkeyup="letterInputOnly(this);" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Name of Parents</label>

                                    <div class="col-lg-8">
                                        <input type="text" id="text1" placeholder="Mr. and Mrs." class="form-control" name="student_parents" onkeyup="letterInputOnly(this);" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Achievements</label>

                                    <div class="col-lg-8">
                                        <input type="text" id="text1" placeholder="Chair/Officer/Cum Laude/ Summa Cum Laude/ Magna Cum Laude" class="form-control" name="student_achievements" onkeyup="letterInputOnly(this);" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Birthday</label>

                                    <div class="col-lg-8">
                                        <input type="date" id="text1" placeholder="Birthday" class="form-control" name="student_dob" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Contact</label>

                                    <div class="col-lg-8">
                                        <input type="text" id="text1" placeholder="Contact" class="form-control" name="student_contact" onkeyup="numberInputOnly(this);" required="true"  min="9" max="11">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Sex</label>
                                    <div class="col-lg-8">
                                        <select class="form-control" name="student_gender" required="true">
                                            <option value="M">Male</option>
                                            <option value="F">Female</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Civil Status</label>
                                    <div class="col-lg-8">
                                        <select class="form-control" name="student_civil" required="true">
                                            <?php 
                                            $mstat_q = mysqli_query($con,"SELECT * FROM `marital_status`");
                                            while ($mstat = mysqli_fetch_array($mstat_q)) {
                                               ?>
                                                <option value="<?php echo $mstat['ID']; ?>"><?php echo $mstat['marital_Name']; ?></option>
                                               <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Address</label>

                                    <div class="col-lg-8">
                                        <input type="text" id="text1" placeholder="Address" class="form-control" name="student_address" required="true">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Course</label>

                                    <div class="col-lg-8">
                                    <?php 
                                    $query_dep = mysqli_query($con,"SELECT * FROM `psu_course`");
                                    ?>
                                        <select class="form-control" name="student_department" required="true">
                                        <?php
                                        while ($res_dep = mysqli_fetch_array($query_dep)) {
                                        
                                        ?>
                                            <option value="<?php echo $res_dep['course_ID'] ?>"><?php echo $res_dep['course_name'];?></option>
                                        <?php 
                                        }
                                        ?>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Semester Graduated</label>

                                    <div class="col-lg-8">
                                        <select class="form-control" name="student_semester" required="true">
                                        <option value="1st Semester">1st Semester</option>
                                        <option value="2nd Semester">2nd Semester</option>
                                        <option value="Mid-Year">Mid-Year</option>                             
                                       </select>
                                    </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4">Year Graduate</label>

                                    <div class="col-lg-8">
                                    <div class="input-group date" id="" required="true">
                                        <input type="year" class="form-control" name="student_year_grad" required="">
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span>
                                      </span>
                                    </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="text1" class="control-label col-lg-4"></label>
                                    <div class="col-lg-8">
                                    <div class="input-group date" id="">
                                        <input class="btn btn-success" type="submit" name="submit_recordstudent" value="Submit">
                                      </span>
                                    </div>
                                    </div>
                                </div>
                                <!-- /.form-group -->
                               
                                <!-- Trigger the modal with a button -->
                               
                                
                               
                             
                            
                             </div>
                             </form>

    
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


</div>
  

            <!-- /#wrap -->
            <?php include('footer.php');?>
            <!-- /#footer -->
            <?php include ('script.php');?>
        </body>
        <script type="text/javascript">




        function editFunction(student_ID){
            var txt;
            var r = confirm("Are you sure do you want to edit ?");
            if (r == true) {
                
             // window.location.href = "recordstudent.php?modal=" + student_ID;
            } else {
               
            }
        }       
        function deleteFunction(student_ID){
            var txt;
            var r = confirm("Are you sure do you want to delete?");
            if (r == true) {
                 $('#myModal').modal('show');
             // window.location.href = "recordstudent.php?modal=" + student_ID;
            } else {
               
            }

        }          
         $(document).ready(function() {
                var dataTable = $('#registerstud_serverside').DataTable( {

                    "processing": true,
                    "serverSide": true,
                    "bAutoWidth": false,
                     // "bSort": false,
                     "bLengthChange": false,
                     "columnDefs": [ {
                        className: "text-center",
                          "targets": 1,
                          "searchable": false
                        }, 
                        {
                        className: "text-center",
                          "targets": 2,
                          "searchable": false
                        }, 
                        {
                        className: "text-center",
                          "targets": 3,
                          "searchable": false
                        }, 
                        {
                        className: "text-center",
                              "targets": 4,
                              "searchable": false
                        }],
                    "ajax":{
                        url :"serverside_data_registerstud.php", // json datasource
                        type: "post",  // method  , by default get
                        error: function(){  // error handling
                            $(".registerstud_serverside-error").html("");
                            $("#eregisterstud_serverside").append('<tbody class="registerstud_serverside-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
                            $("#registerstud_serverside_processing").css("display","none");
                            

                        }
                        
                    }
                } );


                
            } );
        </script>

</html>

<div class="container">
      <div class="modal fade" id="myModal1" data-modal-index="1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">Import Excel CSV Format</h4>
      </div>
      <div class="modal-body">
    <div class="row">

                <form class="form-horizontal" action="action/csv.php" method="post" name="upload_excel" enctype="multipart/form-data">
                    <fieldset>

                        <!-- Form Name -->
                      

                        <!-- File Button -->
<div class="form-group">
    <label for="text1" class="control-label col-lg-4">Select File</label>

    <div class="col-lg-8">
    <div class="input-group date" id="">
        <input type="file" class="form-control"  name="file" id="file" class="input-large">
        
    </div>
    <div class="mt-3 mb-1" style="font-size: 15px;">Example Format (Click CSV Icon to Download)</div>
    <a href="csv_studentformat.csv" download>
    <img src="assets/img/downloadcsv.png" alt="csvfile" width="104" height="100"></a>
    </div>
    
</div>

<div class="form-group">
    <label for="text1" class="control-label col-lg-4">Import data</label>

    <div class="col-lg-8">
    <div class="input-group date" id="">
        <button type="submit" id="submit" name="Import_student" class="btn btn-primary button-loading" data-loading-text="Loading...">Import</button>
        
    </div>
    </div>
</div>

                    </fieldset>
                </form>

            </div>
      </div>
  </div>
</div>
</div>
</div>


