<?php
include_once("classes/middletier/research/college.class.php");

//print_r($_POST);

$c=new college();
$c->collegeCode=$_POST['collegeCode'];
$c->collegeName=$_POST['collegeName'];
$c->campusName=$_POST['campusName'];
$c->dean=$_POST['dean'];
//$c->phoneNo=$_POST['phoneNo'];
$c->userID=$_SESSION['userID'];
$c->save();



header("Location:?unit=research&go=hei&task=college_index");
exit(); 
	





?>