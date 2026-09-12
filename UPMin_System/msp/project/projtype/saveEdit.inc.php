<?php
include_once("classes/middletier/msp/projecttype.class.php");

//print_r($_POST);

$projType=new projectType();
$projType->projTypeName=$_POST['projTypeName'];
$projType->userID=$_SESSION['userID'];
$projType->update($_POST['projTypeID']);
header("Location:?unit=msp&go=project&task=projtype_index");
exit(); 
	





?>