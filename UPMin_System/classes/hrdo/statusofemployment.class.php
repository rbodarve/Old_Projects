<?php

//require_once ("/../core.class.php");

class StatusOfEmployment extends Core{

    var $statusID;
    var $employmentID;
    var $positionID;
    var $dateStart;
    var $dateEnd;
    var $status;
    var $statusofemploymentID;
    
    
    
    function StatusOfEmployment(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.statusofemployment";
    }

    

    function loadAll($employmentID){
		$sql="select * from $this->coreTable as a left join employmentstatus as b on a.statusID=b.statusID where a.employmentID='$employmentID'";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load($employmentID){
		 $sql="select * from $this->coreTable where employmentID='$employmentID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->statusID=$row['statusID'];
		 $this->StatusOfEmploymentID=$row['statusofemploymentID'];
		 $this->employmentID=$row['employmentID'];
		 $this->positionID=$row['positionID'];
		 $this->fromDate=$row['fromDate'];
		 $this->toDate=$row['toDate'];
		 $this->status=$row['status'];
		  echo $sql;
	   	 return $this->sqlOK;
	}

  

	function save(){
	   $sql="INSERT INTO $this->coreTable(employmentID,statusID,fromDate,toDate,status)".
	  " VALUES('$this->employmentID','$this->statusID','$this->fromDate','$this->toDate','$this->status')";
	   $this->Execute($sql);
	   //echo $sql;
	   return $this->sqlOK;;

	}
    
	function update($statusofemploymentID){
	   $sql="UPDATE $this->coreTable SET ".
	   "statusID='$this->statusID',
	    fromDate='$this->fromDate', 
	    toDate='$this->toDate' ,
	    status='$this->status' WHERE statusofemploymentID='$statusofemploymentID'";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($statusofemploymentID){
			$sql="delete from $this->coreTable WHERE statusofemploymentID='$statusofemploymentID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
