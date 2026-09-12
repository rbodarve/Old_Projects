<?php
include_once("classes/middletier/research/fundtype.class.php");

$fundtype=new fundType();

$fundtype->deleteFundType($_GET['fundTypeID']);

header("Location:?unit=research&go=funding&task=fundtype_index");
exit(); 
	
?>