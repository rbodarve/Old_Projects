<?php
$unit="pt_user";
$go="add";
$task="edit";

include_once("classes/middletier/pt/training.class_user.php");
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
					<div class="box-outer">	
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
					  		<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task?>" method="POST">			
							
							<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td colspan="2" style="text-align:right;">
									<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=index" onclick="printit();" ><img src="images/printing.png" height="24px" width="24px" title="Print"></a>
									<!--<script language="Javascript">
										document.write('<form><input type="image"src="images/printing.png" eight="24px" width="24px" name="Print" onClick="printit()"></form>')
									</script>-->
									<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=modify&training_id=<?php echo $training->training_id;?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a></td>
								</tr>
								<tr>
									<th colspan="2">VIEW Training</th>		  
								</tr>
								<tbody>
									<tr>
										<td>
											Training ID
										</td>
										<td>
											<?php echo $id?>
										</td>
									</tr>
									<tr>	
										<td width="15%">
											Training Title
										</td>
										<td>
											<?php echo $training-> training_title;?>
										</td>
										
									</tr>
									<tr>	
										<td width="15%">
											Training Type
										</td>
										<td>
											<?php echo $training->typ;?>
										</td>
										
									</tr>
									<tr>
										<td>
											Training Description
										</td>
										<td>
											<?php echo $training->descr;?>
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
											Location
										</td>
										<td>
											<?php echo $training-> location;?>
										</td>
										
									</tr>
									<tr>
										<td>
											City
										</td>
										<td>
											<?php echo $training-> city;?>
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
									</tbody>
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