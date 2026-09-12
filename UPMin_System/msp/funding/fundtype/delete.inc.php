<?php
include_once("classes/middletier/msp/fundtype.class.php");

//print_r($_POST);

$fundtype=new fundType();

$fundtype->deleteFundType($_GET['fundTypeID']);

header("Location:?unit=msp&go=funding&task=fundtype_index");
exit(); 
	





?>