<?php
$unit="research";
$go="project";
//$task="journal_edit";
include_once("classes/middletier/research/journal.class.php");

$j=new journal();
//$f->loadAll();
$j->load($_GET['journalID']);

$journalID=$_GET['journalID'];
?>
<script type="text/javascript">

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
											Journal
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
									<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
						
							<table class="form" cellpadding="0" cellspacing="0" width="100%"> 
								<tr>
									<th colspan="2">JOURNAL INFORMATION</th>								  									
								</tr>
								<td  style="font-weight:normal;">
										Journal ID:
										<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $j->journalID;?></span>
										</td>		
								<tr>		
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										 Journal Title:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $j->journalTitle;?></span>
										</td>										
								</tr>
									<td style="font-weight:normal;">
										ISSN:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $j->ISSN;?></span>
										</td>		
								</tr>
								</tr>
									<td style="font-weight:normal;">
										Date Published:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $j->datePublished;?></span>
										</td>		
								</tr>
								</tr>
									<td style="font-weight:normal;">
										Volume:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $j->volume;?></span>
										</td>		
								</tr>
								</tr>
									<td style="font-weight:normal;">
										Editor:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $j->editor;?></span>
										</td>		
								</tr>
								</tr>
									<td style="font-weight:normal;">
										Publication ID:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $j->publicationID;?></span>
										</td>		
								</tr>
								</tr>
									<td style="font-weight:normal;">
										Issue:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $j->issue;?></span>
										</td>		
								</tr>
																
						</div>		
						
						<td style="text-align:right;padding-right:5px;">				    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=journal_index'">        		
								<input type="hidden" name="journalID" value="<?php echo $j->journalID;?>">
						<!-- end of contents -->
					
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>