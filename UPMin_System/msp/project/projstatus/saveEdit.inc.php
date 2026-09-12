<?php
include_once("classes/middletier/msp/projstatus.class.php");

//print_r($_POST);

$projstatus=new projectStatus();
$projstatus->projStatusName=$_POST['projStatusName'];
$projstatus->userID=$_SESSION['userID'];
$projstatus->update($_POST['projStatusID']);

header("Location:?unit=msp&go=project&task=projstatus_index");
exit(); 
	





?>