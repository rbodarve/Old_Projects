<?php
//require_once ("core.class.php");

# Helper class for the User table

class resPosition extends Core {

	var $resPosID;
	var $resPosName;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function resPosition() {
		$this->Core();
		$this->coreTable = "upmin_msp.resposition";
	}
		
	function load($resPosID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE resPosID='$resPosID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->resPosID=$row['resPosID'];
		   	$this->resPosName=$row['resPosName'];
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function getResearchType($resPosID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE resPosID='$resPosID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['resPosName']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['resPosName'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by resPosName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(resPosName,userID,dateCreated)".
				  " VALUES('$this->resPosName','$this->userID',now())";					  	
		echo $sql;
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($resPosID){
		$sql="UPDATE $this->coreTable set resPosName='$this->resPosName',userID='$this->userID' where resPosID='$resPosID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteResPosition($resPosID){
				
		$sql="delete from $this->coreTable where resPosID='$resPosID'";
		$this->Execute($sql);	
	
	//echo $sql;  
	   return $this->sqlOK;  	   	
	}		
	
}


?>
