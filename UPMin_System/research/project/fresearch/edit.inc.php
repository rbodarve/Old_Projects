<?php
$unit="research";
$go="project";
$task="fresearch_saveEdit";
include_once("classes/middletier/research/fresearch.class.php");
include_once("classes/middletier/research/faculty.class.php");
include_once("classes/middletier/research/publication.class.php");
include_once("classes/middletier/research/fundingagency.class.php");
include_once("classes/middletier/research/journal.class.php");

$fundingagency=new fundingagency();
$fundingagency->loadAll();
$publication=new publication();
$publication->loadAll();
$journal=new journal();
$journal->loadAll();
$f=new faculty();
$f->loadAll();
$fr=new fresearch();
$fr->load($_GET['researchID']);

?>
<script type="text/javascript">

	function checkEntry()
	{
		var journalID=document.getElementById('journalID').value;
		var publicationID=document.getElementById('publicationID').selectedIndex;	
		var fundAgencyID=document.getElementById('fundAgencyID').selectedIndex;
		var startDate=document.getElementById('startDate').value;	
		var endDate=document.getElementById('endDate').value;
		var rtitle=document.getElementById('rtitle').value;
		var budget=document.getElementById('budget').value;
		var facultyID=document.getElementById('facultyID').selectedIndex;	
		
		if(publicationID==0)
		{
			alert("No Publisher!");
			return false;
		}	
		if(fundAgencyID==0)
		{
			alert("No Agency!");
			return false;
		}				
		if(startDate=='')
		{
			alert("No Start Date!");
			return false;
		}		
		if(endDate=='')
		{
			alert("No End Date!");
			return false;
		}		
		if(rtitle=='')
		{
			alert("No Title!");
			return false;
		}	
		if(budget=='')
		{
			alert("No Budget!");
			return false;
		}	
		if(facultyID==0)
		{
			alert("No Faculty!");
			return false;
		}	
                if(journalID==0)
		{
			alert("No Journal!");
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
											Research
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">EDIT RESEARCH</th>								  									
								</tr>
								<tr>							
									<td style="vertical-align:top;">
										Publisher
										</td>
										<td>
											<select name="publicationID" id="publicationID">
												<option value="0">-SELECT-</option>
												<?php
													if($publication->count > 0)
													{
														while($row=$publication->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['publicationID'];?>" <?php if($publication->publicationID==$row['publicationID']) echo "SELECTED";?>><?php echo $row['publisher'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>										
								</tr>
								<!--nag.add-->
								<tr>							
									<td>
									Research Title
										</td>
										<td>
											<input type="text" name="rtitle" id="rtitle" value="<?php echo $fr->rtitle;?>" size="60">
										</td>										
								</tr> 
								
								<tr>							
									<td style="vertical-align:top;">
										Funding Agency
										</td>
										<td>
											<select name="fundAgencyID" id="fundAgencyID">
												<option value="0">-SELECT-</option>
												<?php
													if($fundingagency->count > 0)
													{
														while($row=$fundingagency->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['fundAgencyID'];?>" <?php if($fundingagency->fundAgencyID==$row['fundAgencyID']) echo "SELECTED";?>><?php echo $row['agencyName'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>										
								</tr>
								<tr>							
									<td>
										Start Date
										</td>
										<td>
										 	<input type="text" name="startDate"  id="startDate" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
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
										 	<input type="text" name="endDate"  id="endDate" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
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
									Budget
										</td>
										<td>
											<input type="text" name="budget" id="budget" value="<?php echo $fr->budget;?>" size="60">
										</td>										
								</tr> 
									<tr>							
									<td style="vertical-align:top;">
										Faculty
										</td>
										<td>
											<select name="facultyID" id="facultyID">
												<option value="0">-SELECT-</option>
												<?php
													if($f->count > 0)
													{
														while($row=$f->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['facultyID'];?>" <?php if($f->facultyID==$row['facultyID']) echo "SELECTED";?>><?php echo $row['fullName'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>
										
								</tr>
                                                                <tr>							
									<td style="vertical-align:top;">
										Journal Title
										</td>
										<td>
											<select name="journalID" id="journalID">
												<option value="0">-SELECT-</option>
												<?php
													if($journal->count > 0)
													{
														while($row=$journal->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['journalID'];?>" <?php if($journal->journalID==$row['journalID']) echo "SELECTED";?>><?php echo $row['journalTitle'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>										
								</tr>
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=fresearch_index'">        		
 						</div>
 								<input type="hidden" name="researchID" value="<?php echo $fr->researchID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>