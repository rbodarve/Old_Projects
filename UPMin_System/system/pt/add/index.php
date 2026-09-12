		<?php					
		
					//echo $task;
				switch($task)
				{	
				
					case 'addNew':
						include_once("add.inc.php");		
						break;		
					case 'view':
						include_once("view.inc.php");		
						break;	
					case 'saveTraining':
						include_once("savetraining.inc.php");		
						break;
					case 'modify':
						include_once("edit.inc.php");		
						break;	
					case 'delete':
						include_once("delete.inc.php");		
						break;	
					case 'search':
						include_once("search_results.inc.php");		
						break;		
					case 'save_edit':
						include_once("save_edit.inc.php");		
						break;		
					case 'delete':
						include_once("delete.inc.php");		
						break;	
				default:				
					include_once("list.inc.php");		
					break;
				}		
		?>
