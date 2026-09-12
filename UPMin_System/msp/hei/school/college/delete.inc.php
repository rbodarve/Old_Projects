<?php
include_once("classes/middletier/msp/scollege.class.php");

//print_r($_POST);
$sc= new sCollege();
$sc->deleteCollege($_GET['sCollegeID']);

header("Location:?unit=msp&go=hei&task=scolleges_index&schoolID=".$_GET['schoolID']);
exit(); 
	





?>