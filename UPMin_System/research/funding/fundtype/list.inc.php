<?php
$unit="research";
$go="funding";
include_once("classes/middletier/research/fundtype.class.php");
include_once("classes/middletier/setup/userrole.class.php");

$userRole=new userRole();
$fundtype=new fundType();
$fundtype->loadAll();
?>
<script type="text/javascript">					
		 		  
	function deleteEntry(id){
            var ans=confirm("Are you sure you want to delete this?");
            if(ans){
    		window.location="?go=<?php echo $go;?>&unit=<?php echo $unit;?>&task=fundtype_delete&fundTypeID="+id;
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
											Type Of Funds
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
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=fundtype_addNew" ><img src="images/new_f2.png" height="24px" width="24px" title="Add"></a>
                                                                <?php
                                                                                    }
                                                                ?>
								</div>								
								<table class="list" cellpadding="0" cellspacing="0" width="100%">
								<tr>
                                                                  <th style="text-align:left;">#</th>
								  <th style="text-align:left;">
                                                                        Type of Funds
								  </th>								  
								  <th style="text-align:right;">   
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
								if($fundtype->count > 0)
								{
									$count=1;
									while($row=$fundtype->result->FetchRow())
									{
								?>
									<tr>
										<td style="text-align:left;"><?php echo $count;?></td>
										<td style="text-align:left;"><?php echo $row['fundTypeName'];?></td>
										<td style="text-align:right;padding-right:5px;">
                                                                                <?php
                                                                                    if($_SESSION['userType']==1){
                                                                                ?>
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=fundtype_edit&fundTypeID=<?php echo $row['fundTypeID'];?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a>
											<img src="images/cancel_f2.png" height="24px" width="24px" title="Delete" onclick="javascript:deleteEntry('<?php echo $row['fundTypeID'];?>');">
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