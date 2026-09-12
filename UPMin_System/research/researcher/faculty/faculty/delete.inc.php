<?php
include_once("classes/middletier/research/faculty.class.php");

//print_r($_POST);
$f=new faculty();
$f->deleteFaculty($_GET['facultyID']);
header("Location:?unit=research&go=researcher&task=faculty_index");
exit(); 
	





?>