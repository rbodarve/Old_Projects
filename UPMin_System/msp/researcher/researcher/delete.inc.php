<?php
include_once("classes/middletier/msp/researcher.class.php");

//print_r($_POST);
$res=new researcher();
$res->deleteReseacher($_GET['researcherID']);



header("Location:?unit=msp&go=researcher&task=res_index");
exit(); 
	





?>