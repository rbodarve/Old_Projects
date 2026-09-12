<?php
//require_once ("core.class.php");

# Helper class for the User table

class projectStatus extends Core {

	var $projStatusID;
	var $projStatusName;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function projectStatus() {
		$this->Core();
		$this->coreTable = "upmin_msp.projstatus";
	}
		
	function load($projStatusID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE projStatusID='$projStatusID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->projStatusID=$row['projStatusID'];
		   	$this->projStatusName=$row['projStatusName'];
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function getResearchType($projStatusID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE projStatusID='$projStatusID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['projStatusName']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['projStatusName'];  		
		}	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by projStatusName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(projStatusName,userID,dateCreated)".
				  " VALUES('$this->projStatusName','$this->userID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($projStatusID){
		$sql="UPDATE $this->coreTable set projStatusName='$this->projStatusName',userID='$this->userID' where projStatusID='$projStatusID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteProjectStatus($projStatusID){
				
		$sql="delete from $this->coreTable where projStatusID='$projStatusID'";
		$this->Execute($sql);	
	
	//echo $sql;  
	   return $this->sqlOK;  	   	
	}		
	
}


?>
