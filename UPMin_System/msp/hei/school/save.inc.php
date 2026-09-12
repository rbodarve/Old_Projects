<?php
include_once("classes/middletier/msp/school.class.php");

//print_r($_POST);

$school=new school();

$school->schoolName=$_POST['schoolName'];
$school->schoolCode=$_POST['schoolCode'];
$school->schoolTypeID=$_POST['schoolTypeID'];
$school->address=$_POST['address'];
$school->telephone=$_POST['telephone'];
$school->fax=$_POST['fax'];
$school->mobile=$_POST['mobile'];
$school->email=$_POST['email'];
$school->userID=$_SESSION['userID'];
$school->dateCreated=$_POST['dateCreated'];
$school->lastUpdate=$_POST['lastUpdate'];
$school->website=$_POST['website'];
$school->heiCode=$_POST['heiCode'];
$school->save();


header("Location:?unit=msp&go=hei&task=school_index");
exit(); 
	





?>