<?php
$unit="msp";
$go="funding";
$task="fundtype_saveEdit";
include_once("classes/middletier/msp/fundtype.class.php");

$fundtype=new fundType();
$fundtype->load($_GET['fundTypeID']);
?>
<script type="text/javascript">

	function checkEntry()
	{
		var fundtype=document.getElementById('fundTypeName').value;
		
		
		
		if(fundtype=='')
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
											TYPE OF FUNDS
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW TYPE OF FUNDS</th>								  									
								</tr>
								<tr>							
										<td>
										Name
										</td>
										<td>
											<input type="text" name="fundTypeName" id="fundTypeName" value="<?php echo $fundtype->fundTypeName;?>" size="60">
										</td>
										
									</tr>
								
							
								</table>
								<div align="right">
       		 						<input type="submit" name="save" value="Save" > 					    		 			
       		 						<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=fundtype_index'">        		
 								</div>
 								<input type="hidden" name="fundTypeID" value="<?php echo $fundtype->fundTypeID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>