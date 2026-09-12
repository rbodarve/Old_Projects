<?php
$unit="msp";
$go="hei";
$task="faculty_saveEdit";
include_once("classes/middletier/msp/faculty.class.php");

$f=new faculty();
$f->load($_GET['facultyID']);

$facultyID=$_GET['facultyID'];
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
											Faculty
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
						
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">FACULTY INFORMATION</th>								  									
								</tr>
								<tr>							
									<td style="font-weight:normal;">
										Complete name : <span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $f->lastName.", ".$f->firstName." ".$f->middleName;?></span>
										</td>									
									<td  style="font-weight:normal;">
										Email:
										<span style="font-weight:bold;font-style:italic;padding-left:10px;">
									<?php echo $f->email;?></span>
										</td>											
								</tr>
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Address:
										
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $f->address;?></span>
										</td>										
								</tr>
								<tr>							
									<td  style="font-weight:normal;">
										Telephone #:
										<span style="font-weight:bold;font-style:italic;padding-left:10px;">
								<?php echo $f->telephone;?></span>
										</td>										
								
									<td  style="font-weight:normal;">
										Mobile:
										<span style="font-weight:bold;font-style:italic;padding-left:10px;">
								<?php echo $f->mobile;?></span>
										</td>										
								
									
								</tr>
								
								</table>
						
								
								<br>
						<div class="tabs" align="left"> 	
        						<ul class="tabNavigation"> 
         						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=education_index&facultyID=<?php echo $facultyID;?>" >Educational Background</a></li> 
         						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=affiliation_index&facultyID=<?php echo $facultyID;?>" >School Affiliation</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=seminars_index&facultyID=<?php echo $facultyID;?>" >Seminars & Training</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=project_index&facultyID=<?php echo $facultyID;?>" >Research Project</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=publication_index&facultyID=<?php echo $facultyID;?>" >Publications</a></li>									          						    
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=copyrights_index&facultyID=<?php echo $facultyID;?>" style="color:#ffffff;font-style:italic;" >Copyrights & patent</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=awards_index&facultyID=<?php echo $facultyID;?>" >Awards</a></li> 
          						    
           					 		
       				 			</ul> 
       				 	</div>
       				 	<div class="borderTab">   
       				 	<div align="right" class="action">
							
							<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=education_addNew&facultyID=<?php echo $_GET['facultyID'];?>" ><img src="images/new_f2.png" height="24px" width="24px" title="Add new "></a>
							
							</div>    				 	
       				 	<table class="list" cellpadding="2" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">#</th>
								  <th style="text-align:left;">
									Level
								  </th>
								  <th style="text-align:left;">
								  School
								  </th>
								  <th style="text-align:left;">
								  	Year Graduated
								  </th>
								  <th style="text-align:left;">
								  	Degree
								  </th>
								 <th style="text-align:left;">
								  	Awards
								  </th>								  
								    <th style="text-align:right;">
								  	Action
								  </th>
								</tr>
								
							
							</table>
       				 	 				 	       				 	       				 	      				 	       				 	
       				 	</div>
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=faculty_index'">        		
 						</div>
 								<input type="hidden" name="facultyID" value="<?php echo $f->facultyID;?>">
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>