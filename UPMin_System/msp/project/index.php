		<?php					
		
					//echo $task;
				switch($task)
				{					
				
				case 'projtype_index':
						include_once("projtype/list.inc.php");
						break;	
				case 'projtype_addNew':
						include_once("projtype/addNew.inc.php");
						break;		
				case 'projtype_save':
						include_once("projtype/save.inc.php");
						break;	
				case 'projtype_edit':
						include_once("projtype/edit.inc.php");
						break;						
				case 'projtype_saveEdit':
						include_once("projtype/saveEdit.inc.php");
						break;							
				case 'projtype_delete':
						include_once("projtype/delete.inc.php");
						break;	
						
				case 'projstatus_index':
						include_once("projstatus/list.inc.php");
						break;	
				case 'projstatus_addNew':
						include_once("projstatus/addNew.inc.php");
						break;		
				case 'projstatus_save':
						include_once("projstatus/save.inc.php");
						break;	
				case 'projstatus_edit':
						include_once("projstatus/edit.inc.php");
						break;						
				case 'projstatus_saveEdit':
						include_once("projstatus/saveEdit.inc.php");
						break;							
				case 'projstatus_delete':
						include_once("projstatus/delete.inc.php");
						break;			
						
													
				case 'proj_index':
						include_once("project/list.inc.php");
						break;					
				case 'proj_addNew':
						include_once("project/addNew.inc.php");
						break;							
				case 'proj_save':
						include_once("project/save.inc.php");
						break;						
				case 'proj_edit':
						include_once("project/edit.inc.php");
						break;						
				case 'proj_saveEdit':
						include_once("project/saveEdit.inc.php");
						break;							
				case 'proj_delete':
						include_once("project/delete.inc.php");
						break;	

				case 'projres_index':
						include_once("projres/view.inc.php");
						break;					
				case 'projres_addNew':
						include_once("projres/addNew.inc.php");
						break;							
				case 'projres_save':
						include_once("projres/save.inc.php");
						break;						
				case 'projres_edit':
						include_once("projres/edit.inc.php");
						break;						
				case 'projres_saveEdit':
						include_once("projres/saveEdit.inc.php");
						break;							
				case 'projres_delete':
						include_once("projres/delete.inc.php");
						break;				
											
								
				}
		
			
		
		
		?>
