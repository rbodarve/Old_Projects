<?php
//require_once ("/../core.class.php");

# Helper class for the User table

class Employment extends Core {

	var $employmentID;
	var $employeeInfoID;
	var $positionID;
	var $positionName;
	var $startDate;
	var $remarks;
	var $officeID;
	var $branchID;
	var $statusID;
	
	
    
	function Employment() {
		$this->Core();
		$this->coreTable = "jserp_hrdo.employment";
	}	
	
	function loadAll($employeeInfoID){
		$sql="select * from $this->coreTable as a left join position as b on a.positionID=b.positionID  where employeeInfoID='$employeeInfoID'  ";
        $this->Execute($sql);
        //echo $sql;
	   	 return $this->sqlOK;
	}
	
	
	function loademployment($employmentID){
				
		$sql="SELECT * FROM $this->coreTable WHERE employmentID='$employmentID'";
		
		    $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
	    	$this->employmentID=$row['employmentID'];
	   		$this->employeeInfoID=$row['employeeInfoID'];
	   		$this->positionID=$row['positionID'];
	   		$this->startDate=$row['startDate'];	   			   			   		
	   		$this->remarks=$row['remarks'];	   			   			   		
	   		$this->officeID=$row['officeID'];	   			   			   		
	   		$this->branchID=$row['branchID'];	   			   			   		
	   		
	   	 //echo $sql;	   		
	   	 //  print_r($row);
	   	 return $this->sqlOK;  
		
	}
	
	
	
	function save() {
				
		$sql="INSERT INTO $this->coreTable (employeeInfoID,positionID,startDate,remarks,officeID,branchID) ".
		     "VALUES('$this->employeeInfoID','$this->positionID','$this->startDate','$this->remarks','$this->officeID','$this->branchID')";
		
		$this->Execute($sql);		
		//echo $sql;
		 return $this->lastid;
		
	}

	function update($employmentID){
	   $sql="UPDATE $this->coreTable SET ".
	   "startDate='$this->startDate',
	   remarks='$this->remarks',
	   officeID='$this->officeID',
	   branchID='$this->branchID'
	   WHERE employmentID='$employmentID'";
	  // echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($employmentID){
			$sql="delete from $this->coreTable WHERE employmentID='$employmentID'";
			 //echo $sql;
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}


?>