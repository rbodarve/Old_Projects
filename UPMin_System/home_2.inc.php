<?php
include_once("classes/middletier/setup/userrole.class.php");

$userRole=new userRole();
?>

<div id="wrapper">

  <div id="page" align="center">
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
											MAIN MENU
										</div>
									</div>
								</div>
								<div class="clear"></div>		
							</div>	
						<div class="content" align="left"> <!-- put your content here   -->																
					  
						<div class="triboxes">                     
                         	<?php
							  
								//TRAINING MODULE FOR ADMIN
							  if($userRole->verifyAccess($_SESSION['userID'],"pt") || $_SESSION['userType']==1)
							  {
							?>	

								<div class="tribox2"> 
					     				<div class="triboxitems"> 
                    						<div class="triboximage"> 
                       	  							<a href="index.php?unit=pt&go=home&task=index"> <img border="0" src="images/modules/hrdo.png" alt="PERSONNEL TRAININGS" align="left"/></a>                        				                       
                       	   					</div> 
                        					<div class="triboxtext"> 
                        					<span class="triboxtexttitle"><a href="index.php?unit=pt&go=home&task=index">Personnel Trainings</a></span><br />
											<span class="triboxtextowner">&nbsp;</span><br /> 
											<span class="triboxtexttotal">&nbsp;</span> 
                      						</div> 
                    		   		 	</div> 
                         		</div>                        				
                         	<?php
							  }
						
							?>	
							
							<?php
							  
								//TRAINING MODULE FOR USER
							  if($userRole->verifyAccess($_SESSION['userID'],"tracker") || $_SESSION['userType']==2)
							  {
							?>	
					<!-- Personnel Training FOR USERS Insert starts here-->

								<div class="tribox2"> 
					     				<div class="triboxitems"> 
                    						<div class="triboximage"> 
                       	  							<a href="index.php?unit=pt_user&go=home&task=index"> <img border="0" src="images/modules/hrdo.png" alt="PERSONNEL TRAININGS" align="left"/></a>                        				                       
                       	   					</div> 
                        					<div class="triboxtext"> 
                        					<span class="triboxtexttitle"><a href="index.php?unit=pt_user&go=home&task=index">MY Trainings</a></span><br />
											<span class="triboxtextowner">&nbsp;</span><br /> 
											<span class="triboxtexttotal">&nbsp;</span> 
                      						</div> 
                    		   		 	</div> 
                         		</div>         							
					<!-- Personnel Training FOR USERS Insert ends here-->
                         	<?php
							  }
						
							?>	
							
							
							
                         		<div class="clear">&nbsp;</div>                		
                		</div>                		
					</div>						
					</div>		<!-- end of contents -->
					</div>
			</div>
			<!--GOLD BOX TEMPLATE ENDS HERE -->
  </div>	
</div>