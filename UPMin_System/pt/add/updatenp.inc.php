<?php

include_once("classes/middletier/pt/training.class.php");

$training=new Training();
$id=$_GET['pid'];
echo $id;

$name=$_POST['name'];
$org=$_POST['org'];

$training->name=$name;
$training->org=$org;
$training->updatenp($id);
	
header("Location:?unit=pt&go=add&task=index");
exit(); 

?>