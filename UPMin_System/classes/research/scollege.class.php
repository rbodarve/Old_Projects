<?php
//require_once ("core.class.php");

# Helper class for the User table

class sCollege extends Core {

	var $sCollegeID;
	var $schoolID;
	var $collegeID;
	var $userID;
	var $dateCreated;
	
	
	
	function sCollege() {
		$this->Core();
		$this->coreTable = "upmin_msp.scollege";
	}
		
	function load($sCollegeID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE sCollegeID='$sCollegeID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->sCollegeID=$row['sCollegeID'];
		   	$this->schoolID=$row['schoolID'];
		   	$this->collegeID=$row['collegeID'];
		   	$this->userID=$row['userID'];   			   	
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}	
	
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable as a left join upmin_msp.college as b on a.collegeID=b.collegeID left join
		upmin_msp.school as c on a.schoolID=c.schoolID order by schoolID asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function loadBySchool($schoolID)
	{
		$sql="SELECT * FROM $this->coreTable as a left join upmin_msp.college as b on a.collegeID=b.collegeID left join
		upmin_msp.school as c on a.schoolID=c.schoolID where a.schoolID='$schoolID' order by a.schoolID asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){

		$sql="select * from $this->coreTable where schoolID='$this->schoolID' and collegeID='$this->collegeID'";
		//echo $sql;
		$this->Execute($sql);
		
		if($this->count < 1)
		{
		$sql="INSERT INTO $this->coreTable(schoolID,collegeID,userID,dateCreated)".
				  " VALUES('$this->schoolID','$this->collegeID','$this->userID',now())";					  	
		//echo "<br>".$sql;
		$this->Execute($sql);	
		}
	   return $this->sqlOK;  	   	
	}	
	

	function deleteCollege($sCollegeID){
				
		$sql="delete from $this->coreTable where sCollegeID='$sCollegeID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
