<?php
include_once("classes/middletier/msp/researcher.class.php");

//print_r($_POST);
$res=new researcher();
$res->idNumber=$_POST['idNumber'];
$res->researcherName=$_POST['researcherName'];
$res->resTypeID=$_POST['resTypeID'];
$res->emailAddress=$_POST['emailAddress'];
$res->collegeCode=$_POST['collegeCode'];
$res->mobilePhone=$_POST['mobilePhone'];
$res->telephone=$_POST['telephone'];
$res->userID=$_SESSION['userID'];
$res->update($_POST['researcherID']);


header("Location:?unit=msp&go=researcher&task=res_index");
exit(); 
	





?>