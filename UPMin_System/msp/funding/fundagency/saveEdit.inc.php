<?php
include_once("classes/middletier/msp/fundagency.class.php");

//print_r($_POST);

$fa=new fundAgency();

$fa->agencyName=$_POST['agencyName'];
$fa->address=$_POST['address'];
$fa->email=$_POST['email'];
$fa->website=$_POST['website'];
$fa->telephone=$_POST['telephone'];
$fa->mobilePhone=$_POST['mobilePhone'];
$fa->contactPerson=$_POST['contactPerson'];
$fa->userID=$_SESSION['userID'];
$fa->position=$_POST['position'];
$fa->update($_POST['fundAgencyID']);


header("Location:?unit=msp&go=funding&task=fundagency_index");
exit(); 
	





?>