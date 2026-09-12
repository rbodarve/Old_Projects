<?php
$unit="research";
$go="hei";
$task="campus_save";

?>
<script type="text/javascript">

	function checkEntry()
	{
		var campusID=document.getElementById('campusID').value;
		var campusName=document.getElementById('campusName').value;
		var place=document.getElementById('place').value;	
		var dateEstablished=document.getElementById('dateEstablished').value;
		var chancellor=document.getElementById('chancellor').value;
		
		if(campusName=='')
		{
			alert("No Name!");
			return false;
		}				
		if(place=='')
		{
			alert("No place!");
			return false;
		}		
		if(dateEstablished=='')
		{
			alert("No Date!");
			return false;
		}
		if(chancellor=='')
		{
			alert("No chancellor!");
			return false;
		}		
		return true;
		
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
											CAMPUS
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW CAMPUS</th>								  									
								</tr>
								
								<!--nag.add-->
								<tr>							
									<td>
										Campus Name
										</td>
										<td>
											<input type="text" name="campusName" id="campusName" value="" size="60">
										</td>										
								</tr>
								<tr>							
									<td>
										Place
										</td>
										<td>
											<input type="text" name="place" id="place" value="" size="60">
										</td>										
								</tr>
								<tr>							
									<td>
										Date Established
										</td>
										<td>
										 	<input type="text" name="dateEstablished"  id="dateEstablished" value="" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_dateEstablished" title="Date selector" align="absmiddle" class="jscalimg"/>
									<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "dateEstablished",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_dateEstablished",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>	
										</td>												
								</tr> 
								<tr>							
									<td>
										Chancellor
										</td>
										<td>
											<input type="text" name="chancellor" id="chancellor" value="" size="60">
										</td>										
								</tr>
								<!--nag.end-->
								
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=campus_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>