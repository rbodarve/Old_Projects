<?php

require_once ("/../core.class.php");


class Budget extends Core{

    var $budget_id;
    var $budget_allocated;
    var $budget_actual;
 	
    function Budget(){
        $this->Core();
		$this->coreTable = "upmin_training.budget";
    }
	
	function getID(){
		$sql="select budget_id FROM $this->coreTable 
			where budget_allocated='$budget_allocated' AND 
			budget_actual='$budget_actual'";
        return $this->Execute($sql);
	}

    
    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
        return $this->sqlOK;
	}
    
	function load_id($budget_id){
		 $sql="select * from $this->coreTable where budget_id='$budget_id'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->budget_id=$row['budget_id'];
		 $this->budget_actual=$row['budget_actual'];
		 $this->budget_allocated=$row['budget_allocated'];
		 $this->budget_remarks=$row['budget_remarks'];
		
		 return $this->sqlOK;
	}

	function save(){
	   $sql="INSERT INTO $this->coreTable(
			budget_allocated, 
			budget_actual)". 
			" VALUES(
			'$this->budget_allocated',
			'$this->budget_actual')";
	  
	   $this->Execute($sql);
	   return $this->sqlOK;
	}
    
	function update($budget_id){
	   $sql="UPDATE $this->coreTable SET
			budget_allocated='$this->budget_allocated',
			budget_actual='$this->budget_actual'
			WHERE budget_id='$budget_id'";
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($budget_id){
			$sql="DELETE FROM $this->coreTable WHERE budget_id='$budget_id'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	
}
?>