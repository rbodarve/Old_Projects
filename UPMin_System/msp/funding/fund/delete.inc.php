<?php
include_once("classes/middletier/msp/fund.class.php");

print_r($_POST);

$f=new fund();

$f->deletefund($_GET['fundID']);



header("Location:?unit=msp&go=funding&task=fund_index");
exit(); 
	





?>