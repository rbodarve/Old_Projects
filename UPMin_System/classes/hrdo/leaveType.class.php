<?php

//require_once ("/../core.class.php");

class leaveType extends Core{

    var $leaveTypeID;
    var $leaveTypeName;
    var $description;
    var $maximumDays;
    
    function leaveType(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.leavetype";
    }

    
    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load_ID($leaveTypeID){
		 $sql="select * from $this->coreTable where leaveTypeID='$leaveTypeID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->leaveTypeIDID=$row['leaveTypeID'];
		 $this->leaveTypeName=$row['leaveTypeName'];
		 $this->description=$row['description'];
		 $this->maximumDays=$row['maximumDays'];
		
		 
		 return $this->sqlOK;
	}

	
	
   
	
	

	function save(){
	   $sql="INSERT INTO $this->coreTable(leaveTypeName,description,maximumDays)".
	  " VALUES('$this->leaveTypeName','$this->description','$this->maximumDays')";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;;

	}
    
	function update($leaveTypeID){
	   $sql="UPDATE $this->coreTable SET ".
	   "leaveTypeName='$this->leaveTypeName',description='$this->description',maximumDays='$this->maximumDays' WHERE leaveTypeID='$leaveTypeID'";
	   echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($leaveTypeID){
			$sql="delete from $this->coreTable WHERE leaveTypeID='$leaveTypeID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
