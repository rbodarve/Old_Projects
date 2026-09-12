<?php
$unit="research";
$go="hei";
$task="college_save";
//include_once("classes/middletier/research/fundagency.class.php");
include_once("classes/middletier/research/campus.class.php");

$campus=new campus();
$campus->loadAll();
?>
<script type="text/javascript">

	function checkEntry()
	{
		var collegeName=document.getElementById('collegeName').value;
		var collegeCode=document.getElementById('collegeCode').value;	
		var campusName=document.getElementById('campusName').selectedIndex;
		var dean=document.getElementById('dean').value;	
		
		if(collegeName=='')
		{
			alert("No Name!");
			return false;
		}
		if(collegeCode=='')
		{
			alert("No Name!");
			return false;
		}	
		if(campusName==0)
		{
			alert("No Name!");
			return false;
		}				
		if(dean=='')
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
											COLLEGE
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW COLLEGE</th>								  									
								</tr>
								<tr>							
									<td>
										Short Name
										</td>
										<td>
											<input type="text" name="collegeCode" id="collegeCode" value="" size="30">
										</td>
										
								</tr>
								<tr>							
									<td>
										College Name
										</td>
										<td>
											<input type="text" name="collegeName" id="collegeName" value="" size="60">
										</td>
										
								</tr>
								<!--nag.add-->
							<tr>							
									<td style="vertical-align:top;">
										Campus Name
										</td>
										<td>
											<select name="campusName" id="campusName">
												<option value="0">-SELECT-</option>
												<?php
													if($campus->count > 0)
													{
														while($row=$campus->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['campusName'];?>" <?php if($campus->campusName==$row['campusName']) echo "SELECTED";?>><?php echo $row['campusName'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>
										
								</tr>
								<tr>							
									<td>
										Dean
										</td>
										<td>
											<input type="text" name="dean" id="dean" value="" size="60">
										</td>										
								</tr>
						<!--		<tr>							
									<td>
										Phone #
										</td>
										<td>
											<input type="text" name="phoneNo" id="phoneNo" value="" size="60">
										</td>										
								</tr> -->
								<!--nag.end-->
								
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=college_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>