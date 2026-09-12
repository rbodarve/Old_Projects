<?php

# Helper class for the User table

class userRole extends Core {	
	var $userroleID;	
	var $userID;
	var $moduleID;	
	function userRole() {
		$this->Core();
		$this->coreTable = "research.userrole";		
	}		
	function load($userroleID){
		$sql="SELECT * FROM $this->coreTable WHERE userroleID='$userroleID'";
                $this->Execute($sql);
		$row=$this->result->FetchRow();	  
	    	$this->userroleID=$row['userroleID'];
	    	$this->userID=$row['userID'];
	    	$this->moduleID=$row['moduleID'];
	   	return $this->sqlOK;  
	}
	function loadAll(){				
		$sql="SELECT * FROM $this->coreTable as a left join research.user as b on a.userID=b.userID left join research.module as c on a.moduleID=b.moduleID";
		$this->Execute($sql);
                return $this->sqlOK;  		
	}
	function loadModule($userID)		
	{
		$sql="SELECT * FROM $this->coreTable as a join research.module as b on a.moduleID=b.moduleID where userID='$userID'";
		$this->Execute($sql);
                return $this->sqlOK;  		
	}	
	function verifyAccess($userID,$module)	
	{		
		$sql="SELECT * FROM $this->coreTable as a left join research.module as b on a.moduleID=b.moduleID where userID='$userID' and b.moduleName='$module'";
		$this->Execute($sql);
		if($this->count >0)
		{
			return true;
		}
		else 
		{
			return false;
		}		
	}		
	function verifyModule($userID,$moduleID)	
	{		
		$sql="SELECT * FROM $this->coreTable where userID='$userID' and moduleID='$moduleID'";
		$this->Execute($sql);
		if($this->count >0)
		{
			return true;
		}
		else 
		{
			return false;
		}		
	}		
	function save() {			
		$sql="INSERT INTO $this->coreTable(userID,moduleID) ".
		     "VALUES('$this->userID','$this->moduleID')";
		$this->Execute($sql);		
		return $this->sqlOK;
		
	}	
	function deleteRole($userroleID){
		$this->sql = "DELETE FROM $this->coreTable WHERE userroleID='$userroleID'";
		return ($this->Execute($this->sql));
	}
	function deleteAllRole($userID) {
		$this->sql = "DELETE FROM $this->coreTable WHERE userID='$userID'";
		return ($this->Execute($this->sql));
	}
	
}
?>