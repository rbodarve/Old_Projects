<?php
include_once("classes/middletier/research/fundingagency.class.php");

$fa=new fundingagency();

$fa->agencyName=$_POST['agencyName'];
$fa->address=$_POST['address'];
$fa->contactNo=$_POST['contactNo'];
$fa->email=$_POST['email'];
$fa->website=$_POST['website'];
$fa->contactPerson=$_POST['contactPerson'];
$fa->save();

header("Location:?unit=research&go=funding&task=fundingagency_index");
exit(); 

?>