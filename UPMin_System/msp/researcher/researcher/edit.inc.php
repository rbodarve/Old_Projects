<?php
$unit="msp";
$go="researcher";
$task="res_save";

include_once("classes/middletier/msp/researchertype.class.php");
include_once("classes/middletier/msp/researcher.class.php");


$res=new researcher();
$res->load($_GET['researcherID']);
$resType=new researcherType();
$resType->loadAll();
?>
<script type="text/javascript">

	function checkEntry()
	{
		var idNumber=document.getElementById('idNumber').value;
		var res=document.getElementById('researcherName').value;
		var resT=document.getElementById('resTypeID').selectedIndex;
		var col=document.getElementById('collegeCode').selectedIndex;
		var email=document.getElementById('emailAddress').value;
		var mom=document.getElementById('mobilePhone').value;
		var tel=document.getElementById('telephone').value;
		
		
		if(idNumber=='')
		{
			alert("No ID#!");
			return false;
		}
		if(res=='')
		{
			alert("No Researcher name");
			return false;
		}
		if(resT==0)
		{
			alert("Type of researcher not selected");
			return false;
		}
		if(col==0)
		{
			alert("No college selected");
			return false;
		}
		if(email=='')
		{
			alert("No Email");
			return false;
		}
		if(mom=='')
		{
			alert("No Mobile phone");
			return false;
		}
		if(tel=='')
		{
			alert("No Telephone number");
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
											Type of Research
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW RESEARCHER</th>								  									
								</tr>
								<tr>						
									<td>
										ID Number
									</td>
										<td>
											<input type="text" name="idNumber" id="idNumber" value="<?php echo $res->idNumber;?>" size="15">
										</td>										
									</tr>
								<tr>
									<td>
										Name
										</td>
										<td>
											<input type="text" name="researcherName" id="researcherName" value="<?php echo $res->researcherName;?>" size="60">
										</td>										
									</tr>
								<tr>
									<td>
										Type of Researcher
										</td>
										<td>
											<select name="resTypeID" id="resTypeID">
											<option value="0">-SELECT-</option>
											<?php
											 if($resType->count > 0)
											 {
											 	while($row=$resType->result->FetchRow())
											 	{
											 
											?>
											 <option value="<?php echo $row['resTypeID'];?>" <?php if($row['resTypeID']=$res->resTypeID) echo "SELECTED";?>><?php echo $row['resType'];?></option>
											<?php
												}
											 }
											?>																						
											</select>
										</td>										
									</tr>
								<tr>
									<td>
										College
										</td>
										<td>
											<select name="collegeCode" id="collegeCode">
											<option value="0">-SELECT-</option>
											<?php
											
												foreach ($COLLEGECODE as $college)
												{											 											?>
											 <option value="<?php echo $college;?>" <?php if($college=$res->collegeCode) echo "SELECTED";?>><?php echo $college;?></option>
											<?php
												}									
											?>																						
											</select>
										</td>										
									</tr>
								<tr>						
									<td>
										Email Address
									</td>
										<td>
											<input type="text" name="emailAddress" id="emailAddress" value="<?php echo $res->emailAddress;?>" size="80">
										</td>										
								</tr>
								<tr>						
									<td>
										Mobile Phone #
									</td>
										<td>
											<input type="text" name="mobilePhone" id="mobilePhone" value="<?php echo $res->mobilePhone;?>" size="45">
										</td>										
								</tr>
								<tr>						
									<td>
										Telephone #
									</td>
										<td>
											<input type="text" name="telephone" id="telephone" value="<?php echo $res->telephone;?>" size="45">
										</td>										
								</tr>
							
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=res_index'">        		
 						</div>
 							<input type="hidden" name="researcherID" value="<?php echo $res->researcherID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>