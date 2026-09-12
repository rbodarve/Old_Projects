		<?php					
		
					//echo $task;
				switch($task)
				{					
				
				case 'restype_index':
						include_once("restype/list.inc.php");
						break;	
				case 'restype_addNew':
						include_once("restype/addNew.inc.php");
						break;		
				case 'restype_save':
						include_once("restype/save.inc.php");
						break;	
				case 'restype_edit':
						include_once("restype/edit.inc.php");
						break;						
				case 'restype_saveEdit':
						include_once("restype/saveEdit.inc.php");
						break;							
				case 'restype_delete':
						include_once("restype/delete.inc.php");
						break;	
													
				case 'res_index':
						include_once("researcher/list.inc.php");
						break;					
				case 'res_addNew':
						include_once("researcher/addNew.inc.php");
						break;							
				case 'res_save':
						include_once("researcher/save.inc.php");
						break;						
				case 'res_edit':
						include_once("researcher/edit.inc.php");
						break;						
				case 'res_saveEdit':
						include_once("researcher/saveEdit.inc.php");
						break;							
				case 'res_delete':
						include_once("researcher/delete.inc.php");
						break;	

						
				case 'respos_index':
						include_once("respos/list.inc.php");
						break;	
				case 'respos_addNew':
						include_once("respos/addNew.inc.php");
						break;		
				case 'respos_save':
						include_once("respos/save.inc.php");
						break;	
				case 'respos_edit':
						include_once("respos/edit.inc.php");
						break;						
				case 'respos_saveEdit':
						include_once("respos/saveEdit.inc.php");
						break;							
				case 'respos_delete':
						include_once("respos/delete.inc.php");
						break;								
								
				}
		
			
		
		
		?>
