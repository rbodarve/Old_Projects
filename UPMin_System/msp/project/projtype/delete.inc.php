<?php
include_once("classes/middletier/msp/projecttype.class.php");

//print_r($_POST);

$projType=new projectType();

$projType->deleteProjectType($_GET['projTypeID']);

header("Location:?unit=msp&go=project&task=projtype_index");
exit(); 
	





?>