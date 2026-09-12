<?php

include_once("classes/middletier/pt/training.class.php");
include_once("classes/middletier/pt/budget.class.php");

$training=new Training();
$budget=new Budget();

$id=$_POST['training_id'];

$budget->budget_allocated=$_POST['budget_allocated'];
$budget->budget_actual=$_POST['budget_actual'];
$budget->budget_remarks=$_POST['budget_remarks'];
$budget->update($id);

$training->training_title=$_POST['training_title'];
$training->start_date=$_POST['start_date'];
$training->end_date=$_POST['end_date'];
$training->location=$_POST['location'];
$training->city=$_POST['city'];
$training->remarks=$_POST['remarks'];
$training->organizer=$_POST['organizer'];
$training->typ=$_POST['typ'];
$training->desc=$_POST['desc'];
$training->budget_id= $budget->getID();
$training->update($id);
	
header("Location:?unit=pt&go=add&task=index");
exit(); 

?>