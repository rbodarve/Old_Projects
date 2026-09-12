<?php
$unit="pt_user";
$task="saveTraining";
$go="add";

include_once("classes/middletier/pt/training.class_user.php");
?>

<div id="wrapper">

<script type="text/javascript">

	function checkEntry()
	{
		var training_title=document.getElementById('training_title').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
		var loc=document.getElementById('loc').value;
		var city=document.getElementById('city').value;
		var organizer=document.getElementById('organizer').value;
		var typ=document.getElementById('typ').value;
		var descr=document.getElementById('descr').value;
		var budget_allocated=document.getElementById('budget_allocated').value;
		var budget_actual=document.getElementById('budget_actual').value;
		
		
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
		if(loc=='')
		{
			alert("No loc!");
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
						
							<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=addfromExisting" method="POST">
							<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tbody>
								<tr>
									<th colspan="2">ADD FROM EXiSTING TRAININGS</th>		  
									
								</tr>
									<tr>
										<td width="23%">
										Choose A Training
										</td>
										<td>
											<select name="training_id" id="training_id">
											<option value=""></option>
											<?php
												$training2=new Training();
												$training2->loadNotMyTrainings();
											?>
											<?php
												while($r=$training2->result->FetchRow())
												{
											?>
												<option value='<?php echo $r['training_ID'];?>'>
													<?php echo $r['training_title'];?>
												</option>
											<?php
												}
											?>
											</select>
										</td>
									</tr>									
									<tr>
										<td>
										<label for="file">Upload Certification:</label>
										<td>
										<input type="file" name="file" id="file" /> 
										</td>
										</td>
									</tr>
								</tbody>
							</table>
							<div align="right">
							<input type="submit" name="save" value="Save">
 						</div>
							</form>
							<br>
					  		<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" onsubmit="return checkEntry();">			
							
							<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tbody>
								<tr>
									<th colspan="2">ADD NEW Training</th>		  
									
								</tr>
									<tr>
										<td>
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
											<input type="text" name="start_date"  id="start_date" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
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
											<input type="text" name="end_date"  id="end_date" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
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
											<input type="text" name="loc" id="loc" value="<?php echo $training-> location;?>" size="50">
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
										Training Type
										</td>
										<td>
											<select name="typ">
											<option value=""></option>
											<option value="Workshop">Workshop</option>
											<option value="Conference">Conference</option>
											<option value="Seminar">Seminar</option>
											<option value="Competition">Competition</option>
											<option value="Others">Others</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
										Training Description
										</td>
										<td>
											<textarea type="longtext" name="descr" id="descr" value="<?php echo $training-> descr;?>" rows="5" cols="50"></textarea>
										</td>
									</tr>
									
									<tr>
										<td>
										Remarks
										</td>
										<td>
											<textarea  name="remarks" id="remarks" value="<?php echo $training->remarks;?>" rows="5" cols="50"></textarea>
										</td>
										
									</tr>	
									<tr>
										<td>
										<br>
											BUDGET
										</td>
									</tr>
									<tr>
										<td>
										Budget Allocated
										</td>
										<td>
											<input type="text" name="budget_allocated" id="budget_allocated" value="<?php echo $budget-> budget_allocated;?>" size="20">Php
										</td>	
									</tr>
									<tr>
										<td>
										Actual Expense
										</td>
										<td>
											<input type="text" name="budget_actual" id="budget_actual" value="<?php echo $budget-> budget_actual;?>" size="20">Php
										</td>
										
									</tr>
									
									<tr>
										<td>
										<label for="file">Filename:</label>
										<td>
										<input type="file" name="file" id="file" /> 
										</td>
										</td>
									</tr>
									
								</tbody>
							
							
							</table>
						
						<div align="right">
							<input type="submit" name="save" value="Save">
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