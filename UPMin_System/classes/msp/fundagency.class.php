<?php
//require_once ("core.class.php");

# Helper class for the User table

class fundAgency extends Core {

	var $fundAgencyID;
	var $agencyName;
	var $address;
	var $email;
	var $website;
	var $telephone;
	var $mobilePhone;
	var $contactPerson;
	var $position;
	var $userID;
	var $lastUpdate;
	var  $dateCreated;
	
	function fundAgency() {
		$this->Core();
		$this->coreTable = "upmin_msp.fundagency";
	}
		
	function load($fundAgencyID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE fundAgencyID='$fundAgencyID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
		   	$this->fundAgencyID=$row['fundAgencyID'];
		   	$this->agencyName=$row['agencyName'];
		   	$this->address=$row['address'];
		   	$this->email=$row['email'];
		   	$this->website=$row['website'];
		   	$this->telephone=$row['telephone'];
		   	$this->mobilePhone=$row['mobilePhone'];
		   	$this->contactPerson=$row['contactPerson'];
		   	$this->position=$row['position'];   			   			   	
		   	$this->userID=$row['userID'];
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
		
		$sql="INSERT INTO $this->coreTable(agencyName,address,email,website,telephone,mobilePhone,contactPerson,position,userID,dateCreated)".
				  " VALUES('$this->agencyName','$this->address','$this->email','$this->website','$this->telephone',
				  '$this->mobilePhone','$this->contactPerson','$this->position','$this->userID',now())";					  	
//echo $sql;				  
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($fundAgencyID){
		$sql="UPDATE $this->coreTable set agencyName='$this->agencyName',address='$this->address',email='$this->email',
		   website='$this->website',telephone='$this->telephone',mobilePhone='$this->mobilePhone',contactPerson='$this->contactPerson',
		   position='$this->position',userID='$this->userID' where fundAgencyID='$fundAgencyID'";		
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
