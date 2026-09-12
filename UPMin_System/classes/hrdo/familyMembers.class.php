<?php

//require_once ("/../core.class.php");

class familyMembers extends Core{

	var $familyMemberID;
	var $employeeInfoID;
	var $lastName;
	var $firstName;
	var $middleName;
	var $birthDate;
	var $sex;
	

	function familyMembers(){
		$this->Core();
		$this->coreTable = "jserp_hrdo.familymembers";
	}


	function loadAll($employeeInfoID){
		//$sql="select a.*,b.relationshipName from $this->coreTable as a join relationship as b where a.relationshipID=b.relationshipID and a.employeeInfoID='$employeeInfoID'";
		$sql="select * from $this->coreTable where employeeInfoID='$employeeInfoID'";
		$this->Execute($sql);
		//echo $sql;
		return $this->sqlOK;
	}



	function load_ID($familyMemberID){
		$sql="select * from $this->coreTable where familyMemberID='$familyMemberID'";
		$this->Execute($sql);
		$row=$this->result->FetchRow();
		$this->employeeInfoID=$row['employeeInfoID'];
		$this->lastName=$row['lastName'];
		$this->firstName=$row['firstName'];
		$this->middleName=$row['middleName'];
		$this->birthDate=$row['birthDate'];
		$this->sex=$row['sex'];
		

		return $this->sqlOK;
	}



	function save(){
		$sql="INSERT INTO $this->coreTable(employeeInfoID, lastName,firstName,middleName,birthDate,sex)".
		" VALUES('$this->employeeInfoID','$this->lastName','$this->firstName','$this->middleName','$this->birthDate','$this->sex')";
		//echo $sql;
		$this->Execute($sql);
		return $this->sqlOK;;

	}

	function update($familyMemberID){
		$sql="UPDATE $this->coreTable SET ".
		"lastName='$this->lastName',firstName='$this->firstName',middleName='$this->middleName',birthDate='$this->birthDate',sex='$this->sex' WHERE familyMemberID='$familyMemberID'";
		$this->Execute($sql);
		return $this->sqlOK;
	}

	function delete($familyMemberID){
		$sql="delete from $this->coreTable WHERE familyMemberID='$familyMemberID'";
		$this->Execute($sql);
		//echo $sql;
		return $this->sqlOK;
	}

}

?>
