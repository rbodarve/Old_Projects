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
$training->loc=$_POST['loc'];
$training->city=$_POST['city'];
$training->organizer=$_POST['organizer'];
$training->typ=$_POST['typ'];
$training->descr=$_POST['descr'];
$training->role=$_POST['nature'];
$training->remarks=$_POST['remarks'];
$training->budget_id= $budget->getID();
$training->save();
$training->getID();

$id=$training->training_ID;

$training->addptt($id, $training->role);

//echo $id;

$fname= $_FILES['uploaded']['name'];
 
$training=new Training();

$fname= $_FILES['uploaded']['name'];

//file upload
	
	$target = "modules/pt/uploads/"; 
	$target = $target . basename($fname) ; 
	$ok=1; 
	
	function get_file_extension($file_name)
	{
		return substr(strrchr($file_name,'.'),1);
	}
	
	$exts=get_file_extension($fname);
 
	if(move_uploaded_file($_FILES['uploaded']['tmp_name'], $target))
	{
		$name= "".$_SESSION['userID']."_".$id.".".$exts."";
		$newfileName= "modules/pt/uploads/".$name."";
		rename("$target", "$newfileName");
		$training->saveFile($id, $name);
	}
	
header("Location:?unit=pt_user&go=add&task=index");
exit(); 

?>