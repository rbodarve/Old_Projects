<?php
$unit="research";
$go="project";
$task="publication_saveEdit";
include_once("classes/middletier/research/publication.class.php");

$pu=new publication();
$pu->load($_GET['publicationID']);

?>
<script type="text/javascript">

	function checkEntry()
	{
		var title=document.getElementById('title').value;
		var publisher=document.getElementById('publisher').value;	
		var volumeNo=document.getElementById('volumeNo').value;
		var edition=document.getElementById('edition').value;
	
		if(title=='')
		{
			alert("No Title!");
			return false;
		}				
		if(publisher=='')
		{
			alert("No Publisher!");
			return false;
		}		
		if(volumeNo=='')
		{
			alert("No Volume No!");
			return false;
		}	
		if(edition=='')
		{
			alert("No edition");
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
											PUBLICATION
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">EDIT PUBLICATION</th>								  									
								</tr>
								<tr>							
									<td>
										Title
										</td>
										<td>
											<input type="text" name="title" id="title" value="<?php echo $pu->title;?>" size="60">
										</td>										
								</tr>
								<tr>							
									<td>
										Publisher
										</td>
										<td>
											<input type="text" name="publisher" id="publisher" value="<?php echo $pu->publisher;?>" size="60">
										</td>										
								</tr>
								<tr>							
									<td>
										Volume #
										</td>
										<td>
											<input type="text" name="volumeNo" id="volumeNo" value="<?php echo $pu->volumeNo;?>" size="60">
										</td>										
								</tr> 
								<tr>							
									<td>
										Edition
										</td>
										<td>
											<input type="text" name="edition" id="edition" value="<?php echo $pu->edition;?>" size="60">
										</td>										
								</tr> 
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=publication_index'">        		
 						</div>
 								<input type="hidden" name="publicationID" value="<?php echo $pu->publicationID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>