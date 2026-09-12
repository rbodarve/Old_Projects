<?php
$unit="research";
$go="project";
$task="publication_addNew";
include_once("classes/middletier/research/publication.class.php");
include_once("classes/middletier/setup/userrole.class.php");

$userRole=new userRole();

$publication=new publication();
$publication->loadAll();
?>
<script type="text/javascript">					
		 		  
	function deleteEntry(id) {	
	
   				var ans=confirm("Are you sure you want to delete this?");
    if(ans) {
    		window.location="?go=<?php echo $go;?>&unit=<?php echo $unit;?>&task=publication_delete&publicationID="+id;
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
											PUBLICATIONS
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<div align="right" class="action">							
                                                                <?php
                                                                                    if($_SESSION['userType']==1){
                                                                ?>
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=publication_addNew" ><img src="images/new_f2.png" height="24px" width="24px" title="Add"></a>
								<?php
                                                                                    }
                                                                ?>
								</div>
								
								<table class="list" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">#</th>
								  <th style="text-align:left;">
									Volume No
								  </th>								  
								  <th style="text-align:left;">
									Title
								  </th>	
									<!--Nag.add-->
								  <th style="text-align:left;">
									Publisher
								  </th>		
								  <th style="text-align:right;padding-right:5px;">
                                                                  <?php
                                                                                    if($_SESSION['userType']==1){
                                                                  ?>
								  	Action
                                                                  <?php
                                                                                    }
                                                                  ?>
								  </th>
									
								</tr>
								<tbody>
								<?php
								if($publication->count >0)
								{
									$count=1;
								
									while($row=$publication->result->FetchRow())	
									{																
								?>	
									<tr>
										<td><?php echo $count;?></td>
										<td><?php echo $row['volumeNo'];?></td>									
										<td><?php echo $row['title'];?></td>	
                                                                                <td><?php echo $row['publisher'];?></td>									
										<td style="text-align:right;padding-right:5px;">
                                                                                <?php
                                                                                    if($_SESSION['userType']==1){
                                                                                ?>
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=publication_view&publicationID=<?php echo $row['publicationID'];?>" ><img src="images/view.png" height="24px" width="24px" title="View details"></a> 
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=publication_edit&publicationID=<?php echo $row['publicationID'];?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a>
											<img src="images/cancel_f2.png" height="24px" width="24px" title="Delete" onclick="javascript:deleteEntry('<?php echo $row['publicationID'];?>');">
                                                                                <?php
                                                                                    }
                                                                                ?>
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