<?php
include_once("classes/middletier/research/fund.class.php");

$f=new fund();

$f->deletefund($_GET['fundID']);

header("Location:?unit=research&go=funding&task=fund_index");
exit(); 

?>