<?php
$unit="pt";
$task="savenp";
$go="add";

$id=$_GET['id'];
?>

<div id="wrapper">
<script type="text/javascript">

	function checkEntry()
	{
		var name=document.getElementById('name').value;
		var org=document.getElementById('org').value
		
		if(name=='')
		{
			alert("Invalid Input on Complete Name!");
			return false;
		}
		if(org=='')
		{
			alert("Invalid Input in Organization/Institution!");
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
									<th colspan="2">ADD A NON-UP PARTICIPANT</th>		  
								</tr>
								<tbody>
									<tr>
										<td width="20%">
										<br>Complete Name
										</td>
										<td><br>
											<input type="hidden" name="id" id="id" value="<?php echo $id ;?>">
											<input type="text" name="name" id="name" value="<?php echo $np->name ;?>" size="50">
										</td>
									</tr>					
									<tr>
									<td>
										Organization/Institution
										</td>
										<td>
											<input type="text" name="org" id="org" value="<?php echo $np->org ;?>" size="50">
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