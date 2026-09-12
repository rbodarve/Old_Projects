<?php
include_once("classes/middletier/research/fresearch.class.php");

//print_r($_POST);

$pu=new fresearch();
$pu->deletefresearch($_GET['researchID']);


header("Location:?unit=research&go=project&task=fresearch_index");
exit(); 
	





?>