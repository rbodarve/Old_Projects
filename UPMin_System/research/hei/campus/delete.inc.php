<?php
include_once("classes/middletier/research/campus.class.php");

//print_r($_POST);

$c=new campus();
$c->deleteCampus($_GET['campusID']);


header("Location:?unit=research&go=hei&task=campus_index");
exit(); 
	





?>