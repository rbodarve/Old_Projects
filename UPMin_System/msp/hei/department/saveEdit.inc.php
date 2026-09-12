<?php
include_once("classes/middletier/msp/department.class.php");

//print_r($_POST);
$d=new department();
$d->deptCode=$_POST['deptCode'];
$d->deptName=$_POST['deptName'];
$d->userID=$_SESSION['userID'];
$d->update($_POST['deptID']);


header("Location:?unit=msp&go=hei&task=department_index");
exit(); 
	





?>