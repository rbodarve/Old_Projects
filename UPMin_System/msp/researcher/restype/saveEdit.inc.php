<?php
include_once("classes/middletier/msp/researchertype.class.php");

//print_r($_POST);

$resType=new researcherType();
$resType->resType=$_POST['resType'];
$resType->userID=$_SESSION['userID'];
$resType->update($_POST['resTypeID']);
header("Location:?unit=msp&go=researcher&task=restype_index");
exit(); 
	





?>