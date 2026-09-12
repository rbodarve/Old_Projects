<?php
$unit="research";
$go="researcher";
$task="personnel_addNew";
$word = $_POST['string'];
$one = $_POST['one'];
include_once("classes/middletier/research/personnel.class.php");
include_once("classes/middletier/setup/userrole.class.php");

$userRole=new userRole();

$p=new personnel();
$p->loadAll();

?>
<script type="text/javascript">					
		 		  
	function deleteEntry(id) {	
	
   				var ans=confirm("Are you sure you want to delete this?");
    if(ans) {
    		window.location="?go=<?php echo $go;?>&unit=<?php echo $unit;?>&task=personnel_delete&personnel_ID="+id;
    	}   	
}
	function view(facultyCode)
		{
		
		var myForm = document.createElement("form");
        myForm.method="post";
		myForm.action = "index.php?unit=<?php echo $unit; ?>&go=<?php echo $go; ?>&task=view";
		
		var myAccount = document.createElement("input") ;
        myAccount.setAttribute("name", "facultyCode") ;
        myAccount.setAttribute("value", facultyCode);
        myForm.appendChild(myAccount) ;
  		
        document.body.appendChild(myForm) ;
        myForm.submit() ;
        document.body.removeChild(myForm) ;
		
		}	 
	
</script>
<div id="wrapper">
  <div id="page">
	
	 <!--GOLD BOX TEMPLATE STARTS HERE -->
			<div id="greenbox"><!-- GOLD box template!   -->
					<div class="box-outer">	
							<div class="box-title"> <!-- this is fixed! Dont make any changes here!   -->
		   						<div class="box-center">		   
									<div class="box-left">
									</div>										
									<div class="box-right">
									</div>											
									<div align="center">
										<div class="title"> <!-- put your header name here   -->
											PERSONNEL
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content"> <!-- put your content here   -->											
								<div align="left" class="action">
                                                                 <font style="font-weight:bold; color:black;">Browse by Last Name:</font>
                                                                <?php
                                                                    $letter = 'A';
                                                                    for ($x = 0; $x <= 25; $x++) {
                                                                ?>
                                                                <a href="index.php?unit=research&go=researcher&task=personnel_index&disp=<?php echo $letter; ?>" style="padding-left:12px; padding-right:12px; font-weight:bold;"><?php echo ' ' . $letter . ' '; ?></a>							
                                                                <?php
                                                                    $letter++;
                                                                    }
                                                                ?>
						
                                                                <form action="index.php?unit=research&go=researcher&task=personnel_index" method="POST">
                                                                <font style="font-weight:bold; color:black;">Search Personnel by: <input type="text" name="string" /> </font>
                                                                <select name="one">
                                                                <option value="1">Name</option>
                                                                <option value="6">College Code</option>
                                                                <option value="5">Campus</option>
                                                                </select>	
                                                                <input type="submit" value="Search"/>
                                                                </form>
						<?php
                                                if($one == 1)
						{
							$p->search($word);
						}
                                                else if($one == 5)
						{
							$p->search5($word);
						}
                                                else if($one == 6)
						{
							$p->search6($word);
						}
						else
						{
                                                        $p->search($_GET['disp']);
						}
                                                ?>
                                                                <?php
                                                                                    if($_SESSION['userType']==1){
                                                                ?>
								<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=personnel_addNew" ><img src="images/new_f2.png" height="24px" width="24px" title="Add new item"></a>								
                                                                <?php
                                                                    }
                                                                ?>
								</div>
								
								<table class="list" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<th style="text-align:left;">#</th>
								 <th style="text-align:left;">
									Name
								  </th>								  
								  <th style="text-align:left;">
									College
								  </th>	
								  <th style="text-align:left;">
									Email
								  </th>	
								 
								  <th style="text-align:right;padding-right:5px;">
								  	<?php
                                                                        if($_SESSION['userType']==1){
                                                                        ?>
                                                                            Action	
                                                                        <?php
                                                                            }
                                                                        ?>
								  </th>
									
								</tr>
								<tbody>
								<?php
								if($p->count > 0)
								{
									$count=1;
									while($row=$p->result->FetchRow())
									{
								?>
									<tr>
										<td><?php echo $count;?></td>
										<td><?php echo $row['lastName'];?>, <?php echo $row['firstName'];?> <?php echo $row['middleName'];?></td>
										<td><?php echo $row['collegeCode'];?></td>	
										<td><?php echo $row['email'];?></td>
					
										<td style="text-align:right;padding-right:5px;">
                                                                                <?php
                                                                                    if($_SESSION['userType']==1){
                                                                                ?>
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=personnel_view&personnel_ID=<?php echo $row['personnel_ID'];?>" ><img src="images/view.png" height="24px" width="24px" title="View details"></a> 
											<a href="index.php?unit=<?php echo $unit;?>&go=<?php echo $go;?>&task=personnel_edit&personnel_ID=<?php echo $row['personnel_ID'];?>" ><img src="images/edit_f2.png" height="24px" width="24px" title="Edit"></a>
											<img src="images/cancel_f2.png" height="24px" width="24px" title="Delete" onclick="javascript:deleteEntry('<?php echo $row['personnel_ID'];?>');">
                                                                                <?php
                                                                                    }
                                                                                ?>
										</td>
									</tr>
								
								<?php
									$count++;
									}
								}
								?>
								</tbody>
								
								</table>
								
								
								
						</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>