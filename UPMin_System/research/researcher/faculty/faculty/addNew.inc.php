<?php
$unit="research";
$go="researcher";
$task="faculty_save";
include_once("classes/middletier/research/department.class.php");

$d=new department();
$d->loadAll();
?>
<script type="text/javascript">

	function checkEntry()
	{
		var lastName=document.getElementById('lastName').value;
		var firstName=document.getElementById('firstName').value;		
		var middleName=document.getElementById('middleName').value;
		var deptCode=document.getElementById('deptCode').selectedIndex; //nag.add
		var address=document.getElementById('address').value;		
		var contactNo=document.getElementById('contactNo').value;				
		var researcherCode=document.getElementById('researcherCode').value;	
		var specialty=document.getElementById('specialty').value; //nag.Add
		var salary=document.getElementById('salary').value; //nag.add
		
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
		//nag.add
		if(deptCode==0)
		{
			alert("No deptCode!");
			return false;
		}
		//nag.end
		if(address=='')
		{
			alert("No address!");
			return false;
		}		
		if(contactNo=='')
		{
			alert("No phone!");
			return false;
		}		
		//nag.add
		if(specialty=='')
		{
			alert("No specialty!");
			return false;
		}
		if(salary=='')
		{
			alert("No salary!");
			return false;
		}
		//nag.end		
		
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
										Researcher Code
										</td>
										<td>
											<input type="text" name="researcherCode" id="researcherCode" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Last Name
										</td>
										<td>
											<input type="text" name="lastName" id="lastName" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										First Name
										</td>
										<td>
											<input type="text" name="firstName" id="firstName" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Middle Name
										</td>
										<td>
											<input type="text" name="middleName" id="middleName" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td style="vertical-align:top;">
										Department Code
										</td>
										<td>
											<select name="fundAgencyID" id="fundAgencyID">
												<option value="0">-SELECT-</option>
												<?php
													if($d->count > 0)
													{
														while($row=$d->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['deptCode'];?>"><?php echo $row['deptCode'];?></option>
												<?php
														}
													}
												?>
											</select>
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
										Contact #
										</td>
										<td>
											<input type="text" name="contactNo" id="contactNo" value="" size="30">
										</td>										
								</tr>
								
								<!--nag.add-->
								<tr>							
									<td>
										Specialty
										</td>
										<td>
											<input type="text" name="specialty" id="specialty" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Salary
										</td>
										<td>
											<input type="text" name="salary" id="salary" value="" size="30">
										</td>										
								</tr>
								<!--nag.end-->
								
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