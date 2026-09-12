<?php

include_once("classes/middletier/pt/training.class_user.php");
include_once("classes/middletier/pt/budget.class.php");

$training=new Training();
$budget=new Budget();

$budget->budget_allocated=$_POST['budget_allocated'];
$budget->budget_actual=$_POST['budget_actual'];
$budget->budget_remarks=$_POST['budget_remarks'];
$budget->save();

$training->training_title=$_POST['training_title'];
$training->start_date=$_POST['start_date'];
$training->end_date=$_POST['end_date'];
$training->location=$_POST['loc'];
$training->city=$_POST['city'];
$training->organizer=$_POST['organizer'];
$training->typ=$_POST['typ'];
$training->descr=$_POST['descr'];
$training->remarks=$_POST['remarks'];
$training->budget_id= $budget->getID();
$training->save();
$training->getID();

$training->addptt($training->training_ID);


	
header("Location:?unit=pt_user&go=add&task=index");
exit(); 

?>