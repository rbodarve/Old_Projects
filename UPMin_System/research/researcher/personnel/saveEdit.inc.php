<?php
include_once("classes/middletier/research/personnel.class.php");

$p=new personnel();
$p->lastName=$_POST['lastName'];
$p->firstName=$_POST['firstName'];
$p->middleName=$_POST['middleName'];
$p->collegeCode=$_POST['collegeCode']; //nag.add
$p->address=$_POST['address'];
$p->email=$_POST['email'];
$p->contactNo=$_POST['contactNo'];
$p->salary=$_POST['salary']; //nag.add
$p->update($_POST['personnel_ID']);

header("Location:?unit=research&go=researcher&task=personnel_index");
exit(); 
	





?>