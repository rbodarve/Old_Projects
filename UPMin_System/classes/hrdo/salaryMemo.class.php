<?php

//require_once ("/../core.class.php");

class salaryMemo extends Core{

    var $salarymemoID;
    var $salaryID;
    var $setBy;
    var $approvedBy;
    var $effectivityDate;
    var $status;
    var $remarks;
    var $employmentID;
    
    function salaryMemo(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.salarymemo";
    }

    
    function loadAll($employmentID){
    	$sql="select a.*,b.salaryRate from $this->coreTable as a join salaryrates as b where a.salaryID=b.salaryID  ";
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
	   	return $this->sqlOK;
	}

    
    
	function load_ID($salarymemoID){
		 $sql="select * from $this->coreTable where $salarymemoID='$salarymemoID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->$salarymemoID=$row['$salarymemoID'];
		 $this->$approvedBy=$row['approvedBy'];
		 $this->$setBy=$row['setBy'];
		 $this->$effectivityDate=$row['effectivityDate'];
		 $this->$salaryID=$row['salaryID'];
		 $this->$remarks=$row['remarks'];
		 $this->$employmentID=$row['employmentID'];
		
		 
		 return $this->sqlOK;
	}

	function load_Name($civilStatusName){
		 $sql="select * from $this->coreTable where civilStatusName='$civilStatusName'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->civilStatusID=$row['civilStatusID'];
		 $this->civilStatusCode=$row['civilStatusCode'];
		 $this->civilStatusName=$row['civilStatusName'];
		
		 
		 return $this->sqlOK;
	}
	
    function loadCivilStatusID($civilStatusName){
		 $sql="select 
		 $civilStatusID from $this->coreTable where civilStatusName='$civilStatusName'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->civilStatusID=$row['civilStatusID'];
		 return $this->sqlOK;
	}
	
	function save(){
	   $sql="INSERT INTO $this->coreTable(civilStatusName,civilStatusCode)".
	  " VALUES('$this->civilStatusName','$this->civilStatusCode')";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;;

	}
    
	function update($civilStatusID){
	   $sql="UPDATE $this->coreTable SET ".
	   "civilStatusName='$this->civilStatusName',civilStatusCode='$this->civilStatusCode' WHERE civilStatusID='$civilStatusID'";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($civilStatusID){
			$sql="delete from $this->coreTable WHERE civilStatusID='$civilStatusID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
