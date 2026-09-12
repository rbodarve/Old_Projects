<?php
//require_once ("/../core.class.php");

# Helper class for the User table

class Position extends Core {

	var $userID;
	var $positionName;
	var $positionDesc;
	var $positionTypeID;
	
    
	function Position() {
		$this->Core();
		$this->coreTable = "jserp_hrdo.position";
	}	
	
	function loadAll(){
		$sql="select a.*,b.positionTypeName from $this->coreTable as a join positiontype as b on a.positionTypeID=b.positionTypeID  ";
        $this->Execute($sql);
        //echo $sql;
	   	 return $this->sqlOK;
	}
	
	function loadAll_type(){
		$sql="select a.*,b.positionTypeName from $this->coreTable as a join positiontype as b on a.positionTypeID=b.positionTypeID  ";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}
	
	function loadpositionID($positionID){
				
		$sql="SELECT * FROM $this->coreTable WHERE positionID='$positionID'";
		//echo $sql;
		    $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
	    	$this->positionID=$row['positionID'];
	   		$this->positionName=$row['positionName'];
	   		$this->positionDesc=$row['positionDesc'];
	   		$this->positionTypeID=$row['positionTypeID'];	   			   			   		
	   			   		
	   	  //print_r($row);
	   	 return $this->sqlOK;  
		
	}
	
	function loadPositionName($positionName){
		
		//if(!$myid)$id=$this->userid;
		$sql="SELECT * FROM $this->coreTable WHERE positionName='$positionName'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
		   	$this->positionID=$row['positionID'];
	   		$this->positionName=$row['positionName'];
	   		$this->positionDesc=$row['positionDesc'];
	   		$this->positionTypeID=$row['positionTypeID'];	   			   			   		
		   			   		
	   	//	print_r($row);
	   	 return $this->sqlOK;  
		
	}
		
	
	function save() {
				
		$sql="INSERT INTO $this->coreTable (positionName,positionDesc,positionTypeID) ".
		     "VALUES('$this->positionName','$this->positionDesc','$this->positionTypeID')";
		
		$this->Execute($sql);		
		
			return $this->sqlOK;
		
	}

	function update($positionID){
	   $sql="UPDATE $this->coreTable SET ".
	   "positionName='$this->positionName',positionDesc='$this->positionDesc',
	   positionTypeID='$this->positionTypeID' WHERE positionID='$positionID'";
	  // echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($positionID){
			$sql="delete from $this->coreTable WHERE positionID='$positionID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}


?>