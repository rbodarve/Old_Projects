<?php
$unit="research";
$go="researcher";
//$task="personnel_edit";
include_once("classes/middletier/research/personnel.class.php");

$p=new personnel();
//$p->loadAll();
$p->load($_GET['personnel_ID']);

$personnel_ID=$_GET['personnel_ID'];
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
											PERSONNEL
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
									<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
						
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">PERSONNEL INFORMATION</th>								  									
								</tr>
								<tr>							
									<td style="font-weight:normal;">
										Complete Name : <span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $p->lastName.", ".$p->firstName." ".$p->middleName;?></span>
										</td>		
								</tr>
								<tr>
									<td  style="font-weight:normal;">
										College
										<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $p->collegeCode;?></span>
										</td>											
								</tr>
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Email
										
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $p->email;?></span>
										</td>										
								</tr>
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Contact #:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $p->contactNo;?></span>
										</td>										
								</tr>
								
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Salary:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $p->salary;?></span>
										</td>										
								</tr>
						</div>		
						
						<td style="text-align:right;padding-right:5px;">				    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=personnel_index'">        		
								<input type="hidden" name="personnel_ID" value="<?php echo $p->personnel_ID;?>">
						<!-- end of contents -->
					
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>