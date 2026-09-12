<?php
include_once("classes/middletier/pt/training.class_user.php");
include_once("classes/middletier/pt/budget.class.php");

print_r($_POST);

$t=new Training();

$t->training_id=$_GET['training_id'];
$t->participant_id=$_SESSION['userID'];

$t->delete();

header("Location:?unit=pt_user&go=add&task=index");
exit(); 
	
?>