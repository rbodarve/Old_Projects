<?php
$unit="research";
?>


<div id="menu">
		<ul id="main">
			<li><a href="index.php?unit=home&go=home" >Home</a></li>
			<li><a href="#" rel="hei">UP SYSTEM</a></li>							
			<li><a href="#" rel="research">UP PERSONNEL</a></li>											
			<li><a href="#" rel="publication">PUBLICATIONS</a></li>							
			<li><a href="#" rel="funding">FUNDING AGENCY</a></li>
		</ul>		
	</div>
</div>

<div id="hei" class="dropmenudiv" style="width: 150px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=hei&task=campus_index" >Campus</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=hei&task=college_index">College</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=hei&task=department_index">Department</a></li>	

</div>


<div id="research" class="dropmenudiv" style="width: 150px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=researcher&task=personnel_index">Faculty Assistant </a></li>		
	<li><a href="index.php?unit=<?php echo $unit;?>&go=researcher&task=faculty_index">Faculty Researcher </a></li>	
</div>

<div id="publication" class="dropmenudiv" style="width: 200px;">
        <li><a href="index.php?unit=<?php echo $unit;?>&go=project&task=publication_index" >Publishers</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=project&task=journal_index" >Journal</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=project&task=fresearch_index" >Research</a></li>
</div>

<div id="funding" class="dropmenudiv" style="width: 200px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=funding&task=fundingagency_index" >Funding Agencies</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=funding&task=fund_index" >List Of Funds</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=funding&task=fundtype_index" >Type Of Funds</a></li>		
</div>



<script type="text/javascript">
	cssdropdown.startchrome("menu")
</script>