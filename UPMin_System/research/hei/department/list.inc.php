<?php
$unit="research";
$go="hei";
$task="department_addNew";
include_once("classes/middletier/research/department.class.php");
include_once("classes/middletier/setup/userrole.class.php");

$userRole=new userRole();

$d=new department();
$d->loadAll();
?>
<script type="text/javascript">					
		 		  
	function deleteEntry(id) {	
	
   				var ans=confirm("Are you sure you want to delete this?");
    if(ans) {
    		window.location="?go=<?php echo $go;?>&unit=<?php echo $unit;?>&task=department_delete&deptID="+id;
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
											Departments
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
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=department_addNew" ><img src="images/new_f2.png" height="24px" width="24px" title="Add"></a>
								<?php
                                                                                    }
                                                                ?>
								</div>
								
								<table class="list" cellpadding="0" cellspacing="0" width="100%">
								<tr>
                                                                  <th style="text-align:left;">#</th>
								  <th style="text-align:left;">
									Code
								  </th>								  
								  <th style="text-align:left;">
									Department
								  </th>		
								  <th style="text-align:left;">
									College Name
								  </th>		
								  <th style="text-align:left;">
									Dept. Chair
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
								if($d->count >0)
								{
									$count=1;
								
									while($row=$d->result->FetchRow())	
									{																
								?>	
									<tr>
										<td><?php echo $count;?></td>
										<td><?php echo $row['deptCode'];?></td>									
										<td><?php echo $row['deptName'];?></td>	
										<td><?php echo $row['collegeName'];?></td>	
										<td><?php echo $row['deptChair'];?></td>	
										<td style="text-align:right;padding-right:5px;">
                                                                                <?php
                                                                                    if($_SESSION['userType']==1){
                                                                                ?>
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=department_edit&deptID=<?php echo $row['deptID'];?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a>
											<img src="images/cancel_f2.png" height="24px" width="24px" title="Delete" onclick="javascript:deleteEntry('<?php echo $row['deptID'];?>');">
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