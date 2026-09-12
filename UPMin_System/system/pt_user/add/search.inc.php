
<form action="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=search" method="POST">

	<table cellpadding="0" cellspacing="0" width="100%">	
		<tr>
			<td width="5%">
			FILTER
			</td>
			<td width="23%">
					<input type="text" name="filter" id="filter" value="" size="30">
			</td>
				
			<td>
					<input type="submit" name="search" value="Search" > 					    		 			
			</td>
			<td style="text-align:right;">
					<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=addNew" ><img src="images/new_f2.png" height="24px" width="24px" title="Add"></a>
			</td>
		</tr>
		<tr>
			<td>
			</td>
			<td width="5%">
				<i>to search for date: type yyyy-mm-dd</i>
			</td>
		</tr>
	</table>

</form>