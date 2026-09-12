<?php
$unit="research";
$go="funding";
$task="fundingagency_save";
?>
<script type="text/javascript">

	function checkEntry()
	{
		var fundagency=document.getElementById('agencyName').value;
		var address=document.getElementById('address').value;
		var address=document.getElementById('contactNo').value;
		var email=document.getElementById('email').value;
		var website=document.getElementById('website').value;
		var contactPerson=document.getElementById('contactPerson').value;
		
		if(fundagency=='')
		{
			alert("No Name!");
			return false;
		}
		if(address=='')
		{
			alert("No address!");
			return false;
		}
		if(contactNo=='')
		{
			alert("No Number!");
			return false;
		}
		if(email=='')
		{
			alert("No email!");
			return false;
		}
		if(website=='')
		{
			alert("No website!");
			return false;
		}
		if(contactPerson=='')
		{
			alert("No contact person!");
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
											FUNDING AGENCY
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW FUNDING AGENCY</th>								  									
								</tr>
								<tr>							
									<td>
										Agency Name
									</td>
										<td>
											<input type="text" name="agencyName" id="agencyName" value="" size="60">
										</td>
										
								</tr>
								<tr>							
									<td style="vertical-align:top;">
										Address
									</td>
										<td>
											<textarea name="address" id="address" rows="4" cols="60"></textarea>
										</td>
										
								</tr>
							
								<tr>							
									<td>
										Contact No
									</td>
										<td>
											<input type="text" name="contactNo" id="contactNo" value="" size="60">
										</td>
										
								</tr>
								<tr>							
									<td>
										Email Address
									</td>
										<td>
											<input type="text" name="email" id="email" value="" size="80">
										</td>
										
								</tr>
								<tr>
									<td>
										Website
									</td>
										<td>
											<input type="text" name="website" id="website" value="" size="60">
										</td>										
								</tr>		
								<tr>	
									<td>
                                                                                Contact Person
									</td>
										<td>
											<input type="text" name="contactPerson" id="contactPerson" value="" size="60">
										</td>
										
								</tr>
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=fundingagency_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>