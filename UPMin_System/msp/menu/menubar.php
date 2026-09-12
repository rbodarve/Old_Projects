<?php
$unit="msp";
?>


<div id="menu">
		<ul id="main">
			<li><a href="index.php?unit=home&go=home" >Home</a></li>
			<li><a href="#" rel="hei">HEI</a></li>							
			<li><a href="#" rel="research">Research</a></li>											
			<li><a href="#" rel="publication">Publications</a></li>	
			<li><a href="#" rel="awards">Awards</a></li>							
			<li><a href="#" rel="copyright">Copyright & patents</a></li>							
			<li><a href="#" rel="funding">Funding Agency</a></li>
		</ul>		
	</div>
</div>

<div id="hei" class="dropmenudiv" style="width: 150px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=hei&task=school_index" >School profile</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=hei&task=type_index">School type</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=hei&task=college_index">College</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=hei&task=department_index">Department</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=hei&task=faculty_index">Faculty Researcher</a></li>	
</div>


<div id="research" class="dropmenudiv" style="width: 150px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=research&task=unit_index" >Unit</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=research&task=program_index" >Programs</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=research&task=project_index" >Projects</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=research&task=assistant_index" >Assistant</a></li>		
	<li><a href="index.php?unit=<?php echo $unit;?>&go=research&task=type_index" >Type</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=research&task=class_index" >Classification</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=research&task=position_index" >Position</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=research&task=interest_index" >Interest</a></li>	
</div>

<div id="publication" class="dropmenudiv" style="width: 200px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=accounts&task=collection_payment" >Article</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=accounts&task=collection_summary" >Journal</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=accounts&task=collection_summary" >Books</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=accounts&task=collection_summary" >Classification</a></li>	
</div>

<div id="copyright" class="dropmenudiv" style="width: 200px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=accounts&task=collection_payment" >Article</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=accounts&task=collection_summary" >Journal</a></li>	
</div>


<div id="awards" class="dropmenudiv" style="width: 200px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=accounts&task=collection_payment" >Awards</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=accounts&task=collection_summary" >Classification</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=funding&task=fundtype_index" >Type of awards</a></li>	
</div>

<div id="funding" class="dropmenudiv" style="width: 200px;">
	<li><a href="index.php?unit=<?php echo $unit;?>&go=funding&task=fund_index" >List of funds</a></li>
	<li><a href="index.php?unit=<?php echo $unit;?>&go=funding&task=fundagency_index" >Funding agencies</a></li>	
	<li><a href="index.php?unit=<?php echo $unit;?>&go=funding&task=fundtype_index" >Type of funds</a></li>	
</div>



<script type="text/javascript">
	cssdropdown.startchrome("menu")
</script>