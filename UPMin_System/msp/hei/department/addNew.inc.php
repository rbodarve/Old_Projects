<?php
$unit="msp";
$go="hei";
$task="department_save";
//include_once("classes/middletier/msp/fundagency.class.php");

?>
<script type="text/javascript">

	function checkEntry()
	{
		var departmentName=document.getElementById('deptName').value;
		var departmentCode=document.getElementById('deptCode').value;		
		
		if(departmentName=='')
		{
			alert("No Name!");
			return false;
		}
		if(departmentCode=='')
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
											department
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW department</th>								  									
								</tr>
								<tr>							
									<td>
										Short name
										</td>
										<td>
											<input type="text" name="deptCode" id="deptCode" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										department name
										</td>
										<td>
											<input type="text" name="deptName" id="deptName" value="" size="60">
										</td>
										
								</tr>
								
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=department_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>