<?php
//require_once ("core.class.php");

# Helper class for the User table

class fundingagency extends Core {

	var $fundAgencyID;
	var $agencyName;
	var $address;
	var $email;
	var $contactNo;
	var $website;
	var $contactPerson;
	var $lastUpdate;
	var  $dateCreated;
	
	function fundingagency() {
		$this->Core();
		$this->coreTable = "research.fundingagency";
	}
		
	function load($fundAgencyID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE fundAgencyID='$fundAgencyID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
		   	$this->fundAgencyID=$row['fundAgencyID'];
		   	$this->agencyName=$row['agencyName'];
		   	$this->address=$row['address'];
			$this->contactNo=$row['contactNo'];
		   	$this->email=$row['email'];
		   	$this->website=$row['website'];
		   	$this->contactPerson=$row['contactPerson'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by agencyName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(agencyName,address,contactNo,email,website,contactPerson,dateCreated)".
				  " VALUES('$this->agencyName','$this->address','$this->contactNo','$this->email','$this->website',
				  '$this->contactPerson',now())";					  	
//echo $sql;				  
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($fundAgencyID){
		$sql="UPDATE $this->coreTable set agencyName='$this->agencyName',address='$this->address',contactNo='$this->contactNo',email='$this->email',
		   website='$this->website',contactPerson='$this->contactPerson' where fundAgencyID='$fundAgencyID'";		
	//echo $sql;
	$this->Execute($sql);	
		
	return $this->sqlOK;  	   	
	}	

	function deleteAgency($fundAgencyID){
				
		$sql="delete from $this->coreTable where fundAgencyID='$fundAgencyID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
