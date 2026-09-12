<?php
# Helper class for the Office table

class officepersonnel extends Core {

	var $officepersonnelID;
	var $personnelID;
	var $officeID;
	var $fromDate;
	var $toDate;
	var $remarks;
	
	function officepersonnel() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.officepersonnel";
	}
	
	function loadAll(){
		$sql="SELECT * FROM $this->coreTable";
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}

	function loadByOffice(){
		$sql="SELECT * FROM $this->coreTable
				WHERE officeID = $this->officeID";
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}
	
	function save(){
		$sql="INSERT INTO $this->coreTable (
				personnelID,
				officeID,
				fromDate,
				toDate,
				remarks
				) VALUES (
				$this->personnelID,
				$this->officeID,
				'$this->fromDate',
				'$this->toDate',
				'$this->remarks'
				)";
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}
	
	function searchPer($search){
		$sql="SELECT * FROM $this->coreTable WHERE personnelID in (SELECT personnelID from personnel where firstName LIKE '%$search%' || lastName LIKE '%$search%' || middleName LIKE '%$search%' )";
		//echo $sql;
		$this->Execute($sql);
		return $this->sqlOK;
	}
	
	function searchOff($search){
		$sql="SELECT * FROM $this->coreTable WHERE officeID in (SELECT officeID from office where officeName LIKE '%$search%')";
		//echo $sql;
		$this->Execute($sql);
		return $this->sqlOK;
	}
	
	function getOfficeID($officePersonnelID){
		$sql="SELECT officeID FROM $this->coreTable WHERE officePersonnelID='$officePersonnelID'";
		$this->Execute($sql);
		$row=$this->result->FetchRow();	
		$this->officeID=$row['officeID'];
		
		return $this->sqlOK;
	}
}

?>