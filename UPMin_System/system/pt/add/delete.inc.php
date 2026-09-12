<?php
include_once("classes/middletier/pt/training.class.php");
include_once("classes/middletier/pt/budget.class.php");

$t=new Training();
$b=new Budget();

$b->delete($_GET['training_id']);
$t->delete($_GET['training_id']);

header("Location:?unit=pt&go=add&task=index");
exit(); 
	
?>