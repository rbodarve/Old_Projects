<?php
include_once("classes/middletier/research/fresearch.class.php");

//print_r($_POST);

$fr=new fresearch();
$fr->journalID=$_POST['journalID'];
$fr->publicationID=$_POST['publicationID'];
$fr->fundAgencyID=$_POST['fundAgencyID'];
$fr->startDate=$_POST['startDate'];
$fr->endDate=$_POST['endDate'];
$fr->rtitle=$_POST['rtitle'];
$fr->budget=$_POST['budget'];
$fr->facultyID=$_POST['facultyID'];
$fr->update($_POST['researchID']);

header("Location:?unit=research&go=project&task=fresearch_index");
exit(); 
	





?>