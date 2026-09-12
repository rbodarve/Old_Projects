<?php
class office extends Core {

	var $officeID;
	var $officeCode;
	var $officeName;
	var $parentID;
	var $status;
	
	function office() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.office";
	}
	
	function loadDesig($id){
		$sql="SELECT * FROM upmin_spmo_admin.designation WHERE designationID = '$id'" ;
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}
	
	function load($officeID){
		$sql="SELECT * FROM $this->coreTable WHERE officeID='$officeID'";
		//echo $sql;
		$this->Execute($sql);
		$row=$this->result->FetchRow();
	    $this->officeID=$row['officeID'];
	   	$this->officeCode=$row['officeCode'];
	   	$this->officeName=$row['officeName'];
	   	$this->status=$row['status'];	   			   			   		
	   	$this->parentID=$row['parentID'];
	   	//	print_r($row);
	   	return $this->sqlOK;
	}
	
	function getOfficeList(){
		$sql="SELECT * FROM $this->coreTable
				ORDER BY officeName";
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}

	function loadAll(){
		$sql="SELECT * FROM $this->coreTable";
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}
	
	function save(){
		$sql="INSERT INTO $this->coreTable
				(officeCode, officeName, parentID)
				VALUES ('$this->officeCode','$this->officeName','$this->parentID')";
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}

	function update(){
		$sql="UPDATE $this->coreTable SET 
				officeCode = '$this->officeCode', 
				officeName = '$this->officeName', 
				parentID = '$this->parentID'
				WHERE officeID = $this->officeID";
		//echo $sql;
		$this->Execute($sql);
	   	return $this->sqlOK;
	}
	
	function getOfficeCode($officeID){
		$sql="SELECT officeCode FROM $this->coreTable WHERE officeID='$officeID'";
		//echo $sql;
		$this->Execute($sql);
		$row=$this->result->FetchRow();	
		$this->officeCode=$row['officeCode'];
		return $this->sqlOK;
	}
	
	function loadDepInfo($itemID)
	{
		$sql="SELECT * FROM $this->coreTable WHERE officeID = '$itemID'";
		//echo $s
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	
	function loadDepInfo2($itemID)
	{
		$sql="SELECT * FROM $this->coreTable WHERE officeName = '$itemID'";
		//echo $s
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	
	function loadDepInfo3($itemID)
	{
		$sql="SELECT * FROM $this->coreTable WHERE officeCode = '$itemID'";
		//echo $s
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
}

?>