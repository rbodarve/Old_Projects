<?php
include_once("classes/middletier/msp/projstatus.class.php");

//print_r($_POST);

$projType=new projectStatus();

$projType->deleteProjectStatus($_GET['projStatusID']);

header("Location:?unit=msp&go=project&task=projstatus_index");
exit(); 
	





?>