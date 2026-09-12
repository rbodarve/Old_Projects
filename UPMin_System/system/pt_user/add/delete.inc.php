<?php
include_once("classes/middletier/pt/training.class.php");
include_once("classes/middletier/pt/budget.class.php");

print_r($_POST);

$t=new Training();

$t->delete($_GET['training_id'], $_SESSION['userID']);

header("Location:?unit=pt_user&go=add&task=index");
exit(); 
	
?>