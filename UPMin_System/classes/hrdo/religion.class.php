<?php

//require_once ("/../core.class.php");

class Religion extends Core{

    var $religionID;
    var $religionCode;
    var $religionName;
    
    
    function Religion(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.religion";
    }

    

    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load($religionID){
		 $sql="select * from $this->coreTable where religionID='$religionID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->religionID=$row['religionID'];
		 $this->religionCode=$row['religionCode'];
		 $this->religionName=$row['religionName'];
		 		 
	   	 return $this->sqlOK;
	}

    function loadreligionID($religionName){
		 $sql="select 
		 religionID from $this->coreTable where religionName='$religionName'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->religionID=$row['religionID'];
		 return $this->sqlOK;
	}
	
	

	function save(){
	   $sql="INSERT INTO $this->coreTable(religionName,religionCode)".
	  " VALUES('$this->religionName','$this->religionCode')";
	   $this->Execute($sql);
	   return $this->sqlOK;;

	}
    
	function update($religionID){
	   $sql="UPDATE $this->coreTable SET ".
	   "religionName='$this->religionName',religionCode='$this->religionCode' WHERE religionID='$religionID'";
	  // echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($religionID){
			$sql="delete from $this->coreTable WHERE religionID='$religionID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
