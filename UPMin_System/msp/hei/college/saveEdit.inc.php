<?php
include_once("classes/middletier/msp/college.class.php");

//print_r($_POST);

$c=new college();
$c->collegeCode=$_POST['collegeCode'];
$c->collegeName=$_POST['collegeName'];
$c->userID=$_SESSION['userID'];
$c->update($_POST['collegeID']);



header("Location:?unit=msp&go=hei&task=college_index");
exit(); 
	





?>