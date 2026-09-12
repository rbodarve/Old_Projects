<?php
include_once("classes/middletier/msp/schooltype.class.php");

//print_r($_POST);
$stype=new schoolType();
$stype->schoolTypeName=$_POST['schoolTypeName'];
$stype->userID=$_SESSION['userID'];
$stype->save();

header("Location:?unit=msp&go=hei&task=type_index");
exit(); 
	





?>