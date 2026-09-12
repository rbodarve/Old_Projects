<?php
$unit="msp";
$go="hei";
$task="education_save";
include_once("classes/middletier/msp/school.class.php");

$s=new school();
$s->loadAll();
?>
<script type="text/javascript">

	function checkEntry()
	{
		var level=document.getElementById('level').selectedIndex;
		var schoolName=document.getElementById('schoolName').value;		
		var degree=document.getElementById('degree').value;		
		var awards=document.getElementById('awards').value;				
		
		if(level==0)
		{
			alert("No Level selected");
			return false;
		}
		if(schoolName=='')
		{
			alert("No schoolName!");
			return false;
		}		
		if(degree=='')
		{
			alert("No degree!");
			return false;
		}		
		if(awards=='')
		{
			alert("No awards!");
			return false;
		}		
		
		return true;
		
	}


</script>
<div id="wrapper">
  <div id="page">
	
	 <!--GOLD BOX TEMPLATE STARTS HERE -->
			<div id="greenbox"><!-- GOLD box template!   -->
					<div class="box-outer">	
							<div class="box-title"> <!-- this is fixed! Dont make any changes here!   -->
		   						<div class="box-center">		   
									<div class="box-left">
									</div>										
									<div class="box-right">
									</div>											
									<div align="center">
										<div class="title"> <!-- put your header name here   -->
											EDUCATIONAL BACKGROUND
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD EDUCATIONAL BACKGROUND</th>								  									
								</tr>
								<tr>							
									<td>
										Level
										</td>
										<td>
										<select name="level" id="level">
											<option value="0">-SELECT-</option>
										<?php
											foreach ($LEVEL as $levNum => $lev)
											{
										?>	
											<option value="<?php echo $levNum;?>"><?php echo $lev;?></option>										
										<?php
											}
										?>
										</select>
										</td>										
								</tr>
								<tr>							
									<td>
										School name
										</td>
										<td>
											<input type="text" name="schoolName" id="schoolName" value="" size="100">
										</td>										
								</tr>
								<tr>							
									<td>
										Year graduated
										</td>
										<td>
											<input type="text" name="yearGraduated"  id="yearGraduated" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_yearGraduated" title="Date selector" align="absmiddle" class="jscalimg"/>
									<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "yearGraduated",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_yearGraduated",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>									
										</td>										
								</tr>
								<tr>							
									<td >
										Degree
										</td>
										<td>
										<input type="text" name="degree" id="degree" value="" size="100">
										</td>										
								</tr>
								<tr>							
									<td>
										Awards
										</td>
										<td>
											<input type="text" name="awards" id="awards" value="" size="100">
										</td>										
								</tr>								
								
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=education_index&facultyID=<?php echo $_GET['facultyID'];?>'">        		
 						</div>
 								<input type="hidden" name="facultyID" value="<?php echo $_GET['facultyID'];?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>