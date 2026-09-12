<?php
//require_once ("core.class.php");

# Helper class for the User table

class fundType extends Core {

	var $fundTypeID;
	var $fundTypeName;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function fundType() {
		$this->Core();
		$this->coreTable = "research.fundtype";
	}
		
	function load($fundTypeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE fundTypeID='$fundTypeID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->fundTypeID=$row['fundTypeID'];
		   	$this->fundTypeName=$row['fundTypeName'];
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function getResearchType($fundTypeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE fundTypeID='$fundTypeID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['fundTypeName']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['fundTypeName'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by fundTypeName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(fundTypeName,userID,dateCreated)".
				  " VALUES('$this->fundTypeName','$this->userID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($fundTypeID){
		$sql="UPDATE $this->coreTable set fundTypeName='$this->fundTypeName',userID='$this->userID' where fundTypeID='$fundTypeID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteFundType($fundTypeID){
				
		$sql="delete from $this->coreTable where fundTypeID='$fundTypeID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
