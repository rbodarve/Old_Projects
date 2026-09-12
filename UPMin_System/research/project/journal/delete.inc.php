<?php
include_once("classes/middletier/research/journal.class.php");

$pu=new journal();
$pu->deletejournal($_GET['journalID']);


header("Location:?unit=research&go=project&task=journal_index");
exit(); 
	





?>