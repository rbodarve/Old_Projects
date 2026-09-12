<?php
include_once("classes/middletier/research/campus.class.php");

//print_r($_POST);

$c=new campus();
$c->campusName=$_POST['campusName'];
$c->place=$_POST['place'];
$c->dateEstablished=$_POST['dateEstablished'];
$c->chancellor=$_POST['chancellor'];
$c->save();



header("Location:?unit=research&go=hei&task=campus_index");
exit(); 
	





?>