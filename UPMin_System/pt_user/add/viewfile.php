<?php

include_once("classes/middletier/pt/training.class_user.php");

$id=$_GET['training_id'];

$training=new Training();
$training->viewCert($id);

$imagepath="modules/pt/uploads/".$training->cert."";
/*
$image=imagecreatefromjpeg($imagepath);

header('$imagepath');

imagejpeg($image);
*/

header('Content-disposition: attachment; filename='.$training->cert.'');
header('Content-type: image/png');
readfile(''.$imagepath.'');

?>