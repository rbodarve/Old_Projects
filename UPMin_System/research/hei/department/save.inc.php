<?php
include_once("classes/middletier/research/department.class.php");

//print_r($_POST);
$d=new department();
$d->deptCode=$_POST['deptCode'];
$d->deptName=$_POST['deptName'];
$d->collegeName=$_POST['collegeName'];
$d->deptChair=$_POST['deptChair']; //end.add
//$d->userID=$_SESSION['userID'];
$d->save();


header("Location:?unit=research&go=hei&task=department_index");
exit(); 
	





?>