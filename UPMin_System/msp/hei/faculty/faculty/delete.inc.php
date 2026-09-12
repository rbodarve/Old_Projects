<?php
include_once("classes/middletier/msp/faculty.class.php");

//print_r($_POST);
$f=new faculty();
$f->deleteFaculty($_GET['facultyID']);
header("Location:?unit=msp&go=hei&task=faculty_index");
exit(); 
	





?>