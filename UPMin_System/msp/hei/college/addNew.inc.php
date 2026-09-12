<?php
$unit="msp";
$go="hei";
$task="college_save";
//include_once("classes/middletier/msp/fundagency.class.php");

?>
<script type="text/javascript">

	function checkEntry()
	{
		var collegeName=document.getElementById('collegeName').value;
		var collegeCode=document.getElementById('collegeCode').value;		
		
		if(collegeName=='')
		{
			alert("No Name!");
			return false;
		}
		if(collegeCode=='')
		{
			alert("No Name!");
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
											COLLEGE
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW COLLEGE</th>								  									
								</tr>
								<tr>							
									<td>
										Short name
										</td>
										<td>
											<input type="text" name="collegeCode" id="collegeCode" value="" size="30">
										</td>
										
								</tr>
								<tr>							
									<td>
										College name
										</td>
										<td>
											<input type="text" name="collegeName" id="collegeName" value="" size="60">
										</td>
										
								</tr>
								
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=college_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>