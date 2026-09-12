<script type="text/javascript">
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
