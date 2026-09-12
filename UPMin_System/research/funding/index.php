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
						
				case 'fundingagency_index':
						include_once("fundingagency/list.inc.php");						
						break;								
				case 'fundingagency_addNew':
						include_once("fundingagency/addNew.inc.php");
						break;		
				case 'fundingagency_save':
						include_once("fundingagency/save.inc.php");
						break;	
				case 'fundingagency_edit':
						include_once("fundingagency/edit.inc.php");
						break;						
				case 'fundingagency_saveEdit':
						include_once("fundingagency/saveEdit.inc.php");
						break;							
				case 'fundingagency_delete':
						include_once("fundingagency/delete.inc.php");
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
