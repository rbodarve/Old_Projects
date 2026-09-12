<?php
$unit="msp";
$go="project";
$task="projstatus_saveEdit";
include_once("classes/middletier/msp/projstatus.class.php");

$projstatus=new projectStatus();
$projstatus->load($_GET['projStatusID']);

//print_r($_GET);
?>
<script type="text/javascript">

	function checkEntry()
	{
		var projstatus=document.getElementById('projStatusName').value;
		
		
		
		if(projstatus=='')
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
											STATUS
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">EDIT STATUS</th>								  									
								</tr>
								<tr>							
										<td>
										Name
										</td>
										<td>
											<input type="text" name="projStatusName" id="projStatusName" value="<?php echo $projstatus->projStatusName;?>" size="60">
										</td>
										
									</tr>
								
							
								</table>
								<div align="right">
       		 						<input type="submit" name="save" value="Save" > 					    		 			
       		 						<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=projstatus_index'">        		
 								</div>
 								<input type="hidden" name="projStatusID" value="<?php echo $projstatus->projStatusID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>