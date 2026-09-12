<?php
$unit="msp";
$go="hei";
$task="type_saveEdit";
include_once("classes/middletier/msp/schooltype.class.php");

$stype=new schoolType();
$stype->load($_GET['schoolTypeID']);
?>
<script type="text/javascript">

	function checkEntry()
	{
		var schooltype=document.getElementById('schoolTypeName').value;
		
		
		
		if(schooltype=='')
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
											FUNDS
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">EDIT SCHOOL TYPE</th>								  									
								</tr>
								<tr>							
									<td>
										School type
										</td>
										<td>
											<input type="text" name="schoolTypeName" id="schoolTypeName" value="<?php echo $stype->schoolTypeName;?>" size="60">
										</td>
										
								</tr>
								
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=type_index'">        		
 						</div>
 						
 								<input type="hidden" name="schoolTypeID" value="<?php echo $stype->schoolTypeID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>