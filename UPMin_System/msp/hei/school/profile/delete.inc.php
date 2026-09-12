<?php
include_once("classes/middletier/msp/school.class.php");

//print_r($_POST);

$school=new school();
$school->deleteSchool($_GET['schoolID']);


header("Location:?unit=msp&go=hei&task=school_index");
exit(); 
	





?>