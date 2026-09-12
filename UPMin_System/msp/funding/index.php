		<?php					
		
					//echo $task;
				switch($task)
				{									
				case 'fundtype_index':
						include_once("fundtype/list.inc.php");
						break;	
				case 'fundtype_addNew':
						include_once("fundtype/addNew.inc.php");
						break;		
				case 'fundtype_save':
						include_once("fundtype/save.inc.php");
						break;	
				case 'fundtype_edit':
						include_once("fundtype/edit.inc.php");
						break;						
				case 'fundtype_saveEdit':
						include_once("fundtype/saveEdit.inc.php");
						break;							
				case 'fundtype_delete':
						include_once("fundtype/delete.inc.php");
						break;							
				case 'fundagency_index':
						include_once("fundagency/list.inc.php");						
						break;								
				case 'fundagency_addNew':
						include_once("fundagency/addNew.inc.php");
						break;		
				case 'fundagency_save':
						include_once("fundagency/save.inc.php");
						break;	
				case 'fundagency_edit':
						include_once("fundagency/edit.inc.php");
						break;						
				case 'fundagency_saveEdit':
						include_once("fundagency/saveEdit.inc.php");
						break;							
				case 'fundagency_delete':
						include_once("fundagency/delete.inc.php");
						break;			
				
				case 'fund_index':
						include_once("fund/list.inc.php");						
						break;								
				case 'fund_addNew':
						include_once("fund/addNew.inc.php");
						break;		
				case 'fund_save':
						include_once("fund/save.inc.php");
						break;	
				case 'fund_edit':
						include_once("fund/edit.inc.php");
						break;						
				case 'fund_saveEdit':
						include_once("fund/saveEdit.inc.php");
						break;							
				case 'fund_delete':
						include_once("fund/delete.inc.php");
						break;					
								
				}
		
			
		
		
		?>
