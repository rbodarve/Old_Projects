<?php
$unit="msp";
$go="project";
$task="projtype_saveEdit";
include_once("classes/middletier/msp/projecttype.class.php");

$projType=new projectType();
$projType->load($_GET['projTypeID']);
?>
<script type="text/javascript">

	function checkEntry()
	{
		var projType=document.getElementById('projTypeName').value;
		
		
		
		if(projType=='')
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
											Type of Project
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW TYPE OF RESEARCH</th>								  									
								</tr>
								<tr>							
										<td>
										Name
										</td>
										<td>
											<input type="text" name="projTypeName" id="projTypeName" value="<?php echo $projType->projTypeName;?>" size="60">
										</td>
										
									</tr>
								
							
								</table>
								<div align="right">
       		 						<input type="submit" name="save" value="Save" > 					    		 			
       		 						<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=projtype_index'">        		
 								</div>
 								<input type="hidden" name="projTypeID" value="<?php echo $projType->projTypeID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>