<?php
include_once("classes/middletier/msp/schooltype.class.php");

//print_r($_POST);
$stype=new schoolType();
$stype->deleteschoolType($_GET['schoolTypeID']);

header("Location:?unit=msp&go=hei&task=type_index");
exit(); 
	





?>