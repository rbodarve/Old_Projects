<?php
$unit="research";
$go="project";
$task="fresearch_addNew";
include_once("classes/middletier/research/fresearch.class.php");
include_once("classes/middletier/setup/userrole.class.php");

$userRole=new userRole();

$fr=new fresearch();
$fr->loadAll();
?>
<script type="text/javascript">					
		 		  
	function deleteEntry(id) {	
	
   				var ans=confirm("Are you sure you want to delete this?");
    if(ans) {
    		window.location="?go=<?php echo $go;?>&unit=<?php echo $unit;?>&task=fresearch_delete&researchID="+id;
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
											RESEARCH
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
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=fresearch_addNew" ><img src="images/new_f2.png" height="24px" width="24px" title="Add"></a>
                                                                <?php
                                                                                   }
                                                                ?>
								</div>
								
								<table class="list" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">#</th>	
									<th style="text-align:left;">
									Research Title
								  </th>		
								   <th style="text-align:left;">
									Full Name
								  </th>
								   <th style="text-align:left;">
									Publisher
								  </th>		
								   <th style="text-align:left;">
									Journal Title
								  </th>									 								 
								  <th style="text-align:left;">
									Agency
								  </th>		
								   <th style="text-align:left;">
									Budget
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
								if($fr->count >0)
								{
									$count=1;
								
									while($row=$fr->result->FetchRow())	
									{																
								?>	
									<tr>
										<td><?php echo $count;?></td>
										<td><?php echo $row['rtitle'];?></td>
										<td><?php echo $row['firstName'];?>&nbsp<?php echo $row['middleName'];?>&nbsp<?php echo $row['lastName'];?></td>
										<td><?php echo $row['publisher'];?></td>
										<td><?php echo $row['journalTitle'];?></td>																														
										<td><?php echo $row['agencyName'];?></td>								
										<td><?php echo $row['budget'];?></td>																						
                                                                                <td style="text-align:right;padding-right:5px;">
                                                                                        <?php
                                                                                            if($_SESSION['userType']==1){
                                                                                        ?>
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=fresearch_edit&researchID=<?php echo $row['researchID'];?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a>
											<img src="images/cancel_f2.png" height="24px" width="24px" title="Delete" onclick="javascript:deleteEntry('<?php echo $row['researchID'];?>');">
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