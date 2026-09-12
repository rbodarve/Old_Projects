<?php
//require_once ("/../core.class.php");


class positionType extends Core{

    var $positionTypeID;
    var $positionTypeName;
    var $positionTypeDesc;

    function positionType(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.positiontype";
    }
    
    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
        //echo $sql;
	   	 return $this->sqlOK;
	}
    
	
    function load($positionTypeID){
				
		$sql="SELECT * FROM $this->coreTable WHERE positionTypeID='$positionTypeID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
	    	$this->positionTypeID=$row['positionTypeID'];
	   		$this->positionTypeName=$row['positionTypeName'];
	   		$this->positionTypeDesc=$row['positionTypeDesc'];
	   			   			   		
	   	 //print_r($row);
	   	 return $this->sqlOK;  
		
	}
	
	function loadPositionTypeName($positionTypeName){
		
		//if(!$myid)$id=$this->userid;
		$sql="SELECT * FROM $this->coreTable WHERE positionTypeName='$positionTypeName'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
		   	$this->positionTypeID=$row['positionTypeID'];
	   		$this->positionTypeName=$row['positionTypeName'];
	   		$this->positionTypeDesc=$row['positionTypeDesc'];
	   				   			   		
	   	//	print_r($row);
	   	 return $this->sqlOK;  
		
	}
		
	
	function save() {
				
		$sql="INSERT INTO $this->coreTable(positionTypeName,positionTypeDesc) ".
		     "VALUES('$this->positionTypeName','$this->positionTypeDesc')";
		//echo $sql;
		$this->Execute($sql);		
			return $this->sqlOK;
		
	}

	function update($positionTypeID){
	   $sql="UPDATE $this->coreTable SET ".
	   "positionTypeName='$this->positionTypeName',positionTypeDesc='$this->positionTypeDesc'
	    WHERE positionTypeID='$positionTypeID'";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($positionTypeID){
			$sql="delete from $this->coreTable WHERE positionTypeID='$positionTypeID'";
			//echo $sql;
			$this->Execute($sql);
	        return $this->sqlOK;
	}	
}

?>
