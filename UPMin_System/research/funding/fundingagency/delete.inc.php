<?php
include_once("classes/middletier/research/fundingagency.class.php");

$fa=new fundingagency();

$fa->deleteAgency($_GET['fundAgencyID']);

header("Location:?unit=research&go=funding&task=fundingagency_index");
exit(); 

?>