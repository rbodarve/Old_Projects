<?php
//require_once ("core.class.php");

# Helper class for the User table

class faculty extends Core {

	var $facultyID;
	var $researcherCode;
	var $lastName;
	var $firstName;
	var $middleName;
	var $address;
	var $telephone;
	var $mobile;
	var $email;
	var $userID;
	var $dateCreated;
	var $lastUpdated;	
	
	
	
	function faculty() {
		$this->Core();
		$this->coreTable = "upmin_msp.faculty";
	}
		
	function load($facultyID){		
		
		$sql="SELECT *,concat(lastName,', ',firstName,' ',middleName) as fullName  FROM $this->coreTable WHERE facultyID='$facultyID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->facultyID=$row['facultyID'];
		   	$this->researcherCode=$row['researcherCode'];
		   	$this->lastName=$row['lastName'];
		   	$this->firstName=$row['firstName'];
		   	$this->middleName=$row['middleName'];
		   	$this->address=$row['address'];
		   	$this->telephone=$row['telephone'];
		   	$this->mobile=$row['mobile'];
		   	$this->email=$row['email'];
		   	$this->userID=$row['userID'];
		   	$this->dateCreated=$row['dateCreated'];
		   	$this->lastUpdated=$row['lastUpdated'];
	   	 return $this->sqlOK;  		
	}
	
	function getFaculy($facultyID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE facultyID='$facultyID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		return $row['lastName']." ,".$row['firstName']." ".$row['middleName'];
	   	 
	}
	function loadAll()
	{
		$sql="SELECT *,concat(lastName,', ',firstName,' ',middleName) as fullName FROM $this->coreTable order by lastName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(lastName,firstName,middleName,address,telephone,mobile,email,userID,dateCreated,researcherCode)".
				  " VALUES('$this->lastName','$this->firstName','$this->middleName','$this->address','$this->telephone',
				  '$this->mobile','$this->email','$this->userID',now(),'$this->researcherCode')";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($facultyID){
		$sql="UPDATE $this->coreTable set lastName='$this->lastName',firstName='$this->firstName',middleName='$this->middleName',
			 address='$this->address',telephone='$this->telephone',mobile='$this->mobile',email='$this->email',userID='$this->userID',
			 researcherCode='$this->researcherCode' where facultyID='$facultyID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteFaculty($facultyID){
				
		$sql="delete from $this->coreTable where facultyID='$facultyID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
