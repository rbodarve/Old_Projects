<?php
$unit="msp";
$go="project";
$task="proj_saveEdit";

include_once("classes/middletier/msp/fund.class.php");
include_once("classes/middletier/msp/projstatus.class.php");
include_once("classes/middletier/msp/projecttype.class.php");
include_once("classes/middletier/msp/project.class.php");

$proj=new projectResearch();
$proj->load($_GET['projectID']);

$f=new fund();
$f->loadAll();
$ps=new projectStatus();
$ps->loadAll();
$pt=new projectType();
$pt->loadAll();
?>
<script type="text/javascript">

	function checkEntry()
	{
		var projectName=document.getElementById('projectName').value;
		var fundID=document.getElementById('fundID').selectedIndex;
		var budget=document.getElementById('budget').value;
		var col=document.getElementById('collegeCode').selectedIndex;
		var projType=document.getElementById('projTypeID').selectedIndex;
		var projStat=document.getElementById('projStatusID').selectedIndex;
		var remarks=document.getElementById('remarks').value;
		
		
		if(projectName=='')
		{
			alert("No project  name");
			return false;
		}
		if(fundID==0)
		{
			alert("No selected fund");
			return false;
		}
		if(budget=='')
		{
			alert("no budget");
			return false;
		}
		if(col==0)
		{
			alert("No college selected");
			return false;
		}
		if(projType==0)
		{
			alert("No project type");
			return false;
		}
		if(projStat==0)
		{
			alert("No project status selected");
			return false;
		}
		if(remarks=='')
		{
			alert("No remarks");
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
									<th colspan="2">ADD NEW PROJECT
									</th>								  									
								</tr>
								<tr>						
									<td>
										Project name
									</td>
										<td>
											<input type="text" name="projectName" id="projectName" value="<?php echo $proj->projectName;?>" size="60">
										</td>										
								</tr>
								<tr>
									<td>
										Project type
										</td>
										<td>
											<select name="projTypeID" id="projTypeID">
												<option value="0">-SELECT-</option>
												<?php
													if($pt->count > 0)
													{
														while($row=$pt->result->FetchRow())
														{
												?>
												<option value="<?php echo $row['projTypeID'];?>" <?php if($proj->projTypeID==$row['projTypeID']) echo "SELECTED";?> ><?php echo $row['projTypeName'];?></option>												
												<?php
														}
													}
												?>
											
											</select>
										</td>										
									</tr>
								
								
								<tr>
									<td>
										Funds
										</td>
										<td>
											<select name="fundID" id="fundID">
												<option value="0">-SELECT-</option>
												<?php
													if($f->count > 0)
													{
														while($row=$f->result->FetchRow())
														{
												?>
												<option value="<?php echo $row['fundID'];?>" <?php if($proj->fundID==$row['fundID']) echo "SELECTED";?>><?php echo $row['fundName'];?></option>												
												<?php
														}
													}
												?>
											
											</select>
										</td>										
								</tr>
								<tr>
									<td>
										Budget
										</td>
										<td>
											<input type="text" name="budget" id="budget" style="text-align:right;" value="<?php echo $proj->budget;?>">
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
												{										
											?>
											 <option value="<?php echo $college;?>" <?php if($college==$proj->collegeCode)echo "SELECTED";?>><?php echo $college;?></option>
											<?php
												}									
											?>																						
											</select>
										</td>										
									</tr>
								<tr>														
									<td>
										Starting date
									</td>
										<td>
											
										<input type="text" name="startDate"  id="startDate" value="<?php echo $proj->startDate;?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_startDate" title="Date selector" align="absmiddle" class="jscalimg"/>
									<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "startDate",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_startDate",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>																																																								
										</td>										
								</tr>
								<tr>						
									<td>
										End Date
									</td>
										<td>
											<input type="text" name="endDate"  id="endDate" value="<?php echo $proj->endDate;?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_endDate" title="Date selector" align="absmiddle" class="jscalimg"/>
									<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "endDate",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_endDate",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>		
										
										
										
										
										</td>										
								</tr>
								<tr>						
									<td>
										Status
									</td>
										<td>
											<select name="projStatusID" id="projStatusID">
												<option value="0">-SELECT-</option>
												<?php
													if($ps->count > 0)
													{
														while($row=$ps->result->FetchRow())
														{
												?>
												<option value="<?php echo $row['projStatusID'];?>" <?php if($row['projStatusID']==$proj->projStatusID) echo "SELECTED";?>><?php echo $row['projStatusName'];?></option>												
												<?php
														}
													}
												?>
											
											</select>
										</td>										
								</tr>
								<tr>						
									<td style="vertical-align:top">
										Remarks
									</td>
										<td>
											<textarea name="remarks" id="remarks" cols="60" rows="5"><?php echo $proj->remarks;?></textarea>
										</td>										
								</tr>
							
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=proj_index'">        		
       		 			</div>
       		 			<input type="hidden" name="projectID" value="<?php echo $proj->projectID;?>">
       		 			
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>