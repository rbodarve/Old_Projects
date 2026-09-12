<?php
$unit="msp";
$go="hei";
$task="school_save";
include_once("classes/middletier/msp/schooltype.class.php");


$st=new schoolType();
$st->loadAll();
?>
<script type="text/javascript">

	function checkEntry()
	{
		var schoolCode=document.getElementById('schoolCode').value;
		var schoolTypeID=document.getElementById('schoolTypeID').selectedIndex;
		var schoolName=document.getElementById('schoolName').value;
		var address=document.getElementById('address').value;
		var telephone=document.getElementById('telephone').value;
		var fax=document.getElementById('fax').value;
		var mobile=document.getElementById('mobile').value;
		var email=document.getElementById('email').value;
		var website=document.getElementById('website').value;
		var heiCode=document.getElementById('heiCode').value;
		
		if(heiCode=='')
		{
			alert("No HEI Code.");
			return false;
		}
		if(schoolCode=='')
		{
			alert("No short name");
			return false;
		}
		if(schoolTypeID==0)
		{
			alert("No type selected");
			return false;
		}
		if(schoolName=='')
		{
			alert("No name");
			return false;
		}
		if(address=='')
		{
			alert("No address");
			return false;
		}
		if(fax=='')
		{
			alert("No fax");
			return false;
		}
		if(telephone=='')
		{
			alert("No telephone #");
			return false;
		}
		if(mobile=='')
		{
			alert("No mobile #");
			return false;
		}
		if(email=='')
		{
			alert("No email");
			return false;
		}
		if(website=='')
		{
			alert("No website");
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
											SCHOOL
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW SCHOOL</th>								  									
								</tr>
								<tr>							
									<td>
										Short name
										</td>
										<td>
											<input type="text" name="schoolCode" id="schoolCode" value="" size="30">
										</td>
										
								</tr>
								<tr>							
									<td>
										Name
										</td>
										<td>
											<input type="text" name="schoolName" id="schoolName" value="" size="60">
										</td>
										
								</tr>
								<tr>							
									<td style="vertical-align:top;">
										Type
										</td>
										<td>
											<select name="schoolTypeID" id="schoolTypeID">
												<option value="0">-SELECT-</option>
												<?php
													if($st->count > 0)
													{
														while($row=$st->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['schoolTypeID'];?>"><?php echo $row['schoolTypeName'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>
										
								</tr>
								<tr>							
									<td>
										HEI Code
										</td>
										<td>
											<input type="text" name="heiCode" id="heiCode" value="" size="30">
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
											<input type="text" name="telephone" id="telephone" value="" size="30" >
										</td>										
								</tr>	
								<tr>							
									<td>
										Fax #
										</td>
										<td>
											<input type="text" name="fax" id="fax" value="" size="30" >
										</td>										
								</tr>	
								<tr>							
									<td>
										Mobile #
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
											<input type="text" name="email" id="email" value="" size="30">
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
																											
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=school_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>