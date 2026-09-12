<?php
include_once("classes/middletier/pt/training.class.php");
include_once("classes/middletier/pt/budget.class.php");

$t=new Training();

$t->deletenp($_GET['pid']);

header("Location:?unit=pt&go=add&task=index");
exit(); 
	
?>