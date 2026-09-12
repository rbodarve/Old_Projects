<?php
include_once("classes/middletier/research/faculty.class.php");

//print_r($_POST);
$f=new faculty();
$f->lastName=$_POST['lastName'];
$f->firstName=$_POST['firstName'];
$f->middleName=$_POST['middleName'];
$f->deptCode=$_POST['deptCode']; //nag.add
$f->address=$_POST['address'];
$f->contactNo=$_POST['contactNo'];
$f->researcherCode=$_POST['researcherCode'];
$f->specialty=$_POST['specialty']; //nag.add
$f->salary=$_POST['salary']; //nag.add
$f->save();


header("Location:?unit=research&go=researcher&task=faculty_index");
exit(); 
	





?>