<?php
include_once("classes/middletier/msp/scollege.class.php");

//print_r($_POST);
$sc= new sCollege();

$colleges=$_POST['colleges'];

if(count($colleges))
{
	$sc->schoolID=$_POST['schoolID'];
	$sc->userID=$_SESSION['userID'];
	foreach ($colleges as $collegeID)
	{
		$sc->collegeID=$collegeID;
		$sc->save();			
	}		
}


header("Location:?unit=msp&go=hei&task=scolleges_index&schoolID=".$_POST['schoolID']);
exit(); 
	





?>