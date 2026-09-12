<?php
$unit="msp";
$go="funding";
$task="fund_save";
include_once("classes/middletier/msp/fundagency.class.php");

$fa=new fundAgency();
$fa->loadAll();
?>
<script type="text/javascript">

	function checkEntry()
	{
		var fundName=document.getElementById('fundName').value;
		var agency=document.getElementById('fundAgencyID').selectedIndex;
		var amount=document.getElementById('amount').value;
		var remarks=document.getElementById('remarks').value;
		
		
		if(fundName=='')
		{
			alert("No Name!");
			return false;
		}
		if(agency==0)
		{
			alert("No agency selected");
			return false;
		}
		if(amount=='')
		{
			alert("No amount");
			return false;
		}
		if(remarks=='')
		{
			alert("No remarks");
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
											FUNDS
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=<?php echo $task;?>" method="POST" enctype="multipart/form-data" onsubmit="return checkEntry();">										
								
								<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th colspan="2">ADD NEW FUNDING</th>								  									
								</tr>
								<tr>							
									<td>
										Fund name
										</td>
										<td>
											<input type="text" name="fundName" id="fundName" value="" size="60">
										</td>
										
								</tr>
								<tr>							
									<td style="vertical-align:top;">
										Funding agency
										</td>
										<td>
											<select name="fundAgencyID" id="fundAgencyID">
												<option value="0">-SELECT-</option>
												<?php
													if($fa->count > 0)
													{
														while($row=$fa->result->FetchRow())
														{
												?>
											
														<option value="<?php echo $row['fundAgencyID'];?>"><?php echo $row['agencyName'];?></option>
												<?php
														}
													}
												?>
											</select>
										</td>
										
								</tr>
								<tr>							
									<td>
										Date Received
										</td>
										<td>
										 	<input type="text" name="dateReceived"  id="dateReceived" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_dateReceived" title="Date selector" align="absmiddle" class="jscalimg"/>
									<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "dateReceived",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_dateReceived",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>	
										
										
										
										</td>
										
								</tr>
								<tr>							
									<td>
										Amount
										</td>
										<td>
											<input type="text" name="amount" id="amount" value="" size="15" style="text-align:right;">
										</td>
										
								</tr>	
								<tr>							
									<td style="vertical-align:top;">
										Remarks
										</td>
										<td>
											<textarea name="remarks" id="remarks" cols="60" rows="5"></textarea>
										</td>
										
								</tr>																					
								</table>
								<div align="right">
       		 			<input type="submit" name="save" value="Save" > 					    		 			
       		 			<input type="button" name="cancel" value="Back"  onclick="window.location='?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=fund_index'">        		
 						</div>
								</form>
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>