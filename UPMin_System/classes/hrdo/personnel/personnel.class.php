<?php

# Helper class for the User table

class personnel extends Core {

	var $personnelID;
	var $employeeNumber;
	var $firstName;
	var $middleName;
	var $lastName;
	var $ext;
	var $status;
		
	
	function personnel() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.personnel";
	}	

	function loadAll(){
		$sql="SELECT * FROM $this->coreTable";
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}
	
	function loadCusInfo($itemID)
	{
		$sql="SELECT * FROM $this->coreTable WHERE personnelID = '$itemID'";
		//echo $s
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	
	function loadCusInfo2($itemID)
	{
		$sql="SELECT * FROM $this->coreTable WHERE personnelID = '$itemID'";
		//echo $s
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	
	function loadName($itemID)
	{
		$sql="SELECT * FROM $this->coreTable WHERE firstName LIKE '%$itemID%' OR lastName LIKE '%$itemID%' ORDER BY lastName ASC";
		//echo $s
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}

	function loadLimit($limit=20){
		$sql = "SELECT * 
				FROM $this->coreTable
				ORDER BY lastName, firstName, middleName
				limit $limit";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}
	
	function loadByLastLetter($letter){
		if(!isset($letter))
			$this->loadLimit();
		else {
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE lastName like '$letter%'
				ORDER BY lastName, firstName, middleName";
		//echo "<br>".$sql;
		$this->Execute($sql);
		}
	}
	
	function save(){
		$sql = "INSERT INTO $this->coreTable (
				employeeNumber,
				firstName,
				middleName,
				lastName,
				ext,
				status
				) VALUES (
				'$this->employeeNumber',
				'$this->firstName',
				'$this->middleName',
				'$this->lastName',
				'$this->ext',
				1
				)";
		//echo "<br>".$sql;
		$this->Execute($sql);		
	}
	
	function loadByEmployeeNumber(){
		$sql = "SELECT * FROM $this->coreTable
				WHERE employeeNumber = '$this->employeeNumber'";
		$this->Execute($sql);
		$row = $this->result->FetchRow();
		$this->personnelID = $row['personnelID'];
		$this->employeeNumber = $row['employeeNumber'];
		$this->firstName = $row['firstName'];
		$this->middleName = $row['middleName'];
		$this->lastName = $row['lastName'];
		$this->ext = $row['ext'];
		$this->status = $row['status'];
	}
	
	function  load($id){
		$sql = "SELECT * FROM $this->coreTable
				WHERE personnelID = '$id'";
		//echo "<br>".$sql;
		$this->Execute($sql);
		$row = $this->result->FetchRow();
		$this->personnelID = $row['personnelID'];
		$this->employeeNumber = $row['employeeNumber'];
		$this->firstName = $row['firstName'];
		$this->middleName = $row['middleName'];
		$this->lastName = $row['lastName'];
		$this->ext = $row['ext'];
		$this->status = $row['status'];
	}
}
?>