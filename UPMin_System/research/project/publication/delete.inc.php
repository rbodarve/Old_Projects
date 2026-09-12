<?php
include_once("classes/middletier/research/publication.class.php");

//print_r($_POST);

$pu=new publication();
$pu->deletePublication($_GET['publicationID']);


header("Location:?unit=research&go=project&task=publication_index");
exit(); 
	





?>