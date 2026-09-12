<?php

include_once("classes/middletier/pt/training.class.php");
include_once("classes/middletier/pt/budget.class.php");

$training=new Training();
$budget=new Budget();

$budget->budget_allocated=$_POST['budget_allocated'];
$budget->budget_actual=$_POST['budget_actual'];
$budget->save();

$training->training_title=$_POST['training_title'];
$training->start_date=$_POST['start_date'];
$training->end_date=$_POST['end_date'];
$training->location=$_POST['location'];
$training->city=$_POST['city'];
$training->organizer=$_POST['organizer'];
$training->desc=$_POST['desc'];
$training->remarks=$_POST['remarks'];
$training->budget_id= $budget->getID();
$training->save();
	
header("Location:?unit=pt&go=add&task=index");
exit(); 

?>