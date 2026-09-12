<?php
$unit="research";
$go="researcher";
$task="faculty_saveEdit";
include_once("classes/middletier/research/faculty.class.php");
include_once("classes/middletier/research/department.class.php");

$d=new department();
$d->loadAll();
$f=new faculty();
$f->load($_GET['facultyID']);
?>
<script type="text/javascript">

	function checkEntry()
	{
		var lastName=document.getElementById('lastName').value;
		var firstName=document.getElementById('firstName').value;		
		var middleName=document.getElementById('middleName').value;	
		var deptCode=document.getElementById('deptCode').selectedIndex;	//nag.add
		var address=document.getElementById('address').value;		
		var contactNo=document.getElementById('contactNo').value;				
		var researcherCode=document.getElementById('researcherCode').value;	
		var specialty=document.getElementById('specialty').value;	//nag.add
		var salary=document.getElementById('salary').value;	//nag.add
		
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
			alert("No DepartmentCode!");
			return false;
		}	//nag.end
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
									<th colspan="2">EDIT FACULTY</th>								  									
								</tr>
								<tr>							
									<td>
										Researcher Code
										</td>
										<td>
											<input type="text" name="researcherCode" id="researcherCode" value="<?php echo $f->researcherCode;?>" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Last Name
										</td>
										<td>
											<input type="text" name="lastName" id="lastName" value="<?php echo $f->lastName;?>" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										First Name
										</td>
										<td>
											<input type="text" name="firstName" id="firstName" value="<?php echo $f->firstName;?>" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Middle Name
										</td>
										<td>
											<input type="text" name="middleName" id="middleName" value="<?php echo $f->middleName;?>" size="30">
										</td>										
								</tr>
								<tr>							
									<td style="vertical-align:top;">
										Department Code
										</td>
										<td>
											<select name="deptCode" id="deptCode">
												<option value="0">-SELECT-</option>
												<?php
													if($d->count > 0)
													{
														while($row=$d->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['deptCode'];?>" <?php if($d->deptCode==$row['deptCode']) echo "SELECTED";?>><?php echo $row['deptCode'];?></option>
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
											<textarea name="address" id="address" cols="60" rows="4"><?php echo $f->address;?></textarea>
										</td>										
								</tr>
								<tr>							
									<td>
										Contact #
										</td>
										<td>
											<input type="text" name="contactNo" id="contactNo" value="<?php echo $f->contactNo;?>" size="30">
										</td>
								</tr>							
									
								<tr>							
									<td>
										Specialty
										</td>
										<td>
											<input type="text" name="specialty" id="specialty" value="<?php echo $f->specialty;?>" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Salary
										</td>
										<td>
											<input type="text" name="salary" id="salary" value="<?php echo $f->salary;?>" size="30">
										</td>										
								</tr>
								<!--nag.end-->
								
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=faculty_index'">        		
 						</div>
 								<input type="hidden" name="facultyID" value="<?php echo $f->facultyID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>