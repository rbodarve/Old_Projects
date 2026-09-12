<?php
//require_once ("core.class.php");

# Helper class for the User table

class projRes extends Core {

	var $projResID;
	var $researcherID;
	var $projectID;
	var $resPosID;
	var $salaryType;
	var $salaryAmount;
	var $pstatus;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	
	
	
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function projRes() {
		$this->Core();
		$this->coreTable = "upmin_msp.projres";
	}
		
	function load($projResID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE projResID='$projResID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->projResID=$row['projResID'];
		   	
		
	   	 return $this->sqlOK;  		
	}
	
	function getResearchType($projResID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE projResID='$projResID'";
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
	function update($projResID){
		$sql="UPDATE $this->coreTable set projStatusName='$this->projStatusName',userID='$this->userID' where projResID='$projResID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteProjectStatus($projResID){
				
		$sql="delete from $this->coreTable where projResID='$projResID'";
		$this->Execute($sql);	
	
	//echo $sql;  
	   return $this->sqlOK;  	   	
	}		
	
}


?>
