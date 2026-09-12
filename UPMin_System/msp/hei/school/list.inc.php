<?php
$unit="msp";
$go="hei";
include_once("classes/middletier/msp/school.class.php");

$s=new school();
$s->loadAll();

?>
<script type="text/javascript">					
		 		  
	function deleteEntry(id) {	
	
   				var ans=confirm("Are you sure you want to delete this?");
    if(ans) {
    		window.location="?go=<?php echo $go;?>&unit=<?php echo $unit;?>&task=school_delete&schoolID="+id;
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
											LIST OF SCHOOLS
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<div align="right" class="action">							
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=school_addNew" ><img src="images/new_f2.png" height="24px" width="24px" title="Add"></a>
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=school_print" ><img src="images/printing.png" height="24px" width="24px" title="Print"></a>
								</div>
								
								<table class="list" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">#</th>
								 <th style="text-align:left;">
									HEI Code
								  </th>		
								  <th style="text-align:left;">
									Short name
								  </th>								  
								  <th style="text-align:left;">
									School
								  </th>								  
								  <th style="text-align:left;">
									Type
								  </th>								  								  
								  </th>								  
								  <th style="text-align:right;">
								  	Action
								  </th>
									
								</tr>
								<tbody>
								<?php
								if($s->count > 0)
								{
									$count=1;
									while($row=$s->result->FetchRow())
									{
								?>
									<tr>
										<td style="text-align:left;"><?php echo $count;?></td>
										<td style="text-align:left;"><?php echo $row['heiCode']?></td>				
										<td style="text-align:left;"><?php echo $row['schoolCode']?></td>										
										<td style="text-align:left;"><?php echo $row['schoolName'];?></td>
										<td style="text-align:left;"><?php echo $row['schoolTypeName'];?></td>
										
										<td style="text-align:right;padding-right:5px;">
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=school_edit&schoolID=<?php echo $row['schoolID'];?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a>
											<img src="images/cancel_f2.png" height="24px" width="24px" title="Delete" onclick="javascript:deleteEntry('<?php echo $row['schoolID'];?>');">
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