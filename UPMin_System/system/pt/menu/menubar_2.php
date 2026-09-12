<?php
$unit="pt";
?>

<div id="menu">
		<ul id="main">
			<li><a href="index.php?unit=home&go=home" >Home</a></li>
			<!--<li><a href="#" rel="personnel">Personnel</a></li>-->
			<li><a href="index.php?unit=<?php echo $unit;?>&go=add&task=addNew" >ADD</a></li>
			<!--<li><a href="#" rel="office">Unit Office</a></li>-->
			<li><a href="#" rel="edit">EDIT</a></li>
			<!--<li><a href="#" rel="opes">Performance Evaluation</a></li>-->
			<li><a href="index.php?unit=<?php echo $unit;?>&go=filter&task=filter">FILTER</a></li>
			<!--li><a href="index.php?unit=<?php echo $unit;?>&go=application&task=index" rel="application">Application</a></li>	
			<li><a href="index.php?unit=<?php echo $unit;?>&go=dtr&task=index">Daily Time Record</a></li>	
			<li><a href="index.php?unit=<?php echo $unit;?>&go=employee&task=index" rel="training">Training</a></li>
			<li><a href="index.php?unit=<?php echo $unit;?>&go=exam&task=index" rel="exam">Exam</a></li>	
			<li><a href="index.php?unit=<?php echo $unit;?>&go=job&task=index">Jobs</a></li>	
			<li><a href="index.php?unit=<?php echo $unit;?>&go=manpower&task=index" rel="manpower">Manpower</a></li>	
			<li><a href="index.php?unit=<?php echo $unit;?>&go=report&task=index">Report</a></li>	
			<li><a href="index.php?unit=<?php echo $unit;?>&go=setup&task=index" rel="setup" >Setup</a></li-->	
		</ul>		
</div>
		

<div id="edit" class="dropmenudiv" style="width: 200px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=edit&task=index" >Modify</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=edit&task=delete" >Delete</a></li>
	<!--li><a href="index.php?unit=<?php echo $unit;?>&go=employee/employment/employment&task=index" >Employment</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=employee/benefits/employeediscount&task=index" >Employee Discount Rates</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=cases&task=index" >Cases</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=cases&task=index" >Discipline & Counseling</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=leave&task=index" >Leave</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=performance&task=index" >Performance</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=records&task=index" >Records</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=salary&task=index" >Salary</a></li-->
</div>
		
<script type="text/javascript">

cssdropdown.startchrome("menu")

</script>	
