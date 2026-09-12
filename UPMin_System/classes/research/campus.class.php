<?php
//require_once ("core.class.php");

# Helper class for the User table

class campus extends Core {

	var $campusID;
	var $campusName;
	var $place;
	var $dateEstablished;
	var $chancellor;
	var $lastUpdated;
	var $dateCreated;
	//var $phoneNo;
	
	function campus() {
		$this->Core();
		$this->coreTable = "research.campus";
	}
		
	function load($campusID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE campusID='$campusID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->campusID=$row['campusID'];
			$this->campusName=$row['campusName'];
		   	$this->place=$row['place'];
			$this->dateEstablished=$row['dateEstablished'];
			$this->chancellor=$row['chancellor'];
		   	$this->lastUpdate=$row['lastUpdated'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function getcampusCode($campusID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE campusID='$campusID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['campusName']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['campusName'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by campusName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(campusName,place,dateEstablished,chancellor,dateCreated)".
				  " VALUES('$this->campusName','$this->place','$this->dateEstablished','$this->chancellor',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($campusID){
		$sql="UPDATE $this->coreTable set campusName='$this->campusName',place='$this->place',dateEstablished='$this->dateEstablished',chancellor='$this->chancellor' where campusID='$campusID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deletecampus($campusID){
				
		$sql="delete from $this->coreTable where campusID='$campusID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
