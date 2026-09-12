<?php
include_once("classes/middletier/research/personnel.class.php");

//print_r($_POST);
$p=new personnel();
$p->deletePersonnel($_GET['personnel_ID']);
header("Location:?unit=research&go=researcher&task=personnel_index");
exit(); 
	





?>