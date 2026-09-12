<?php
$unit="research";
$go="hei";
$task="department_save";
include_once("classes/middletier/research/college.class.php");

$college=new college();
$college->loadAll();
?>
<script type="text/javascript">

	function checkEntry()
	{
		var deptName=document.getElementById('deptName').value;
		var deptCode=document.getElementById('deptCode').value;		
		var collegeName=document.getElementById('collegeName').selectedIndex;
		var deptChair=document.getElementById('deptChair').value;	//nag.add
		
		if(deptName=='')
		{
			alert("No Name!");
			return false;
		}
		if(deptCode=='')
		{
			alert("No Name!");
			return false;
		}		
		if(collegeName==0)
		{
			alert("No Name!");
			return false;
		}		
		
		if(deptChair=='')
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
											department
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW DEPARTMENT</th>								  									
								</tr>
								<tr>							
									<td>
										Short Name
										</td>
										<td>
											<input type="text" name="deptCode" id="deptCode" value="" size="30">
										</td>										
								</tr>
								<tr>							
									<td>
										Department Name
										</td>
										<td>
											<input type="text" name="deptName" id="deptName" value="" size="60">
										</td>
										
								</tr>
								<!--nag.add-->
								<tr>							
									<td style="vertical-align:top;">
										College Name
										</td>
										<td>
											<select name="collegeName" id="collegeName">
												<option value="0">-SELECT-</option>
												<?php
													if($college->count > 0)
													{
														while($row=$college->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['collegeName'];?>"><?php echo $row['collegeName'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>
										
								</tr>
								<tr>							
									<td>
										Dept. Chair
										</td>
										<td>
											<input type="text" name="deptChair" id="deptChair" value="" size="60">
										</td>
										
								</tr>
								<!--end.add-->
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=department_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>