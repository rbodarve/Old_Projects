<?php
//require_once ("core.class.php");

# Helper class for the User table

class fund extends Core {

	var $fundID;
	var $fundAgencyID;
	var $fundName;
	var $amount;
	var $dateReceived;
	var $lastUpdate;
	var $dateCreated;
	var $remarks;
	var $userID;
	
	function fund() {
		$this->Core();
		$this->coreTable = "research.fund";
	}
		
	function load($fundID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE fundID='$fundID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->fundID=$row['fundID'];
		   	$this->fundName=$row['fundName'];
		   	$this->fundAgencyID=$row['fundAgencyID'];
		   	$this->amount=$row['amount'];
		   	$this->dateReceived=$row['dateReceived'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		   	$this->remarks=$row['remarks'];
			$this->userID=$row['userID'];
		
	   	 return $this->sqlOK;  		
	}	
	
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable as a left join research.fundingagency as b on a.fundAgencyID=b.fundAgencyID order by fundName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(fundName,fundAgencyID,amount,dateReceived,remarks,userID,dateCreated)".
				  " VALUES('$this->fundName','$this->fundAgencyID','$this->amount','$this->dateReceived','$this->remarks','$this->userID',now())";					  	
		//echo $sql;		  
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($fundID){
		$sql="UPDATE $this->coreTable set fundName='$this->fundName',fundAgencyID='$this->fundAgencyID',
		amount='$this->amount',dateReceived='$this->dateReceived',remarks='$this->remarks',userID='$this->userID' where fundID='$fundID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deletefund($fundID){
				
		$sql="delete from $this->coreTable where fundID='$fundID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
