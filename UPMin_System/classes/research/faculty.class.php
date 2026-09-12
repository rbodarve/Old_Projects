<?php
//require_once ("core.class.php");

# Helper class for the User table

class faculty extends Core {

	var $facultyID;
	var $researcherCode;
	var $lastName;
	var $firstName;
	var $middleName;
	var $deptCode; //nag.add
	var $address;
	var $contactNo;
	var $specialty;
	var $salary;
	var $userID;
	var $dateCreated;
	var $lastUpdated;	
	
	
	
	function faculty() {
		$this->Core();
		$this->coreTable = "research.faculty";
	}
		
	function load($facultyID){		
		
		$sql="SELECT *,concat(lastName,' ,',firstName,' ',middleName) as fullName  FROM $this->coreTable WHERE facultyID='$facultyID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->facultyID=$row['facultyID'];
		   	$this->researcherCode=$row['researcherCode'];
		   	$this->lastName=$row['lastName'];
		   	$this->firstName=$row['firstName'];
		   	$this->middleName=$row['middleName'];
			$this->deptCode=$row['deptCode']; //nag.add
		   	$this->address=$row['address'];
		   	$this->contactNo=$row['contactNo'];
		   	$this->specialty=$row['specialty']; //nag.add
			$this->salary=$row['salary'];//nag.add
		   	$this->dateCreated=$row['dateCreated'];
		   	$this->lastUpdated=$row['lastUpdated'];
	   	 return $this->sqlOK;  		
	}
	
	function getFaculty($facultyID){		
		
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
		
		$sql="INSERT INTO $this->coreTable(lastName,firstName,middleName,deptCode,address,contactNo,researcherCode,specialty,salary,dateCreated)".
				  " VALUES('$this->lastName','$this->firstName','$this->middleName','$this->deptCode','$this->address','$this->contactNo',
				'$this->researcherCode','$this->specialty','$this->salary',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($facultyID){
		$sql="UPDATE $this->coreTable set lastName='$this->lastName',firstName='$this->firstName',middleName='$this->middleName',
			deptCode='$this->deptCode',address='$this->address',contactNo='$this->contactNo',
			 researcherCode='$this->researcherCode',specialty='$this->specialty',salary='$this->salary' where facultyID='$facultyID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteFaculty($facultyID){
				
		$sql="delete from $this->coreTable where facultyID='$facultyID'";
		$this->Execute($sql);	
	
	
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
	
	function search2($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE deptCode like '%$letter%'
				ORDER BY firstName, middleName, firstName ";
		$this->Execute($sql);		
	}
	
	function search3($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE researcherCode like '$letter%'
				ORDER BY firstName, middleName, firstName ";
		$this->Execute($sql);		
	}
        function search4($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE specialty like '$letter%'
				ORDER BY firstName, middleName, firstName ";
		$this->Execute($sql);		
	}
        function search5($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable as a join research.department as b join research.college as c
				WHERE b.deptCode=a.deptCode AND c.collegeName=b.collegeName AND campusName like '$letter%' 
				ORDER BY firstName, middleName, firstName ";
		$this->Execute($sql);		
	}
        function search6($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable as a join research.department as b
				WHERE b.deptCode=a.deptCode AND (collegeName like '%$letter%' OR collegeName like '%$letter%')
				ORDER BY firstName, middleName, firstName ";
		$this->Execute($sql);		
	}
        function search7($letter)
	{
		$sql = "SELECT * 
				FROM $this->coreTable as a join research.fresearch as b
				WHERE b.facultyID=a.facultyID AND rtitle like '$letter%'
				ORDER BY firstName, middleName, firstName ";
		$this->Execute($sql);		
	}
	
}


?>
