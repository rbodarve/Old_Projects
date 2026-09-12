<?php
include_once("classes/middletier/msp/researchertype.class.php");

//print_r($_POST);

$resType=new researcherType();

$resType->deleteResType($_GET['resTypeID']);

header("Location:?unit=msp&go=researcher&task=restype_index");
exit(); 
	





?>