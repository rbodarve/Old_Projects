<?php
include_once("classes/middletier/msp/fundagency.class.php");

//print_r($_POST);

$fa=new fundAgency();

$fa->deleteAgency($_GET['fundAgencyID']);


header("Location:?unit=msp&go=funding&task=fundagency_index");
exit(); 
	





?>