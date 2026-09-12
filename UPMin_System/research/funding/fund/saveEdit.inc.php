<?php
include_once("classes/middletier/research/fund.class.php");

print_r($_POST);

$f=new fund();

$f->fundName=$_POST['fundName'];
$f->fundAgencyID=$_POST['fundAgencyID'];
$f->amount=$_POST['amount'];
$f->dateCreated=$_POST['dateReceived'];
$f->userID=$_SESSION['userID'];
$f->remarks=$_POST['remarks'];
$f->dateReceived=$_POST['dateReceived'];
$f->update($_POST['fundID']);

header("Location:?unit=research&go=funding&task=fund_index");
exit(); 

?>