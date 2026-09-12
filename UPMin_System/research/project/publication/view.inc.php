<?php
$unit="research";
$go="project";
//$task="publication_edit";
include_once("classes/middletier/research/publication.class.php");

$pu=new publication();
//$f->loadAll();
$pu->load($_GET['publicationID']);

$publicationID=$_GET['publicationID'];
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
									<th colspan="2">PUBLICATION INFORMATION</th>								  									
								</tr>
								<td  style="font-weight:normal;">
										Edition:
										<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $pu->edition;?></span>
										</td>		
								<tr>		
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Title:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $pu->title;?></span>
										</td>										
								</tr>
									<td style="font-weight:normal;">
										Publisher : 
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $pu->publisher;?></span>
										</td>		
								</tr>
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Volume No:
										<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $pu->volumeNo;?></span>
									</td>										
								</tr>
								
								
								
						</div>		
						
						<td style="text-align:right;padding-right:5px;">				    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=publication_index'">        		
								<input type="hidden" name="publicationID" value="<?php echo $pu->publicationID;?>">
						<!-- end of contents -->
					
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>