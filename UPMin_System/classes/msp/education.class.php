<?php
//require_once ("core.class.php");

# Helper class for the User table

class education extends Core {

	var $educationID;
	var $facultyID;
	var $level;
	var $yearGraduated;
	var $schoolName;
	var $degree;
	var $awards;	
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function education() {
		$this->Core();
		$this->coreTable = "upmin_msp.education";
	}
		
	function load($educationID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE educationID='$educationID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->educationID=$row['educationID'];
		   	$this->facultyID=$row['facultyID'];
		   	$this->level=$row['level'];
		   	$this->yearGraduated=$row['yearGraduated'];
		   	$this->schoolName=$row['schoolName'];
		   	$this->degree=$row['degree'];
		   	$this->awards=$row['awards'];   			   			   			   	
		   	
		   	$this->userID=$row['userID'];
		   	$this->lastUpdated=$row['lastUpdated'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}	
	
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by level asc,yearGraduated asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(facultyID,level,yearGraduated,schoolName,degree,awards,userID,dateCreated)".
				  " VALUES('$this->facultyID','$this->level','$this->yearGraduated','$this->schoolName','$this->degree','$this->awards','$this->userID',now())";					  	
		//echo $sql;		  
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($educationID){
		$sql="UPDATE $this->coreTable set level='$this->level,yearGraduated='$this->yearGraduated',schoolName='$this->schoolName',
		degree='$this->degree',awards='$this->awards',userID='$this->userID' where educationID='$educationID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteEducation($educationID){
				
		$sql="delete from $this->coreTable where educationID='$educationID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
