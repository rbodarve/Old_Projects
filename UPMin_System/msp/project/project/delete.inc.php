<?php
include_once("classes/middletier/msp/project.class.php");

//print_r($_POST);
$p=new projectResearch();
$p->deleteProject($_GET['projectID']);



header("Location:?unit=msp&go=project&task=proj_index");
exit(); 
	





?>