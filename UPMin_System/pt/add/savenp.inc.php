<?php

include_once("classes/middletier/pt/training.class.php");

$training=new Training();
$id=$_POST['id'];
echo $id;

$name=$_POST['name'];
$org=$_POST['org'];

$training->name=$name;
$training->org=$org;
$training->id=$id;
$training->role=$_POST['role'];
$training->savenp();
	
header("Location:?unit=pt&go=add&task=index");
exit(); 

?>