<?php
include_once("classes/middletier/research/department.class.php");

//print_r($_POST);
$d=new department();
$d->deleteDepartment($_GET['deptID']);

header("Location:?unit=research&go=hei&task=department_index");
exit(); 
	





?>