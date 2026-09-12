<?php
include_once("classes/middletier/research/journal.class.php");

//print_r($_POST);

$j=new journal();
$j->ISSN=$_POST['ISSN'];
$j->volume=$_POST['volume'];
$j->editor=$_POST['editor'];
$j->datePublished=$_POST['datePublished'];
$j->publicationID=$_POST['publicationID'];
$j->journalTitle=$_POST['journalTitle'];
$j->issue=$_POST['issue'];
$j->save();
//$pu->save($_POST['journalID']);
header("Location:?unit=research&go=project&task=journal_index");
exit(); 
	
?>