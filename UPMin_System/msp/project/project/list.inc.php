<?php
$unit="msp";
$go="project";
include_once("classes/middletier/msp/project.class.php");
$proj=new projectResearch();
$proj->loadAll();
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
											List of  Projects
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<div align="right" class="action">							
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=proj_addNew" ><img src="images/new_f2.png" height="24px" width="24px" title="Add"></a>
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=proj_print" ><img src="images/printing.png" height="24px" width="24px" title="Print"></a>
								</div>
								
								<table class="list" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">#</th>
								  <th style="text-align:left;">
									Project Name
								  </th>								  
								  <th style="text-align:left;">
									Type
								  </th>								  								  							  
								  <th style="text-align:left;">
									Project Leader
								  </th>								  
								  <th style="text-align:left;">
									Fund
								  </th>								  
								  <th style="text-align:right;padding-right:5px;">
									Budget
								  </th>								  
								  <th style="text-align:left;">
									College
								  </th>								  
								  <th style="text-align:left;">
									Starting date
								  </th>								  
								  <th style="text-align:left;">
									End date
								  </th>								  
								  <th style="text-align:left;">
									Status
								  </th>								  								  							  
								  <th style="text-align:right;padding-right:5px;">
								  	Action
								  </th>
									
								</tr>
								<tbody>
								<?php
								if($proj->count > 0)
								{
									$count=1;
									while($row=$proj->result->FetchRow())
									{
								?>
									<tr>
										<td style="text-align:left;"><?php echo $count;?></td>
										<td style="text-align:left;"><?php echo $row['projectName'];?></td>
										<td style="text-align:left;"><?php echo $row['projTypeName'];?></td>
										<td style="text-align:left;"></td>
										<td style="text-align:left;"><?php echo $row['fundName'];?></td>
										<td style="text-align:right;padding-right:5px;"><?php echo number_format($row['budget'],2,".",",");?></td>										
										<td style="text-align:left;"><?php echo $row['collegeCode'];?></td>
										<td style="text-align:left;"><?php echo strftime("%b %d, %Y",strtotime($row['startDate']));?></td>
										<td style="text-align:left;"><?php echo strftime("%b %d, %Y",strtotime($row['endDate']));?></td>										
										<td style="text-align:left;"><?php echo $row['projStatusName'];?></td>
										<td style="text-align:right;padding-right:5px;">
										<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=projres_index&projectID=<?php echo $row['projectID'];?>" ><img src="images/info.png" height="24px" width="24px" title="Researcher"></a>
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=proj_edit&projectID=<?php echo $row['projectID'];?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a>
											<img src="images/cancel_f2.png" height="24px" width="24px" title="Delete" onclick="javascript:deleteEntry('<?php echo $row['projectID'];?>');">
										</td>
									</tr>
								
								<?php
									$count++;
									}
								}
								?>
								</tbody>
								
								</table>
								
								
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>