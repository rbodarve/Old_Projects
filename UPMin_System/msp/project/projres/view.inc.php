<?php
$unit="msp";
$go="project";
include_once("classes/middletier/msp/project.class.php");
$proj=new projectResearch();
$proj->load($_GET['projectID']);
$projectID=$_GET['projectID'];
?>
<script type="text/javascript">					
		 		  
	function deleteEntry(id) {	
	
   				var ans=confirm("Are you sure you want to delete this?");
    if(ans) {
    		window.location="?go=<?php echo $go;?>&unit=<?php echo $unit;?>&task=proj_delete&projectID="+id;
    	}   	
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
										Project
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->																			
								<div class="myBorder">
								<table cellpadding="0" cellspacing="4" cellpadding="0" width="100%">
								
								<tr>
									<td width="10%" style="text-align:left;">Project name</td>
									<td width="40%" style="text-align:left;font-weight:bold;color:#000000"><?php echo $proj->projectName;?></td>
									<td width="10%" style="text-align:left;">Type</td>
									<td width="40%" style="text-align:left;font-weight:bold;color:#000000"><?php echo $proj->projectType;?></td>
								</tr>								
								<tr>
									<td style="text-align:left;">Fund</td>
									<td style="text-align:left;font-weight:bold;color:#000000"><?php echo $proj->fundName;?></td>
									<td style="text-align:left;">Budget</td>
									<td style="text-align:left;font-weight:bold;color:#000000"><?php echo number_format($proj->budget,2,".",",");?></td>
									
								</tr>								
								<tr>									
									<td style="text-align:left;">College</td>
									<td style="text-align:left;font-weight:bold;color:#000000"><?php echo $proj->collegeCode;?></td>
									<td style="text-align:left;">Status</td>
									<td style="text-align:left;font-weight:bold;color:#000000"><?php echo $proj->status;?></td>
								</tr>	
								<tr>									
									<td style="text-align:left;">Start date</td>
									<td style="text-align:left;font-weight:bold;color:#000000"><?php echo strftime("%b %d, %Y",strtotime($proj->startDate));?></td>
									<td style="text-align:left;">End</td>
									<td style="text-align:left;font-weight:bold;color:#000000"><?php echo strftime("%b %d, %Y",strtotime($proj->endDate));?></td>
								</tr>
								<tr>									
									<td style="text-align:left;">Remarks</td>
									<td style="text-align:left;font-weight:bold;color:#000000" colspan="3"><?php echo $proj->remarks;?></td>
									
								</tr>
								</table>
								</div>
								<div class="tabs" align="left"> 	
        						<ul class="tabNavigation"> 
         						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=projres_index&projectID=<?php echo $projectID;?>" style="color:#ffffff;font-style:italic;">Personnel</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=term_index&projectID=<?php echo $projectID;?>" >Progress</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=rebate_index&projectID=<?php echo $projectID;?>" >Publication</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=csi_index&projectID=<?php echo $projectID;?>" >Disbursement</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=promo_index&projectID=<?php echo $projectID;?>" >Notes</a></li>           						    
       				 			</ul> 
       				 			</div>
       				 			<div class="borderTab">   
       				 	<div align="right" class="action">
							
							<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=projres_addNew&projectID=<?php echo $_GET['projectID'];?>" ><img src="images/new_f2.png" height="24px" width="24px" title="Add new "></a>
							<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=projres_print" ><img src="images/printing.png" height="24px" width="24px" title="Print"></a>
							</div>    				 	
       				 	<table class="list" cellpadding="2" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">#</th>
								  <th style="text-align:left;">
									Completename
								  </th>
								  <th style="text-align:left;">
								  Position
								  </th>
								  <th style="text-align:left;">
								  	Date Employed
								  </th>
								  <th style="text-align:left;">
								  	Date Ended
								  </th>
								 <th style="text-align:left;">
								  	Company contact#
								  </th>
								  <th style="text-align:left;">
								  	Company Email
								  </th>
								 
								  <th style="text-align:left;">
								  	Status
								  </th>
								    <th style="text-align:right;">
								  	Action
								  </th>
								</tr>
								<tbody>
									
								</tbody>
							
							</table>
       				 	 				 	       				 	       				 	      				 	       				 	
       				 	</div>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>