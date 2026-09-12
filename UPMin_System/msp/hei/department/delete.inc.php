<?php
include_once("classes/middletier/msp/department.class.php");

//print_r($_POST);
$d=new department();
$d->deleteDepartment($_GET['deptID']);

header("Location:?unit=msp&go=hei&task=department_index");
exit(); 
	





?>