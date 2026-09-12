<?php

# Helper class for the User table

class module extends Core {	
	
	var $moduleID;	
	var $moduleName;

	function module() {
		$this->Core();
		$this->coreTable = "research.module";
	}		
	function load($moduleID){
		$sql="SELECT * FROM $this->coreTable WHERE moduleID='$moduleID'";
		$this->Execute($sql);
		$row=$this->result->FetchRow();	  
	    	$this->moduleID=$row['moduleID'];	    	
	    	$this->moduleName=$row['moduleName'];
	   	return $this->sqlOK;  
		
	}
	function loadAll(){				
		$sql="SELECT * FROM $this->coreTable order by moduleName ";
		$this->Execute($sql);
	   	return $this->sqlOK;  		
	}
	function getModuleName($moduleID)		
	{
		$sql="SELECT * FROM $this->coreTable as a where moduleID='$moduleID'";
		$this->Execute($sql);
		if($this->count > 0)
		{
			$row=$this->result->FetchRow();
			return $row['moduleName'];
		}
	   	return $this->sqlOK;  		
	}	
	function save() {			
		$sql="INSERT INTO $this->coreTable(moduleName) ".
		     "VALUES('$this->moduleName')";
		$this->Execute($sql);		
		return $this->sqlOK;
	}	
	function updateOffice($moduleID) {
		$officeName = safeString($this->officeName);
		$sql="UPDATE $this->coreTable SET moduleName='$this->moduleName' where moduleID='$moduleID'";
		$this->Execute($sql);		
		return $this->sqlOK;
		
	}
	function deleteModule($moduleID) {
		$this->sql = "DELETE FROM $this->coreTable WHERE moduleID='$moduleID'";
		return ($this->Execute($this->sql));
	}
	
}

?>