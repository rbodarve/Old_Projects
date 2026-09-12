<?php
//require_once ("/../core.class.php");

# Helper class for the User table

class employeeDiscount extends Core {

	var $employeeDiscountID;
	var $positionID;
	var $statusID;
	var $discountRate;
	
    
	function employeeDiscount() {
		$this->Core();
		$this->coreTable = "jserp_hrdo.employeediscount";
	}	
	
	function loadAll(){
		$sql="select * from $this->coreTable  ";
        $this->Execute($sql);
        //echo $sql;
	   	 return $this->sqlOK;
	}
	
	function loadlist(){
		$sql="select employeeDiscountID,discountRate,
		(select positionName from position as b where b.positionID=a.positionID ) as positionName,
		 (select statusName from employmentstatus as c where c.statusID=a.statusID ) as statusName from $this->coreTable as a  ";
        $this->Execute($sql);
        //echo $sql;
	   	 return $this->sqlOK;
	}
	

	
	function loadID($employeeDiscountID){
				
		$sql="SELECT * FROM $this->coreTable WHERE employeeDiscountID='$employeeDiscountID' ";
		//echo $sql;
		    $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
	    	$this->employeeDiscountID=$row['employeeDiscountID'];
	   		$this->statusID=$row['statusID'];
	   		$this->positionID=$row['positionID'];
	   		$this->discountRate=$row['discountRate'];	   			   			   		
	   			   		
	   	  //print_r($row);
	   	 return $this->sqlOK;  
		
	}
	
	function loadpos_stat($statusID,$positionID){
				
		$sql="SELECT * FROM $this->coreTable WHERE statusID='$statusID' and  positionID='$positionID' ";
		//echo $sql;
		    $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
	    	$this->employeeDiscountID=$row['employeeDiscountID'];
	   		$this->statusID=$row['statusID'];
	   		$this->positionID=$row['positionID'];
	   		$this->discountRate=$row['discountRate'];	   			   			   		
	   			   		
	   	  //print_r($row);
	   	 return $this->sqlOK;  
		
	}
	
		
	function save() {
				
		$sql="INSERT INTO $this->coreTable (positionID,statusID,discountRate) ".
		     "VALUES('$this->positionID','$this->statusID','$this->discountRate')";
		echo $sql;
		$this->Execute($sql);		
		
	    return $this->sqlOK;
		
	}

	function update($employeeDiscountID){
	   $sql="UPDATE $this->coreTable SET ".
	   "positionID='$this->positionID',statusID='$this->statusID',
	   discountRate='$this->discountRate' WHERE employeeDiscountID='$employeeDiscountID'";
	   echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($employeeDiscountID){
			$sql="delete from $this->coreTable WHERE employeeDiscountID='$employeeDiscountID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}


?>