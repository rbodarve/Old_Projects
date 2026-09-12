<?php
//require_once ("core.class.php");

# Helper class for the User table

class researcher extends Core {

	var $researcherID;
	var $resTypeID;
	var $idNumber;
	var $researcherName;
	var $collegeCode;
	var $emailAddress;	
	var $mobilePhone;
	var $telephone;	
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function researcher() {
		$this->Core();
		$this->coreTable = "upmin_msp.researcher";
	}
		
	function load($researcherID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE researcherID='$researcherID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
		   	$this->researcherID=$row['researcherID'];
		   	$this->resTypeID=$row['resTypeID'];
		   	$this->idNumber=$row['idNumber'];
		   	$this->researcherName=$row['researcherName'];
		   	$this->resTypeID=$row['resTypeID'];
		   	$this->emailAddress=$row['emailAddress'];
		   	$this->collegeCode=$row['collegeCode'];
		   	$this->mobilePhone=$row['mobilePhone'];
		   	$this->telephone=$row['telephone'];  		   			   			   	
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}	
	
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable as a left join upmin_msp.researchertype as b on a.resTypeID=b.resTypeID order by a.researcherName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(idNumber,researcherName,resTypeID,emailAddress,collegeCode,mobilePhone,telephone,userID,dateCreated)".
				  " VALUES('$this->idNumber','$this->researcherName','$this->resTypeID','$this->emailAddress','$this->collegeCode','$this->mobilePhone','$this->telephone','$this->userID',now())";					  	
		//echo $sql;
				  $this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($researcherID){
		$sql="UPDATE $this->coreTable set idNumber='$this->idNumber',researcherName='$this->researcherName'".
		",resTypeID='$this->resTypeID',emailAddress='$this->emailAddress',collegeCode='$this->collegeCode',".
		"mobilePhone='$this->mobilePhone',telephone='$this->telephone',userID='$this->userID' ".
		"where researcherID='$researcherID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteReseacher($researcherID){
				
		$sql="delete from $this->coreTable where researcherID='$researcherID'";
		$this->Execute($sql);	
	
	//echo $sql;  
	   return $this->sqlOK;  	   	
	}		
	
}


?>
