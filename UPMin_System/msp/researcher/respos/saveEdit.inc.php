<?php
include_once("classes/middletier/msp/resposition.class.php");

//print_r($_POST);
$respos=new resPosition();
$respos->resPosName=$_POST['resPosName'];
$respos->userID=$_SESSION['userID'];
$respos->update($_GET['resPosID']);

header("Location:?unit=msp&go=researcher&task=respos_index");
exit(); 
	





?>