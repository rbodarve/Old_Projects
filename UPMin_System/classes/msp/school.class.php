<?php
//require_once ("core.class.php");

# Helper class for the User table

class school extends Core {

	var $schoolID;
	var $schoolName;
	var $schoolTypeID;
	var $schoolCode;
	var $heiCode;
	var $address;
	var $telephone;
	var $fax;
	var $mobile;
	var $email;
	var $website;
	var $userID;
	var $dateCreated;
	var $lastUpdate;
	
	function school() {
		$this->Core();
		$this->coreTable = "upmin_msp.school";
	}
		
	function load($schoolID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE schoolID='$schoolID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->schoolID=$row['schoolID'];
		   	$this->schoolName=$row['schoolName'];
		   	$this->schoolCode=$row['schoolCode'];
		   	$this->heiCode=$row['heiCode'];
		   	$this->schoolTypeID=$row['schoolTypeID'];
		   	$this->address=$row['address'];
		   	$this->telephone=$row['telephone'];
		   	$this->fax=$row['fax'];
		   	$this->mobile=$row['mobile'];
		   	$this->email=$row['email'];		   			   			   	
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		   	$this->website=$row['website'];
		
	   	 return $this->sqlOK;  		
	}
	
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable as a left join upmin_msp.schooltype as b on a.schoolTypeID=b.schoolTypeID order by schoolCode asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(schoolName,schoolCode,schoolTypeID,address,telephone,fax,mobile,email,website,userID,dateCreated,heiCode)".
				  " VALUES('$this->schoolName','$this->schoolCode','$this->schoolTypeID','$this->address','$this->telephone','$this->fax'
				  ,'$this->mobile','$this->email','$this->website','$this->userID',now(),'$this->heiCode')";					  	
				  echo $sql;
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($schoolID){
		$sql="UPDATE $this->coreTable set schoolName='$this->schoolName',schoolCode='$this->schoolCode',schoolTypeID='$this->schoolTypeID',address='$this->address',
		telephone='$this->telephone',fax='$this->fax',mobile='$this->mobile',email='$this->email',website='$this->website',userID='$this->userID',heiCode='$this->heiCode' where schoolID='$schoolID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteSchool($schoolID){
				
		$sql="delete from $this->coreTable where schoolID='$schoolID'";
		//echo $sql;  
		$this->Execute($sql);		
	   return $this->sqlOK;  	   	
	}		
	
}


?>
