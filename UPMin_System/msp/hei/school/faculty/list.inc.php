<?php
$unit="msp";
$go="hei";
$task="school_saveEdit";
include_once("classes/middletier/msp/schooltype.class.php");
include_once("classes/middletier/msp/school.class.php");
include_once("classes/middletier/msp/research.class.php");

$st=new schoolType();
//$st->loadAll();

$s=new school();
$s->load($_GET['schoolID']);

$schoolID=$_GET['schoolID'];
?>

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
											SCHOOL
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->		

						
						<table class="form" cellpadding="0" cellspacing="0" width="100%">
						<tr>
						<th colspan="2">SCHOOL INFORMATION</th>
						</tr>
						<tr>
						<td width="50%" style="text-align:left;font-weight:normal;">Short name:<span style="font-weight:bold;padding-left:10px"><?php echo $s->schoolCode;?></span></td>
						<td width="50%" style="text-align:left;font-weight:normal;">School name:<span style="font-weight:bold;padding-left:10px"><?php echo $s->schoolName;?></span></td>
						</tr>
						<tr>
						<td width="50%" style="text-align:left;font-weight:normal;">HEI Code:<span style="font-weight:bold;padding-left:10px"><?php echo $s->schoolCode;?></span></td>
						<td width="50%" style="text-align:left;font-weight:normal;">School type:<span style="font-weight:bold;padding-left:10px"><?php echo $st->getSchoolType($s->schoolTypeID);?></span></td>
						</tr>
						<tr>
						<td width="50%" style="text-align:left;font-weight:normal;">Address:<span style="font-weight:bold;padding-left:10px"><?php echo $s->address;?></span></td>
						<td width="50%" style="text-align:left;font-weight:normal;">Telphone:<span style="font-weight:bold;padding-left:10px"><?php echo $s->telephone;?></span></td>
						</tr>
						<tr>
						<td width="50%" style="text-align:left;font-weight:normal;">Fax:<span style="font-weight:bold;padding-left:10px"><?php echo $s->fax;?></span></td>
						<td width="50%" style="text-align:left;font-weight:normal;">Email:<span style="font-weight:bold;padding-left:10px"><?php echo $s->email;?></span></td>
						</tr>
						<tr>
						<td width="50%" style="text-align:left;font-weight:normal;">Mobile #:<span style="font-weight:bold;padding-left:10px"><?php echo $s->mobile;?></span></td>
						<td width="50%" style="text-align:left;font-weight:normal;">Website:<span style="font-weight:bold;padding-left:10px"><?php echo $s->website;?></span></td>
						</tr>
						</table>
						
								<br>
						<div class="tabs" align="left"> 	
        						<ul class="tabNavigation"> 
         						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=scolleges_index&schoolID=<?php echo $schoolID;?>" >Colleges</a></li> 
         						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=sdepartment_index&schoolID=<?php echo $schoolID;?>" >Departments</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=sfaculty_index&schoolID=<?php echo $schoolID;?>" style="color:#ffffff;font-style:italic;">Faculty</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=sunit_index&schoolID=<?php echo $schoolID;?>" >Research Unit</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=sprogram_index&schoolID=<?php echo $schoolID;?>" >Programs</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=sproject_index&schoolID=<?php echo $schoolID;?>" >Projects</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=spublication_index&schoolID=<?php echo $schoolID;?>" >Publications</a></li>									          						    
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=scopyrights_index&schoolID=<?php echo $schoolID;?>" >Copyrights & patent</a></li> 
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=sawards_index&schoolID=<?php echo $schoolID;?>" >Awards</a></li> 
          						    
           					 		
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
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=school_index'">        		
 						</div>
 								
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>