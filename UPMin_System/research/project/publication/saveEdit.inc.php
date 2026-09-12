<?php
include_once("classes/middletier/research/publication.class.php");


$pu=new publication();
$pu->title=$_POST['title'];
$pu->publisher=$_POST['publisher'];
$pu->volumeNo=$_POST['volumeNo'];
$pu->edition=$_POST['edition'];
$pu->update($_POST['publicationID']);

header("Location:?unit=research&go=project&task=publication_index");
exit(); 
	





?>