<?php
$go="add";
$unit="pt";

include_once("classes/middletier/pt/training.class.php");
include("checkEntry.inc.php");

$training=new Training();
$training->loadAll();

?>

<script type="text/javascript">					
		 		  
	function deleteEntry(id) {	
   				var ans=confirm("Are you sure you want to delete this?");
    if(ans) {
    		window.location="?go=<?php echo $go;?>&unit=<?php echo $unit;?>&task=delete&training_id="+id;
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
											Trainings
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->									
							<?php include("search.inc.php")?>
							
							<table class="list" cellpadding="0" cellspacing="0" width="100%" cellpadding="1" cellspacing="0">
								<tr>
									
								  <th style="text-align:center;" width="10%">
								  	ID
								  </th>						
								  <th style="text-align:left;">
								  	Title
								  </th>	
								  <th style="text-align:left;" width="10%">
								  	Type
								  </th>	
								  <th style="text-align:left;" width="18%">
								  	Time Period
								  </th>	
								  <th style="text-align:left;">
								  	Venue
								  </th>	
								  <th width="10%">Action</th>
								</tr>
								<?php
								if($training->count > 0)
								{
								?>
								<tbody>
									<?php
										while($row=$training->result->FetchRow())
										{
									?>
									<tr>										
										<td style="text-align:center;">
										<?php echo $row['training_ID'];?>
										</td>
										<td>
										<?php echo $row['training_title'];?>
										</td>										
										<td>
										<?php echo $row['typ'];?>
										</td>										
										<td>
										<?php echo $row['start_date'];?> to <?php echo $row['end_date'];?> 
										</td>	
										<td>
										<?php echo $row['location'];?>, <?php echo $row['city'];?>
										</td>
										<td style="text-align:center;padding-right:5px;">
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=view&training_id=<?php echo $row['training_ID'];?>" ><img src="images/view.png" height="24px" width="24px" title="View"></a>
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=modify&training_id=<?php echo $row['training_ID'];?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a>
											<img src="images/cancel_f2.png" height="24px" width="24px" title="Delete" onclick="javascript:deleteEntry('<?php echo $row['training_ID'];?>');">
										</td>
									</tr>
									
									<?php
										}
									?>
								</tbody>
								<?php
								}
								?>
							
							
							</table>
						
						
						
						
						
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
	
	
	
  </div>	
  </div>
