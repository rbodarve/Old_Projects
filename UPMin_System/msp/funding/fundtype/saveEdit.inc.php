<?php
include_once("classes/middletier/msp/fundtype.class.php");

//print_r($_POST);

$fundtype=new fundType();
$fundtype->fundTypeName=$_POST['fundTypeName'];
$fundtype->userID=$_SESSION['userID'];
$fundtype->update($_POST['fundTypeID']);
header("Location:?unit=msp&go=funding&task=fundtype_index");
exit(); 
	





?>