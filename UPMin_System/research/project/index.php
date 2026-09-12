		<?php					
		
					//echo $task;
				switch($task)
				{					
				case 'publication_index':
						include_once("publication/list.inc.php");
						break;	
				case 'publication_addNew':
						include_once("publication/addNew.inc.php");
						break;		
				case 'publication_save':
						include_once("publication/save.inc.php");
						break;	
				case 'publication_edit':
						include_once("publication/edit.inc.php");
						break;						
				case 'publication_saveEdit':
						include_once("publication/saveEdit.inc.php");
						break;							
				case 'publication_delete':
						include_once("publication/delete.inc.php");
						break;	
				case 'publication_view':
						include_once("publication/view.inc.php");
						break;			
						
						
				case 'fresearch_index':
						include_once("fresearch/list.inc.php");
						break;	
				case 'fresearch_addNew':
						include_once("fresearch/addNew.inc.php");
						break;		
				case 'fresearch_save':
						include_once("fresearch/save.inc.php");
						break;	
				case 'fresearch_edit':
						include_once("fresearch/edit.inc.php");
						break;						
				case 'fresearch_saveEdit':
						include_once("fresearch/saveEdit.inc.php");
						break;							
				case 'fresearch_delete':
						include_once("fresearch/delete.inc.php");
						break;
				case 'fresearch_view':
						include_once("fresearch/view.inc.php");
						break;		
			
				case 'journal_index':
						include_once("journal/list.inc.php");
						break;	
				case 'journal_addNew':
						include_once("journal/addNew.inc.php");
						break;		
				case 'journal_save':
						include_once("journal/save.inc.php");
						break;	
				case 'journal_edit':
						include_once("journal/edit.inc.php");
						break;						
				case 'journal_saveEdit':
						include_once("journal/saveEdit.inc.php");
						break;							
				case 'journal_delete':
						include_once("journal/delete.inc.php");
						break;		
				case 'journal_view':
						include_once("journal/view.inc.php");
						break;							
				}		
		?>
