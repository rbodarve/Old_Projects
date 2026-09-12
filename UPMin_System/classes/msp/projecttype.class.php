<?php
//require_once ("core.class.php");

# Helper class for the User table

class projectType extends Core {

	var $projTypeID;
	var $projTypeName;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function projectType() {
		$this->Core();
		$this->coreTable = "upmin_msp.projecttype";
	}
		
	function load($projTypeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE projTypeID='$projTypeID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->projTypeID=$row['projTypeID'];
		   	$this->projTypeName=$row['projTypeName'];
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	

	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by projTypeName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(projTypeName,userID,dateCreated)".
				  " VALUES('$this->projTypeName','$this->userID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($projTypeID){
		$sql="UPDATE $this->coreTable set projTypeName='$this->projTypeName',userID='$this->userID' where projTypeID='$projTypeID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteProjectType($projTypeID){
				
		$sql="delete from $this->coreTable where projTypeID='$projTypeID'";
		$this->Execute($sql);	
	
	//echo $sql;  
	   return $this->sqlOK;  	   	
	}		
	
}


?>
