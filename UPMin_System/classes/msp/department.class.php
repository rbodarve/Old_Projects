<?php
//require_once ("core.class.php");

# Helper class for the User table

class department extends Core {

	var $deptID;
	var $deptName;
	var $deptCode;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	
	function department() {
		$this->Core();
		$this->coreTable = "upmin_msp.department";
	}
		
	function load($deptID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE deptID='$deptID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->deptID=$row['deptID'];
		   	$this->deptName=$row['deptName'];
		   	$this->deptCode=$row['deptCode'];
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		
	   	 return $this->sqlOK;  		
	}
	
	function getdeptCode($deptID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE deptID='$deptID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['deptName']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['deptName'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by deptName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(deptName,deptCode,userID,dateCreated)".
				  " VALUES('$this->deptName','$this->deptCode','$this->userID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($deptID){
		$sql="UPDATE $this->coreTable set deptName='$this->deptName',deptCode='$this->deptCode',userID='$this->userID' where deptID='$deptID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteDepartment($deptID){
				
		$sql="delete from $this->coreTable where deptID='$deptID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
