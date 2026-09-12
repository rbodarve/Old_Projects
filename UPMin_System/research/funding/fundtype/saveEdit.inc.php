<?php
include_once("classes/middletier/research/fundtype.class.php");

$fundtype=new fundType();
$fundtype->fundTypeName=$_POST['fundTypeName'];
$fundtype->userID=$_SESSION['userID'];
$fundtype->update($_POST['fundTypeID']);

header("Location:?unit=research&go=funding&task=fundtype_index");
exit(); 

?>