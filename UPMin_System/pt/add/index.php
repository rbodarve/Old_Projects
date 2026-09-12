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
					case 'editnp':
						include_once("editnp.inc.php");		
						break;	
					case 'updatenp':
						include_once("updatenp.inc.php");		
						break;	
					case 'delete':
						include_once("delete.inc.php");		
						break;	
					case 'deletenp':
						include_once("deletenp.inc.php");		
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
					case 'addnp':
						include_once("addnp.inc.php");		
						break;	
					case 'savenp':
						include_once("savenp.inc.php");		
						break;	
					case 'viewnp':
						include_once("viewnp.inc.php");		
						break;	
				default:				
					include_once("list.inc.php");		
					break;
				}		
		?>
