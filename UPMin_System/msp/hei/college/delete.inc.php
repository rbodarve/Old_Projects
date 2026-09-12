<?php
include_once("classes/middletier/msp/college.class.php");

//print_r($_POST);

$c=new college();
$c->deleteCollege($_GET['collegeID']);


header("Location:?unit=msp&go=hei&task=college_index");
exit(); 
	





?>