<?php

//require_once ("/../core.class.php");

class Relationship extends Core{

    var $relationshipID;
    var $relationshipCode;
    var $relationshipName;
    
    function Relationship(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.relationship";
    }

    
    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load_ID($relationshipID){
		 $sql="select * from $this->coreTable where relationshipID='$relationshipID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->relationshipID=$row['relationshipID'];
		 $this->relationshipCode=$row['relationshipCode'];
		 $this->relationshipName=$row['relationshipName'];
		 
		 return $this->sqlOK;
	}

	function load_Name($relationshipName){
		 $sql="select * from $this->coreTable where relationshipName='$relationshipName'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->relationshipID=$row['relationshipID'];
		 
		 
		 return $this->sqlOK;
	}
	
    function save(){
	   $sql="INSERT INTO $this->coreTable(relationshipName,relationshipCode)".
	  " VALUES('$this->relationshipName','$this->relationshipCode')";
	   $this->Execute($sql);
	   //echo $sql;
	   return $this->sqlOK;;

	}
    
	function update($relationshipID){
	   $sql="UPDATE $this->coreTable SET ".
	   "relationshipName='$this->relationshipName',relationshipCode='$this->relationshipCode' WHERE relationshipID='$relationshipID'";
	   //$this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($relationshipID){
			$sql="delete from $this->coreTable WHERE relationshipID='$relationshipID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
