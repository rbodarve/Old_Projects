<?php
$unit="pt";
?>

<div id="menu">
		<ul id="main">
			<li><a href="index.php?unit=home&go=home" >Home</a></li>
			<li><a href="#" rel="training">TRAININGS</a></li>
		</ul>		
</div>

<div id="training" class="dropmenudiv" style="width: 150px;">
	<?php
		if($userRole->verifyAccess($_SESSION['userID'],"tracker") || $_SESSION['userType']==1)
		{
		?>	
			<li><a href="index.php?unit=<?php echo $unit;?>&go=add&task=index" >All Trainings</a></li>
	<?php
		}
	?>
	<li><a href="index.php?unit=pt_user&go=home&task=index" >MY Trainings</a></li>
</div>

<script type="text/javascript">

cssdropdown.startchrome("menu")

</script>	
