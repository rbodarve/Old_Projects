<!--<script type="text/javascript">
	function checkEntry()
	{
		var training_title=document.getElementById('training_title').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
			
		training_title=training_title+'%';
		start_date=start_date+'%';
		end_date=end_date+'%';
		
		return true;
	}
</script>
-->
<script type="text/javascript">

	function checkEntry()
	{
		var training_title=document.getElementById('training_title').value;
		var start_date=document.getElementById('start_date').value;
		var end_date=document.getElementById('end_date').value;
		var location=document.getElementById('location').value;
		var city=document.getElementById('city').value;
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
		if(budget_allocated=='')
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