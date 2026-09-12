<?php

//require_once ("/../core.class.php");

class EducLevel extends Core{

    var $educLevelID;
    var $educLevelCode;
    var $educLevelName;
    
    function EducLevel(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.educlevel";
    }

    

    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load($educLevelID){
		 $sql="select * from $this->coreTable where educLevelID='$educLevelID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->educLevelID=$row['educLevelID'];
		 $this->educLevelCode=$row['educLevelCode'];
		 $this->educLevelName=$row['educLevelName'];
		 return $this->sqlOK;
	}

    function loadEducLevelID($educLevelName){
		 $sql="select 
		 educLevelID from $this->coreTable where educLevelName='$educLevelName'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->educLevelID=$row['educLevelID'];
		 return $this->sqlOK;
	}
	
	

	function save(){
	   $sql="INSERT INTO $this->coreTable(educLevelName,educLevelCode)".
	  " VALUES('$this->educLevelName','$this->educLevelCode')";
	   $this->Execute($sql);
	   return $this->sqlOK;;

	}
    
	function update($educLevelID){
	   $sql="UPDATE $this->coreTable SET ".
	   "educLevelName='$this->educLevelName',educLevelCode='$this->educLevelCode'WHERE educLevelID='$educLevelID'";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($educLevelID){
			$sql="delete from $this->coreTable WHERE educLevelID='$educLevelID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
