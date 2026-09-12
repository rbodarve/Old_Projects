<?php
$unit="research";
$go="project";
$task="journal_saveEdit";
include_once("classes/middletier/research/journal.class.php");
include_once("classes/middletier/research/publication.class.php");

$publication=new publication();
$publication->loadAll();
$j=new journal();
$j->load($_GET['journalID']);

?>
<script type="text/javascript">

	function checkEntry()
	{
		
		var journalTitle=document.getElementById('journalTitle').value;
		var ISSN=document.getElementById('ISSN').value;
		var volume=document.getElementById('volume').value;	
		var editor=document.getElementById('editor').value;
		var datePublished=document.getElementById('datePublished').value;
		var publicationID=document.getElementById('publicationID').selectedIndex;
		var issue=document.getElementById('issue').value;
		
		if(ISSN=='')
		{
			alert("No ISSN!");
			return false;
		}				
		if(volume=='')
		{
			alert("No volume!");
			return false;
		}		
		if(editor=='')
		{
			alert("No Editor!");
			return false;
		}		
		if(datePublished=='')
		{
			alert("No Date!");
			return false;
		}	
		if(publicationID==0)
		{
			alert("No Publication ID!");
			return false;
		}		
		if(journalTitle=='')
		{
			alert("No Journal Title!");
			return false;
		}		
		if(issue=='')
		{
			alert("No issue");
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
										JOURNALS
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">EDIT JOURNALS</th>								  									
								</tr>
													
								<tr>							
									<td>
										ISSN
										</td>
										<td>
											<input type="text" name="ISSN" id="ISSN" value="<?php echo $j->ISSN;?>" size="60">
										</td>										
								
								<tr>							
									<td>
										Volume #
										</td>
										<td>
											<input type="text" name="volume" id="volume" value="<?php echo $j->volume;?>" size="60">
										</td>										
								</tr> 
								<tr>							
									<td>
										Editor
										</td>
										<td>
											<input type="text" name="editor" id="editor" value="<?php echo $j->editor;?>" size="60">
										</td>										
								</tr> 
								<tr>							
									<td>
									Date Published
										</td>
										<td>
										 	<input type="text" name="datePublished"  id="datePublished" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_datePublished" ISSN="Date selector" align="absmiddle" class="jscalimg"/>
									<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "datePublished",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_datePublished",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>	
										</td>												
								</tr> 
								<tr>							
									<td style="vertical-align:top;">
										Publication ID
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
											
														<option value="<?php echo $row['publicationID'];?>"><?php echo $row['publicationID'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>
										
								</tr>
								<tr>							
									<td>
										Journal Title
										</td>
										<td>
											<input type="text" name="journalTitle" id="journalTitle" value="<?php echo $j->journalTitle;?>" size="60">
										</td>										
								</tr> 
								<tr>							
									<td>
										Issue
										</td>
										<td>
											<input type="text" name="issue" id="issue" value="<?php echo $j->issue;?>" size="60">
										</td>										
								</tr> 
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=journal_index'">        		
 						</div>
 								<input type="hidden" name="journalID" value="<?php echo $j->journalID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>