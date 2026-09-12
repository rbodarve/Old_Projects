<?php
$unit="pt";
$go="add";
$task="save_edit";

include_once("classes/middletier/pt/training.class.php");
include_once("classes/middletier/pt/budget.class.php");

$id=$_GET['training_id'];

$training=new Training();
$training->load_id($id);
$budget=new Budget();
$budget->load_id($id);
?>

<div id="wrapper">

<script Language="Javascript">
	function printit(){  
		if (window.print) {
			window.print();
		}
		else {
			var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
		document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
		WebBrowser1.ExecWB(6, 2);//Use a 1 vs. a 2 for a prompting dialog box  
		WebBrowser1.outerHTML = ""; 
		}
}


</script>
 
 
  <div id="page">
	 <!--GOLD BOX TEMPLATE STARTS HERE -->
			<div id="greenbox"><!-- GOLD box template!   -->
					<div class="box-outer" >	
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
						
					  	<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task?>" method="GET">			
						
							<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td colspan="2" style="text-align:right;">
									<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=index" onclick="printit();" ><img src="images/printing.png" height="24px" width="24px" title="Print"></a>
									<!--<script language="Javascript">
										document.write('<form><input type="image"src="images/printing.png" eight="24px" width="24px" name="Print" onClick="printit()"></form>')
									</script>-->
									<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=modify&training_id=<?php echo $id;?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a></td>
								</tr>
								<tr>
									<th colspan="2">VIEW Training</th>		  
								</tr>
								<tbody>
									<tr>	
										<td colspan="2"><br>
											<font size="6"><b><u> 
												<?php echo $training-> training_title;?>
												<input type="hidden" name="training_id" id="training_id" value="<?php $id;?>">
											</font></b></u>
										</td>
									</tr>
									<tr>	
										<td width="15%">
											<br>Type
										</td>
										<td>
											<br><?php echo $training-> typ;?>
										</td>
										
									</tr>
									<tr>
										<td>
											Description
										</td>
										<td>
											<?php echo $training-> descr;?>
										</td>
									</tr>
									<tr>
										<td>
										Time Period
										</td>
										<td>
											<?php echo $training->start_date;?> to <?php echo $training->end_date;?>		
										</td>
										
									</tr>
									<tr>
										<td>
											Organizers
										</td>
										<td>
												<?php echo $training-> organizer;?>
										</td>
										
									</tr>
									<tr>
										<td>
											Venue
										</td>
										<td>
											<?php echo $training-> location;?>, <?php echo $training-> city;?>
										</td>
										
									</tr>
									<tr>
										<td>
											Remarks
										</td>
										<td>
											<?php echo $training->remarks;?>
										</td>
										
									</tr>	
									<tr>
										<td>
										<br>
											<b>BUDGET</b>
										</td>
									</tr>
									<tr>
										<td>
											Budget Allocated
										</td>
										<td>
											<?php echo $budget-> budget_allocated;?> Php
										</td>	
									</tr>
									<tr>
										<td>
											Actual Expense
										</td>
										<td>
											<?php echo $budget-> budget_actual;?> Php
											<br><br>
										</td>
									</tr>
										<tr>
											<td>
												<b><h3>PARTICIPANTS</h3></b>
											</td>
										</td>
									</tbody>
							</table>
							
							
							<table class="list" cellpadding="0" cellspacing="0" width="100%" cellpadding="1" cellspacing="0">	
							<tr>
									
								  <th style="text-align:center;" width="20%">
								  	Participant ID
								  </th>						
								  <th style="text-align:left;">
								  	Complete Name
								  </th>	
								  <th style="text-align:center;" width='10%'>
								  	Certification
								  </th>
								  
							</tr>
							
									<?php 
													$training2=new Training();
													$training2->load_training($id);
													
													while($row=$training2->result->FetchRow())
													{
									?>
									<tbody>
									<tr>				
													<td style="text-align:center;">
														<?php  echo $row['participant_id'];?>
													</td>
													<td>
														<?php echo $row['completeName'];?>
													</td>
													<td style="text-align:center;">
														<a href="modules/pt/uploads/<?php echo $row['participant_id'];?>_<?php echo $id;?>"><img src="images/attachments.png" height="24px" width="24px" title="View Certificate"></a>
									</tr>	
									<?php
													}
											?>
									
									<?php
													$training2->loadNP($id);
													
													while($r=$training2->result->FetchRow())
													{
									?>
									<tr>				
													<td style="text-align:center;">
														<?php  echo $r['participant_id'];?>
													</td>
													<td>
														<?php echo $r['participant_name'];?> (<?php echo "from ".$r['participant_institution']?>)
													</td>
													<td style="text-align:center;">
														<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=viewnp&pid=<?php  echo $r['participant_id'];?>&tid=<?php echo $id?>"><img src="images/info.png" height="24px" width="24px" title="View Participant"></a>
													</td>
									</tr>	
									<?php
													}
											?>
									</tbody>
							</table>
							<table>
								<tr  style="text-align:center;">
								<td style="text-align:center;">
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=addnp&id=<?php echo $id?>"><img src="images/add3.png" height="24px" width="24px" title="Add "></a>
									Add a non-UP Participant to this event:
								</td>
								</tr>
							</table>
							
							
						
						</form>
						
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
	
	
	
  </div>	
  </div>
  
  

<?php

if($strMsg)
{
?>
<script type="text/javascript">
alert('<?php echo $strMsg;?>');
</script>
<?php
	
}
?>