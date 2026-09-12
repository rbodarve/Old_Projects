<?php
$unit="msp";
$go="hei";
$task="scolleges_save";
include_once("classes/middletier/msp/college.class.php");

$c=new college();
$c->loadAll();
?>
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
											SELECT COLLEGE
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="list" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">Code</th>								  									
									<th style="text-align:left;">College</th>								  									
									<th style="text-align:right;padding-right:10px;">Select</th>								  									
								</tr>
								<?PHP 
								 if($c->count > 0)
								 {
								 	while($row=$c->result->FetchRow())
								 	{
								?>												
								<tr>							
										<td style="text-align:left;">
										<?php echo $row['collegeCode'];?>
										</td>
										<td style="text-align:left;">
										<?php echo $row['collegeName'];?>
										</td>
										<td style="text-align:right;padding-right:5px;">
											<input type="checkbox" name="colleges[]" value="<?php echo $row['collegeID'];?>">
										</td>
										
									</tr>
								<?php
									 }
									} 
								?>
																											
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=scolleges_index&schoolID=<?php echo $_GET['schoolID'];?>'">        		
 						</div>
 								<input type="hidden" name="schoolID" value="<?php echo $_GET['schoolID'];?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>