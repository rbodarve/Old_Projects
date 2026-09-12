<?php

//require_once ("/../core.class.php");

class SalaryRates extends Core{

    var $salaryID;
    var $salaryCode;
    var $salaryRate;
    
    function salaryRates(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.salaryrates";
    }

    

    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load($salaryID){
		 $sql="select * from $this->coreTable where salaryID='$salaryID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->salaryID=$row['salaryID'];
		 $this->salaryCode=$row['salaryCode'];
		 $this->salaryRate=$row['salaryRate'];
		 
	   	 return $this->sqlOK;
	}

    function loadSalaryID($salaryRate){
		 $sql="select 
		 salaryID from $this->coreTable where salaryCode='$salaryRate'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->salaryID=$row['salaryID'];
		 return $this->sqlOK;
	}
	
	

	function save(){
	   $sql="INSERT INTO $this->coreTable(salaryCode,salaryRate)".
	  " VALUES('$this->salaryCode','$this->salaryRate')";
	   $this->Execute($sql);
	   //echo $sql;
	   return $this->sqlOK;;

	}
    
	function update($salaryID){
	   $sql="UPDATE $this->coreTable SET ".
	   "salaryCode='$this->salaryCode',salaryRate='$this->salaryRate'WHERE salaryID='$salaryID'";
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($salaryID){
			$sql="delete from $this->coreTable WHERE salaryID='$salaryID'";
			$this->Execute($sql);
			return $this->sqlOK;
	}	

}

?>
