<?php
//require_once ("core.class.php");

# Helper class for the User table

class college extends Core {

	var $collegeName;
	var $collegeCode;
	var $campusName;
	var $dean;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	//var $phoneNo;
	
	function college() {
		$this->Core();
		$this->coreTable = "research.college";
	}
		
	function load($collegeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE collegeID='$collegeID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->collegeID=$row['collegeID'];
		   	$this->collegeName=$row['collegeName'];
		   	$this->collegeCode=$row['collegeCode'];
			$this->campusName=$row['campusName'];//add
		   	$this->dean=$row['dean'];//add
			//$this->phoneNo=$row['phoneNo'];//add
			$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function getCollegeCode($collegeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE collegeID='$collegeID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['collegeName']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['collegeName'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by collegeName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(collegeName,collegeCode,campusName,dean,userID,dateCreated)".
				  " VALUES('$this->collegeName','$this->collegeCode','$this->campusName','$this->dean','$this->userID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($collegeID){
		$sql="UPDATE $this->coreTable set collegeName='$this->collegeName',collegeCode='$this->collegeCode',campusName='$this->campusName',dean='$this->dean',userID='$this->userID' where collegeID='$collegeID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteCollege($collegeID){
				
		$sql="delete from $this->coreTable where collegeID='$collegeID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
