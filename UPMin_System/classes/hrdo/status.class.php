<?php

//require_once ("/../core.class.php");

class Status extends Core{

    var $statusID;
    var $statusCode;
    var $statusName;
    var $statusDesc;
    var $statusDuration;
    
    
    function Status(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.employmentstatus";
    }

    

    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load($statusID){
		 $sql="select * from $this->coreTable where statusID='$statusID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->statusID=$row['statusID'];
		 $this->statusCode=$row['statusCode'];
		 $this->statusName=$row['statusName'];
		 $this->statusDesc=$row['statusDesc'];
		 $this->statusDuration=$row['statusDuration'];
		 
	   	 return $this->sqlOK;
	}

    function loadStatusID($statusName){
		 $sql="select 
		 statusID from $this->coreTable where statusName='$statusName'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->statusID=$row['statusID'];
		 return $this->sqlOK;
	}
	
	

	function save(){
	   $sql="INSERT INTO $this->coreTable(statusName,statusCode,statusDesc,statusDuration)".
	  " VALUES('$this->statusName','$this->statusCode','$this->statusDesc','$this->statusDuration')";
	   $this->Execute($sql);
	   return $this->sqlOK;;

	}
    
	function update($statusID){
	   $sql="UPDATE $this->coreTable SET ".
	   "statusName='$this->statusName',statusCode='$this->statusCode', 
	   statusDesc='$this->statusDesc' , statusDuration='$this->statusDuration' WHERE statusID='$statusID'";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($statusID){
			$sql="delete from $this->coreTable WHERE statusID='$statusID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
