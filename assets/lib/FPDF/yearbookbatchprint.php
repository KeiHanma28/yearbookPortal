

<?php
require('fpdf.php');
include('db.php');
$req_course = $_REQUEST['course'];
$req_year  = $_REQUEST['year'];
$res = mysqli_query($con,"SELECT * FROM user_student_detail WHERE student_department LIKE '$req_course' AND student_year_grad LIKE '$req_year%' ORDER BY `student_fName`  ASC");

class PDF extends FPDF{
	function Header(){
		include('db.php');
		if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
		// session_start();
		$user_check = $_SESSION['login_user'];
		$ses_sql = mysqli_query($con,"SELECT user_name,user_level,user_ID FROM user_account WHERE user_name='$user_check'");
$row = mysqli_fetch_assoc($ses_sql);
$login_session = $row['user_name'];
$login_level = $row['user_level'];
$login_id = $row['user_ID'];
$_SESSION['login_id'] = $row['user_ID'];
		if ($login_level == '1')
{
    $result = mysqli_query($con,"SELECT * FROM `user_student_detail` WHERE student_userID = $login_id");
    $data = mysqli_fetch_array($result);
	$user_type  = "student";
}
	else if ($login_level == '2')
{
    $result = mysqli_query($con,"SELECT * FROM `user_teacher_detail` WHERE teacher_userID = $login_id");
    $data = mysqli_fetch_array($result);
	$user_type  = "teacher";
}
	else if ($login_level == '3')
{
    $result = mysqli_query($con,"SELECT * FROM `user_admin_detail` WHERE admin_userID = $login_id");
    $data = mysqli_fetch_array($result);
	$user_type  = "admin";
}
		$image2 = "../../img/";
		$req_course = $_REQUEST['course'];
		$req_year  = $_REQUEST['year'];
		$this->Image($image2.$data[$user_type.'_background'], 0, 0,);
		$this->Image('../../img/logo.png',10, 10, -300);
		$this->AddFont('RobotoSlab-Regular','','RobotoSlab-Regular.php');
		$this->SetFont('RobotoSlab-Regular','',15);
		$this->Cell(80);
		$this->Cell(30,10,'PSU URDANETA YEARBOOK',0,1,'C');
		$this->Cell(80);

		if ($req_course == 2) {
			$this->Cell(30,10,'Bachelor of Science in Computer Engineering',0,1,'C');
			}
			if ($req_course == 1) {
			$this->Cell(30,10,'Bachelor of Science in Information Technology',0,1,'C');
			}
			if ($req_course == 3) {
	
			$this->Cell(30,10,'Bachelor of Science in Office Administration',0,1,'C');
	
			}
        $this->Cell(80);
        $this->Cell(30,10,'Batch '.$req_year,0,0,'C');
		$this->Ln(20);
		$this->SetFont('helvetica','B',9);

	}
	function Chapter(){

	}
	function Mybody(){

	}
	function Layout(){

	}
	function footer(){
		// Position at 1.5 cm from bottom
	    $this->SetY(-15);
	    // Arial italic 8
		// $this->AddFont('PrinceOsteoDemoRegular','','PrinceOsteoDemoRegular.php');
	    $this->SetFont('helvetica','',8);
	    // Page number
	    $this->Cell(0,10,'Pangasinan State University Urdaneta - Page'.$this->PageNo().' - ',0,0,'R');
	}
}
// Instanciation of inherited class
$image1 = '../../img/profile_img/';

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->AddFont('RobotoSlab-Regular','','RobotoSlab-Regular.php');
$pdf->SetFont('RobotoSlab-Regular','',10);
//rgb(51,122,183)
$pdf->Cell(30,0,'GRADUATES',0,1,'C');
$pdf->setFillColor(173,217,231);
	while ($data = mysqli_fetch_array($res)) 
	{
		$pdf->MultiCell(14,10,'',0,1,);
	    $pdf->Cell( 45, 45,$pdf->Image($image1.$data['student_img'], $pdf->GetX(), $pdf->GetY(), 50,58).'                                                           Name:  '.$data['student_fName'].' '.$data['student_mName'].' '.$data['student_lName'].'         Personal Motto: "'.$data['student_motto'].'"',0,1);
        $pdf->Cell(0,0,'                                                           Achievements: '.$data['student_achievements'].'   Parents : '.$data['student_parents'],0,1,'',);
	    
	}
$pdf->Output();
?>