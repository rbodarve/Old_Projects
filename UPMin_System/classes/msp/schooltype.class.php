<?php
//require_once ("core.class.php");

# Helper class for the User table

class schoolType extends Core {

	var $schoolTypeID;
	var $schoolTypeName;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function schoolType() {
		$this->Core();
		$this->coreTable = "upmin_msp.schooltype";
	}
		
	function load($schoolTypeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE schoolTypeID='$schoolTypeID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->schoolTypeID=$row['schoolTypeID'];
		   	$this->schoolTypeName=$row['schoolTypeName'];
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function getSchoolType($schoolTypeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE schoolTypeID='$schoolTypeID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['schoolTypeName']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['schoolTypeName'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by schoolTypeName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(schoolTypeName,userID,dateCreated)".
				  " VALUES('$this->schoolTypeName','$this->userID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($schoolTypeID){
		$sql="UPDATE $this->coreTable set schoolTypeName='$this->schoolTypeName',userID='$this->userID' where schoolTypeID='$schoolTypeID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteschoolType($schoolTypeID){
				
		$sql="delete from $this->coreTable where schoolTypeID='$schoolTypeID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
