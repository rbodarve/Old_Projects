<?php

include_once("classes/middletier/pt/training.class_user.php");

$training=new Training();

$id=$_POST['training_id'];
$nature=$_POST['nature'];
echo $nature;
$fname= $_FILES['uploaded']['name'];

//file upload

	$filetype = $_FILES['uploaded']['type'];
	
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
		$training->addptt($id, $nature);
		$training->saveFile($id, $name);
	}

header("Location:?unit=pt_user&go=add&task=index");
exit(); 

?>