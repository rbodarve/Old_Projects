<?php
//require_once ("core.class.php");

# Helper class for the User table

class personnel extends Core {

	var $personnel_ID;
	var $lastName;
	var $firstName;
	var $middleName;
	var $collegeCode;
	var $email;
	var $contactNo;
	var $salary;
	var $dateCreated;
	var $lastUpdated;	
	
	function personnel() {
		$this->Core();
		$this->coreTable = "research.personnel";
	}
		
	function load($personnel_ID){		
		
		$sql="SELECT *,concat(lastName,' , ',firstName,' ',middleName) as fullName  FROM $this->coreTable WHERE personnel_ID='$personnel_ID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();
			
		   	$this->personnel_ID=$row['personnel_ID'];		 		   	
		   	$this->lastName=$row['lastName'];
		   	$this->firstName=$row['firstName'];
		   	$this->middleName=$row['middleName'];
			$this->collegeCode=$row['collegeCode']; //nag.add   	
		   	$this->email=$row['email'];
		   	$this->contactNo=$row['contactNo'];
		   	$this->salary=$row['salary'];
		
	   	 return $this->sqlOK;  		
	}	
	
	function getPersonnel($personnel_ID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE personnel_ID='$personnel_ID'";
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
		
		$sql="INSERT INTO $this->coreTable(lastName,firstName,middleName,collegeCode,email,contactNo,salary,dateCreated)".
				  " VALUES('$this->lastName','$this->firstName','$this->middleName','$this->collegeCode','$this->email',
				  '$this->contactNo','$this->salary',now())";					  	
		$this->Execute($sql);	

	   return $this->sqlOK;   	
	}	
	
	function update($personnel_ID){
		$sql="UPDATE $this->coreTable set lastName='$this->lastName',firstName='$this->firstName',middleName='$this->middleName',
			collegeCode='$this->collegeCode',email='$this->email',contactNo='$this->contactNo',salary='$this->salary' where personnel_ID='$personnel_ID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deletePersonnel($personnel_ID){
				
		$sql="delete from $this->coreTable where personnel_ID='$personnel_ID'";
		$this->Execute($sql);	
	
	//echo $sql;  
	   return $this->sqlOK;  	   	
	}
        function search($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE lastName like '$letter%' OR firstName like '$letter%' OR middleName like '$letter%'
				ORDER BY firstName, middleName, lastName ";
		$this->Execute($sql);		
	}
        
        function search5($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable as a join research.college as b
				WHERE b.collegeCode=a.collegeCode AND campusName like '%$letter%' 
				ORDER BY firstName, middleName, lastName ";
		$this->Execute($sql);		
	}
        function search6($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE collegeCode like '$letter%'
				ORDER BY firstName, middleName, lastName ";
		$this->Execute($sql);		
	}
	
}


?>
