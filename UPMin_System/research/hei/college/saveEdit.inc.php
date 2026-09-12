<?php
include_once("classes/middletier/research/college.class.php");

//print_r($_POST);

$c=new college();
$c->collegeCode=$_POST['collegeCode'];
$c->collegeName=$_POST['collegeName'];
$c->campusName=$_POST['campusName']; //nag.add
$c->dean=$_POST['dean'];
//$c->phoneNo=$_POST['phoneNo'];//nag.end
$c->userID=$_SESSION['userID'];
$c->update($_POST['collegeID']);



header("Location:?unit=research&go=hei&task=college_index");
exit(); 
	





?>