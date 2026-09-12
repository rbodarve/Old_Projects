<?php
include_once("classes/middletier/msp/faculty.class.php");

//print_r($_POST);
$f=new faculty();
$f->lastName=$_POST['lastName'];
$f->firstName=$_POST['firstName'];
$f->middleName=$_POST['middleName'];
$f->address=$_POST['address'];
$f->telephone=$_POST['telephone'];
$f->mobile=$_POST['mobile'];
$f->email=$_POST['email'];
$f->researcherCode=$_POST['researcherCode'];
$f->save();


header("Location:?unit=msp&go=hei&task=faculty_index");
exit(); 
	





?>