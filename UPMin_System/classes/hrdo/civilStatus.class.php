<?php

//require_once ("/../core.class.php");

class civilStatus extends Core{

    var $civilStatusID;
    var $civilStatusCode;
    var $civilStatusName;
    
    function civilStatus(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.civilstatus";
    }

    
    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load_ID($civilStatusID){
		 $sql="select * from $this->coreTable where civilStatusID='$civilStatusID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->civilStatusID=$row['civilStatusID'];
		 $this->civilStatusCode=$row['civilStatusCode'];
		 $this->civilStatusName=$row['civilStatusName'];
		
		 
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
