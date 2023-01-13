<?php 
$query_sidebar = mysqli_query($con,"SELECT * FROM `user_teacher_detail` WHERE `teacher_userID` = $login_id");
$res_sidebar = mysqli_fetch_assoc($query_sidebar);
$query_count_post = mysqli_query($con,"SELECT `post_owner_id` FROM `forum_topic` WHERE `post_owner_id` = $login_id");
$res_count_post = mysqli_num_rows($query_count_post);
$userType = "teacher";
?>
                    <div class="row">
  <div class="col-md-8"><div id="my-pics" class="carousel slide" data-ride="carousel" style="width:70%;margin:auto;">

<ol class="carousel-indicators">
<li data-target="#my-pics" data-slide-to="0" class="active"></li>
<li data-target="#my-pics" data-slide-to="1"></li>
<li data-target="#my-pics" data-slide-to="2"></li>
<li data-target="#my-pics" data-slide-to="3"></li>
<li data-target="#my-pics" data-slide-to="4"></li>
<li data-target="#my-pics" data-slide-to="5"></li>
<li data-target="#my-pics" data-slide-to="6"></li>
<li data-target="#my-pics" data-slide-to="7"></li>
<li data-target="#my-pics" data-slide-to="8"></li>
<li data-target="#my-pics" data-slide-to="9"></li>
<li data-target="#my-pics" data-slide-to="10"></li>
<li data-target="#my-pics" data-slide-to="11"></li>
<li data-target="#my-pics" data-slide-to="12"></li>
<li data-target="#my-pics" data-slide-to="13"></li>
<li data-target="#my-pics" data-slide-to="14"></li>
</ol>

<div class="carousel-inner" role="listbox">

<div class="item ">
<img src="assets\img\1 (1).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (2).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (3).jpg" alt="">
</div>
<div class="item">
<img src="assets\img\1 (4).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (5).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (6).jpg" alt="">
</div><div class="item ">
<img src="assets\img\1 (7).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (8).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (9).jpg" alt="">
</div><div class="item ">
<img src="assets\img\1 (10).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (11).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (12).jpg" alt="">
</div><div class="item active">
<img src="assets\img\1 (13).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (14).jpg" alt="">
</div>

<div class="item">
<img src="assets\img\1 (15).jpg" alt="">
</div>

</div>

<a class="left carousel-control" href="#my-pics" role="button" data-slide="prev">
<span class="icon-prev" aria-hidden="true"></span>
<span class="sr-only">Previous</span>
</a>
<a class="right carousel-control" href="#my-pics" role="button" data-slide="next">
<span class="icon-next" aria-hidden="true"></span>
<span class="sr-only">Next</span>
</a>

</div></div>
  <div class="col-md-4"><div id="right">
                        <div class="media user-media bg-dark dker" >
                            <div class="user-media-toggleHover">
                            </div>
                            <div class="user-wrapper bg-dark">
                                <a class="user-link" href="">
                                    <img class="media-object img-thumbnail user-img" alt="User Picture" src="assets/img/profile_img/<?php echo $data_img?>" style="width: 64px; height: 64px;">
                                </a>
                        
                                <div class="media-body">
                                    <h5 class="media-heading"><?php echo $res_sidebar['teacher_lName'];?>, <?php echo $res_sidebar['teacher_fName'];?> <?php echo $res_sidebar['teacher_mName'];?></h5>
                                    <ul class="list-unstyled user-info">
                                        <li>Faculty - Teacher</li>
                                        <li>
                                            <small><i class="fa fa-edit"></i>&nbsp;Posts: <a href="profile_post.php" style="color: white;"><?php echo $res_count_post?></a></small>
                                        </li>
                                        <li> &nbsp;<br>
                                            &nbsp;
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- #menu -->
                        <ul id="menu" class="bg-blue dker" >
                                  <li class="nav-header">Menu</li>
                                  <li class="nav-divider"></li>
                                  <?php 
                                  if ($page == 'dashboard')
                                  {
                                    ?>
                                     <li class="active">
                                    <?php
                                  }
                                  else
                                  {
                                    ?>
                                   <li class="">
                                  <?php
                                  }
                                   ?>
                                    <a href="dashboard.php">
                                      <span class="link-title">
                                    Dashboard
                                  </span>
                                      <span class="fa arrow"></span>
                                    </a>
                                    
                                  </li>
                                  <?php 
                                  if ($page == 'alumni')
                                  {
                                    ?>
                                     <li class="active">
                                    <?php
                                  }
                                  else
                                  {
                                    ?>
                                   <li class="">
                                  <?php
                                  }
                                   ?>
                                    <a href="">
                                      <span class="link-title">
                                    Alumni
                                  </span>
                                      <span class="fa arrow"></span>
                                    </a>
                                    <ul class="collapse">
                                      <li>
                                        <a href="alumni.php">
                                          <i class="fa fa-angle-right"></i>&nbsp; Alumni Handled</a>
                                      </li>
                                      <li>
                                        <a href="yearbook_faculty.php">
                                          <i class="fa fa-angle-right"></i>&nbsp; Faculty Yearbook</a>
                                      </li>
                                      
                                    </ul>
                                  </li>
                                  <?php 
                                  if ($page == 'forum')
                                  {
                                    ?>
                                     <li class="active">
                                    <?php
                                  }
                                  else
                                  {
                                    ?>
                                   <li class="">
                                  <?php
                                  }
                                   ?>
                                    <a href="">
                                      <span class="link-title">
                                    Forum
                                  </span>
                                      <span class="fa arrow"></span>
                                    </a>
                                    <ul class="collapse">
                                      <li>
                                        <a href="forum.php">
                                          <i class="fa fa-angle-right"></i>&nbsp; General Forum</a>
                                      </li>
                                      <li>
                                        <a href="profile_post.php">
                                          <i class="fa fa-angle-right"></i>&nbsp; Your Posts</a>
                                      </li>
                                    </ul>
                                  </li>
                                  
                                  <?php 
                                  if ($page == 'recordstudent')
                                  {
                                    ?>
                                     <li class="active">
                                    <?php
                                  }
                                  else
                                  {
                                    ?>
                                   <li class="">
                                  <?php
                                  }
                                   ?>
                                    <a href="recordstudent.php">
                                      <span class="link-title">
                                    Record Graduate
                                  </span>
                                      <span class="fa arrow"></span>
                                    </a>
                                    
                                  </li>
                                </ul>
                        <!-- /#menu -->
                        
                    </div></div>
</div>