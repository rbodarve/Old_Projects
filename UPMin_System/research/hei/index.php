		<?php				
		
					//echo $task;
				switch($task)
				{								
						
				//college under hei		
				case 'college_index':
						include_once("college/list.inc.php");
						break;	
				case 'college_addNew':
						include_once("college/addNew.inc.php");
						break;		
				case 'college_save':
						include_once("college/save.inc.php");
						break;	
				case 'college_edit':
						include_once("college/edit.inc.php");
						break;		
				case 'college_saveEdit':
						include_once("college/saveEdit.inc.php");
						break;										
				case 'college_delete':
						include_once("college/delete.inc.php");
						break;		
				//dept under hei 		
				case 'department_index':
						include_once("department/list.inc.php");
						break;	
				case 'department_addNew':
						include_once("department/addNew.inc.php");
						break;		
				case 'department_save':
						include_once("department/save.inc.php");
						break;	
				case 'department_edit':
						include_once("department/edit.inc.php");
						break;		
				case 'department_saveEdit':
						include_once("department/saveEdit.inc.php");
						break;										
				case 'department_delete':
						include_once("department/delete.inc.php");
						break;		
						
				/*case 'faculty_index':
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
						break;		*/						
						
				case 'campus_index':
						include_once("campus/list.inc.php");
						break;	
				case 'campus_addNew':
						include_once("campus/addNew.inc.php");
						break;		
				case 'campus_save':
						include_once("campus/save.inc.php");
						break;	
				case 'campus_edit':
						include_once("campus/edit.inc.php");
						break;		
				case 'campus_saveEdit':
						include_once("campus/saveEdit.inc.php");
						break;										
				case 'campus_delete':
						include_once("campus/delete.inc.php");
						break;				
						
				//diri nag.end		
				case 'education_index':
						include_once("faculty/education/list.inc.php");
						break;	
				case 'education_addNew':
						include_once("faculty/education/addNew.inc.php");
						break;		
				case 'education_save':
						include_once("faculty/education/save.inc.php");
						break;	
				case 'education_edit':
						include_once("faculty/education/edit.inc.php");
						break;		
				case 'education_saveEdit':
						include_once("faculty/education/saveEdit.inc.php");
						break;										
				case 'education_delete':
						include_once("faculty/education/delete.inc.php");
						break;														
											
						
				/*case 'affiliation_index':
						include_once("faculty/affiliation/list.inc.php");
						break;			
				case 'affiliation_addNew':
						include_once("faculty/affiliation/addNew.inc.php");
						break;		
				case 'affiliation_save':
						include_once("faculty/affiliation/save.inc.php");
						break;	
				case 'affiliation_edit':
						include_once("faculty/affiliation/edit.inc.php");
						break;		
				case 'affiliation_saveEdit':
						include_once("faculty/affiliation/saveEdit.inc.php");
						break;										
				case 'affiliation_delete':
						include_once("faculty/affiliation/delete.inc.php");
						break;																
						
				case 'awards_index':
						include_once("faculty/awards/list.inc.php");
						break;			
				case 'awards_addNew':
						include_once("faculty/awards/addNew.inc.php");
						break;		
				case 'awards_save':
						include_once("faculty/awards/save.inc.php");
						break;	
				case 'awards_edit':
						include_once("faculty/awards/edit.inc.php");
						break;		
				case 'awards_saveEdit':
						include_once("faculty/awards/saveEdit.inc.php");
						break;										
				case 'awards_delete':
						include_once("faculty/awards/delete.inc.php");
						break;																
								
				case 'copyrights_index':
						include_once("faculty/copyrights/list.inc.php");
						break;			
				case 'copyrights_addNew':
						include_once("faculty/copyrights/addNew.inc.php");
						break;		
				case 'copyrights_save':
						include_once("faculty/copyrights/save.inc.php");
						break;	
				case 'copyrights_edit':
						include_once("faculty/copyrights/edit.inc.php");
						break;		
				case 'copyrights_saveEdit':
						include_once("faculty/copyrights/saveEdit.inc.php");
						break;										
				case 'copyrights_delete':
						include_once("faculty/copyrights/delete.inc.php");
						break;																
								
				case 'project_index':
						include_once("faculty/project/list.inc.php");
						break;			
				case 'project_addNew':
						include_once("faculty/project/addNew.inc.php");
						break;		
				case 'project_save':
						include_once("faculty/project/save.inc.php");
						break;	
				case 'project_edit':
						include_once("faculty/project/edit.inc.php");
						break;		
				case 'project_saveEdit':
						include_once("faculty/project/saveEdit.inc.php");
						break;										
				case 'project_delete':
						include_once("faculty/project/delete.inc.php");
						break;		

				case 'publication_index':
						include_once("faculty/publication/list.inc.php");
						break;			
				case 'publication_addNew':
						include_once("faculty/publication/addNew.inc.php");
						break;		
				case 'publication_save':
						include_once("faculty/publication/save.inc.php");
						break;	
				case 'publication_edit':
						include_once("faculty/publication/edit.inc.php");
						break;		
				case 'publication_saveEdit':
						include_once("faculty/publication/saveEdit.inc.php");
						break;										
				case 'publication_delete':
						include_once("faculty/publication/delete.inc.php");
						break;																
									
				case 'seminars_index':
						include_once("faculty/seminars/list.inc.php");
						break;			
				case 'seminars_addNew':
						include_once("faculty/seminars/addNew.inc.php");
						break;		
				case 'seminars_save':
						include_once("faculty/seminars/save.inc.php");
						break;	
				case 'seminars_edit':
						include_once("faculty/seminars/edit.inc.php");
						break;		
				case 'seminars_saveEdit':
						include_once("faculty/seminars/saveEdit.inc.php");
						break;										
				case 'seminars_delete':
						include_once("faculty/seminars/delete.inc.php");
						break;			*/													
												
								
				}
		
			
		
		
		?>
