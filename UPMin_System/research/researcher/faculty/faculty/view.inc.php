<?php
$unit="research";
$go="researcher";
//$task="faculty_edit";
include_once("classes/middletier/research/faculty.class.php");
include_once("classes/middletier/research/fresearch.class.php");

$fr=new fresearch();
//$f->loadAll();
$fr->search($_GET['facultyID']);

$f=new faculty();
//$f->loadAll();
$f->load($_GET['facultyID']);



//$facultyID=$_GET['facultyID'];
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
								<td  style="font-weight:normal;">
										Researcher Code
										<span style="font-weight:bold;font-style:italic;padding-left:10px;">
								<?php echo $f->researcherCode;?></span>
										</td>		
								<tr>							
									<td style="font-weight:normal;">
										Complete Name : <span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $f->lastName.", ".$f->firstName." ".$f->middleName;?></span>
										</td>		
								</tr>
								<tr>
									<td  style="font-weight:normal;">
										Department: <span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $f->deptCode;?></span>
										</td>											
								</tr>
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Address:
										
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $f->address;?></span>
										</td>										
								</tr>
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Contact #:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $f->contactNo;?></span>
										</td>										
								</tr>
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Specialty:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $f->specialty;?></span>
										</td>										
								</tr>
								<tr>							
									<td style="vertical-align:top;font-weight:normal;" colspan="2">
										Salary:
											<span style="font-weight:bold;font-style:italic;padding-left:10px;"><?php echo $f->salary;?></span>
										</td>										
								</tr>
								
			<!--Nag.add-->			
							</table>
						
								
								<br>
						<div class="tabs" align="left"> 	
        						<ul class="tabNavigation">          						   
          						    <li><a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=project_index&facultyID=<?php echo $facultyID;?>" style="color:#ffffff;font-style:italic;">Research Project</a></li> 
          						               					 		
       				 			</ul> 
       				 	</div>
       				 	<div class="borderTab">   
       				 	<div align="right" class="action">
							
		<!--					<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=education_addNew&facultyID=<?php echo $_GET['facultyID'];?>" ><img src="images/new_f2.png" height="24px" width="24px" title="Add new "></a>		-->
							
							</div>    			
<?php include_once("classes/middletier/research/fresearch.class.php");
$fr=new fresearch();
$fr->search($_GET['facultyID']);							 ?>
       				 	<table class="list" cellpadding="2" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">#</th>
								  <th style="text-align:left;">
									Research ID
								  </th>
								  <th style="text-align:left;">
									Research Title
								  </th>
								  <th style="text-align:left;">
									Budget
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
										<td><?php echo $row['researchID'];?></td>									
										<td><?php echo $row['rtitle'];?></td>
										<td><?php echo $row['budget'];?></td>	 <!--nag.add-->
																				
									</tr>
								
								<?php
										$count++;
									}
								}	
								?>	
						
								
								</tbody>
									
							
							</table>
       				 	 				 	       				 	       				 	      				 	       				 	
       				 	</div>
							<!--Nag.end-->		
						</div>		
						<div align="right">
						<td style="text-align:right;padding-right:5px;">				    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=faculty_index'">        		
								<input type="hidden" name="facultyID" value="<?php echo $f->facultyID;?>">
						<!-- end of contents -->
					
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>