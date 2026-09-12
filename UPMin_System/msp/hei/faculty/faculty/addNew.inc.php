<?php
$unit="msp";
$go="hei";
$task="faculty_save";
//include_once("classes/middletier/msp/fundagency.class.php");

?>
<script type="text/javascript">

	function checkEntry()
	{
		var lastName=document.getElementById('lastName').value;
		var firstName=document.getElementById('firstName').value;		
		var middleName=document.getElementById('middleName').value;		
		var address=document.getElementById('address').value;		
		var telephone=document.getElementById('telephone').value;				
		var mobile=document.getElementById('mobile').value;		
		var email=document.getElementById('email').value;		
		var researcherCode=document.getElementById('researcherCode').value;	
		
		if(researcherCode=='')
		{
			alert("No Researcher Code.");
			return false;
		}
		if(lastName=='')
		{
			alert("No lastName!");
			return false;
		}
		if(firstName=='')
		{
			alert("No firstName!");
			return false;
		}		
		if(middleName=='')
		{
			alert("No middleName!");
			return false;
		}		
		if(address=='')
		{
			alert("No address!");
			return false;
		}		
		if(telephone=='')
		{
			alert("No phone!");
			return false;
		}		
		if(mobile=='')
		{
			alert("No mobile phone!");
			return false;
		}		
		if(email=='')
		{
			alert("No email!");
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
											Faculty
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW FACULTY</th>								  									
								</tr>
								<tr>							
									<td>
										Researcher code
										</td>
										<td>
											<input type="text" name="researcherCode" id="researcherCode" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Lastname
										</td>
										<td>
											<input type="text" name="lastName" id="lastName" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Firstname
										</td>
										<td>
											<input type="text" name="firstName" id="firstName" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Middlename
										</td>
										<td>
											<input type="text" name="middleName" id="middleName" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td style="vertical-align:top;">
										Address
										</td>
										<td>
											<textarea name="address" id="address" cols="60" rows="4"></textarea>
										</td>										
								</tr>
								<tr>							
									<td>
										Telephone #
										</td>
										<td>
											<input type="text" name="telephone" id="telephone" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Mobile
										</td>
										<td>
											<input type="text" name="mobile" id="mobile" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Email
										</td>
										<td>
											<input type="text" name="email" id="email" value="" size="60">
										</td>										
								</tr>
								
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=faculty_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>