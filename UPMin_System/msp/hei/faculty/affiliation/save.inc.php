<?php
include_once("classes/middletier/msp/education.class.php");

//print_r($_POST);
$e=new education();

$e->facultyID=$_POST['facultyID'];
$e->level=$_POST['level'];
$e->yearGraduated=$_POST['yearGraduated'];
$e->schoolName=$_POST['schoolName'];
$e->degree=$_POST['degree'];
$e->awards=$_POST['awards'];
$e->userID=$_SESSION['userID'];
$e->save();


header("Location:?unit=msp&go=hei&task=education_index&facultyID=".$_POST['facultyID']);
exit(); 
	





?>