<?php
include_once("classes/middletier/msp/project.class.php");

//print_r($_POST);
$p=new projectResearch();
$p->projectName=$_POST['projectName'];
$p->fundID=$_POST['fundID'];
$p->budget=$_POST['budget'];
$p->collegeCode=$_POST['collegeCode'];
$p->startDate=$_POST['startDate'];
$p->endDate=$_POST['endDate'];
$p->userID=$_SESSION['userID'];
$p->projStatusID=$_POST['projStatusID'];
$p->remarks=$_POST['remarks'];
$p->projTypeID=$_POST['projTypeID'];
$p->update($_POST['projectID']);



header("Location:?unit=msp&go=project&task=proj_index");
exit(); 
	





?>