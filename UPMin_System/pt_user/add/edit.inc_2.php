<?php
$unit="pt_user";
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
<script type="text/javascript">

	function checkEntry()
	{
		var training_title=document.getElementById('training_title').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
		var location=document.getElementById('location').value;
		var city=document.getElementById('city').value;
		var organizer=document.getElementById('organizer').value;
		var typ=document.getElementById('typ').value;
		var descr=document.getElementById('descr').value;
		var budget_allocated=document.getElementById('budget_allocated').value;
		var budget_actual=document.getElementById('budget_actual').value;
		var nature=document.getElementById('nature').value;
		
		if(training_title=='')
		{
			alert("No TRAINIG TITLE!");
			return false;
		}
		if(start_date=='')
		{
			alert("No START DATE!");
			return false;
		}
		if(end_date=='')
		{
			alert("No END DATE!");
			return false;
		}
		if(location=='')
		{
			alert("No LOCATION!");
			return false;
		}
		if(city=='')
		{
			alert("No CITY!");
			return false;
		}
		if(organizer=='')
		{
			alert("No Training ORGANIZER(S)!");
			return false;
		}
		if(typ=='')
		{
			alert("No Training TYPE!");
			return false;
		}
		if(descr=='')
		{
			alert("No Budget Allocated!");
			return false;
		}
		if(budget_actual=='')
		{
			alert("No Actual Budget!");
			return false;
		}
		if(nature=='')
		{
			alert("Input INVALID: Nature of Participation!");
			return false;
		}
		
		return true;
		
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
					  		<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" onsubmit="return checkEntry();">			
							
							<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">UPDATE Training</th>		  
								</tr>
								</tr>
								<tbody>
									<tr>
										<td>
										Training ID
										</td>
										<td>
											<?php echo $training-> training_id;?>
											<input type="hidden" name="training_id" id="training_id" value="<?php echo $training-> training_id;?>">
										</td>
										
									</tr>
									<tr>
										<td width="15%">
										Training Title
										</td>
										<td>
											<input type="text" name="training_title" id="training_title" value="<?php echo $training-> training_title;?>" size="50">
										</td>
										
									</tr>
									<tr>
										<td>
										Start Date
										</td>
										<td>
											<input type="text" name="start_date"  id="start_date" value="<?php echo $training->start_date;?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_start_date" title="Date selector" align="absmiddle" class="jscalimg"/>
											<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "start_date",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_start_date",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>	
										</td>
										
									</tr>
									<tr>
										<td>
										End Date
										</td>
										<td>
											<input type="text" name="end_date"  id="end_date" value="<?php echo $training->end_date;?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_end_date" title="Date selector" align="absmiddle" class="jscalimg"/>
											<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "end_date",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_end_date",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>	
										</td>
										
									</tr>
									<tr>
										<td>
										Location
										</td>
										<td>
											<input type="text" name="location" id="location" value="<?php echo $training-> location;?>" size="50">
										</td>
										
									</tr>
									<tr>
										<td>
										City
										</td>
										<td>
											<input type="text" name="city" id="city" value="<?php echo $training-> city;?>" size="50">
										</td>
									</tr>
									<tr>
										<td>
										Organizer(s)
										</td>
										<td>
											<input type="text" name="organizer" id="organizer" value="<?php echo $training-> organizer;?>" size="50">
										</td>
									</tr>
									<tr>
										<td>
										Training Type <?php $temp=$training->typ;?>
										</td>
										<td>
											<select name="typ" id="typ">
											<option value=""></option>
											<option value='Workshop'
												<?php
													if ($temp=="Workshop"){
													echo "selected";
												}
												?>
												>
												Workshop
											</option>
											<option value="Conference"
												<?php
													if ($temp=="Conference"){
													echo "selected";
												}
												?>
												>Conference</option>
											<option 
												value="Seminar"
												<?php
													if ($temp=="Seminar"){
													echo "selected";
												}
												?>
												>Seminar</option>
											<option 
												value="Competition"
												<?php
													if ($temp=="Competition"){
													echo "selected";
												}
												?>
												>Competition</option>
											<option 
												value="Others"
												<?php
													if ($temp=="Others"){
													echo "selected";
												}
												?>
												>Others</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
										Training Description
										</td>
										<td>
											<input type="text" name="descr" id="descr" value="<?php echo $training->descr;?>" size="100">
										</td>
									</tr>
									
									<tr>
										<td>
										Remarks
										</td>
										<td>
											<input  type="text" name="remarks" id="remarks" value="<?php echo $training->remarks;?>"size="100">
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
										<b>Budget Allocated</b>
										</td>
										<td>
											<input type="text" name="budget_allocated" id="budget_allocated" value="<?php echo $budget-> budget_allocated;?>" size="20">Php
										</td>	
									</tr>
									<tr>
										<td>
										<b>Actual Expense</b>
										</td>
										<td>
											<input type="text" name="budget_actual" id="budget_actual" value="<?php echo $budget-> budget_actual;?>" size="20">Php
										</td>
										
									</tr>									
								</tbody>
							
							
							</table>
						
						<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Cancel"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=index'"> 
 						</div>
						
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