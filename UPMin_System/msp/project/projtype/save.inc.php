<?php
include_once("classes/middletier/msp/projecttype.class.php");

//print_r($_POST);

$projType=new projectType();
$projType->projTypeName=$_POST['projTypeName'];
$projType->userID=$_SESSION['userID'];
$projType->save();

header("Location:?unit=msp&go=project&task=projtype_index");
exit(); 
	





?>