<?php

include_once("classes/middletier/pt/training.class_user.php");

$training=new Training();

$id=$_POST['training_id'];
echo $id;

$training->addptt($id);
	
header("Location:?unit=pt_user&go=add&task=index");
exit(); 

?>