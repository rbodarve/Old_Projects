<?php
$unit="research";
$go="researcher";
$task="personnel_saveEdit";

include_once("classes/middletier/research/personnel.class.php");
include_once("classes/middletier/research/college.class.php");

$college=new college();
$college->loadAll();
$p=new personnel();
$p->load($_GET['personnel_ID']);

?>
<script type="text/javascript">

	function checkEntry()
	{
		var lastName=document.getElementById('lastName').value;
		var firstName=document.getElementById('firstName').value;	
		var middleName=document.getElementById('middleName').value;
		var collegeCode=document.getElementById('collegeCode').selectedIndex;
		var email=document.getElementById('email').value;
		var contactNo=document.getElementById('contactNo').value;
		var salary=document.getElementById('salary').value;
		
		if(lastName=='')
		{
			alert("No Last Name!");
			return false;
		}
		if(firstName=='')
		{
			alert("No First Name!");
			return false;
		}	
		if(middleName=='')
		{
			alert("No Middle Name!");
			return false;
		}				
		if(collegeCode==0)
		{
			alert("No College Code!");
			return false;
		}		
		if(email=='')
		{
			alert("No Email!");
			return false;
		}	
		if(contactNo=='')
		{
			alert("No Contact No!");
			return false;
		}	
		
		if(salary=='')
		{
			alert("No Salary!");
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
											PERSONNEL
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">EDIT PERSONNEL</th>								  									
								</tr>
							<tr>							
									<td>
										Last Name
										</td>
										<td>
											<input type="text" name="lastName" id="lastName" value="<?php echo $p->lastName;?>" size="30">
										</td>
										
								</tr>
								<tr>							
									<td>
										First Name
										</td>
										<td>
											<input type="text" name="firstName" id="firstName" value="<?php echo $p->firstName;?>" size="60">
										</td>
										
								</tr>
								<tr>							
									<td>
										Middle Name
										</td>
										<td>
											<input type="text" name="middleName" id="middleName" value="<?php echo $p->middleName;?>" size="60">
										</td>
										
								</tr>
								<!--nag.add-->
								<tr>							
									<td style="vertical-align:top;">
										College Code
										</td>
										<td>
											<select name="collegeCode" id="collegeCode">
												<option value="0">-SELECT-</option>
												<?php
													if($college->count > 0)
													{
														while($row=$college->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['collegeCode'];?>" <?php if($college->collegeCode==$row['collegeCode']) echo "SELECTED";?>><?php echo $row['collegeCode'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>
										
								</tr>
		
								<tr>							
									<td>
										Email
										</td>
										<td>
											<input type="text" name="email" id="email" value="<?php echo $p->email;?>" size="60">
										</td>
								</tr>
								<tr>							
									<td>
										Contact No
										</td>
										<td>
											<input type="text" name="contactNo" id="contactNo" value="<?php echo $p->contactNo;?>" size="60">
										</td>										
								</tr>
																		
								<tr>							
									<td>
										Salary
										</td>
										<td>
											<input type="text" name="salary" id="salary" value="<?php echo $p->salary;?>" size="60">
										</td>										
								</tr>
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=personnel_index'">        		
 						</div>
 							<input type="hidden" name="personnel_ID" value="<?php echo $p->personnel_ID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>