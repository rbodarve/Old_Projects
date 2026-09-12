<?php
include_once("classes/middletier/research/college.class.php");

//print_r($_POST);

$c=new college();
$c->deleteCollege($_GET['collegeID']);


header("Location:?unit=research&go=hei&task=college_index");
exit(); 
	





?>