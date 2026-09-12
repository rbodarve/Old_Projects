		<?php					
		
					//echo $task;
				switch($task)
				{					
				
				case 'faculty_index':
						include_once("faculty/faculty/list.inc.php");
						break;	
				case 'faculty_addNew':
						include_once("faculty/faculty/addNew.inc.php");
						break;		
				case 'faculty_save':
						include_once("faculty/faculty/save.inc.php");
						break;	
				case 'faculty_edit':
						include_once("faculty/faculty/edit.inc.php");
						break;		
				case 'faculty_saveEdit':
						include_once("faculty/faculty/saveEdit.inc.php");
						break;										
				case 'faculty_delete':
						include_once("faculty/faculty/delete.inc.php");
						break;	
				case 'faculty_view':
						include_once("faculty/faculty/view.inc.php");
						break;
													
				case 'personnel_index':
						include_once("personnel/list.inc.php");
						break;					
				case 'personnel_addNew':
						include_once("personnel/addNew.inc.php");
						break;							
				case 'personnel_save':
						include_once("personnel/save.inc.php");
						break;						
				case 'personnel_edit':
						include_once("personnel/edit.inc.php");
						break;						
				case 'personnel_saveEdit':
						include_once("personnel/saveEdit.inc.php");
						break;							
				case 'personnel_delete':
						include_once("personnel/delete.inc.php");
						break;	
				case 'personnel_view':
						include_once("personnel/view.inc.php");
						break;
						
				}
				?>
