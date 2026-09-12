<?php
//require_once ("core.class.php");

# Helper class for the User table

class researcherType extends Core {

	var $resTypeID;
	var $type;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function researcherType() {
		$this->Core();
		$this->coreTable = "upmin_msp.researchertype";
	}
		
	function load($resTypeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE resTypeID='$resTypeID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->resTypeID=$row['resTypeID'];
		   	$this->type=$row['type'];
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function getResearchType($resTypeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE resTypeID='$resTypeID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['type']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['type'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by type asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(type,userID,dateCreated)".
				  " VALUES('$this->type','$this->userID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($resTypeID){
		$sql="UPDATE $this->coreTable set type='$this->type',userID='$this->userID' where resTypeID='$resTypeID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteResType($resTypeID){
				
		$sql="delete from $this->coreTable where resTypeID='$resTypeID'";
		$this->Execute($sql);	
	
	//echo $sql;  
	   return $this->sqlOK;  	   	
	}		
	
}


?>
