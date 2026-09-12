<?php

//require_once ("/../core.class.php");

class Training extends Core{

    var $trainingID;
    var $trainingTitle;
    var $description;
    var $fromDate;
    var $toDate;
    var $conductedBy;
    
    function Training(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.training";
    }

    
    function loadAll(){
		$sql="select * from $this->coreTable ";
        $this->Execute($sql);
        return $this->sqlOK;
	}

    
    
	function load_ID($trainingID){
		 $sql="select * from $this->coreTable where trainingID='$trainingID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->trainingID=$row['trainingID'];
		 $this->trainingTitle=$row['trainingTitle'];
		 $this->description=$row['description'];
		 $this->fromDate=$row['fromDate'];
		 $this->toDate=$row['toDate'];
		 $this->conductedBy=$row['conductedBy'];
		
		// echo $sql;
		 return $this->sqlOK;
	}

	
	
   

	function save(){
	   $sql="INSERT INTO $this->coreTable(trainingTitle, description,fromDate,toDate,conductedBy)".
	  " VALUES('$this->trainingTitle','$this->description','$this->fromDate','$this->toDate','$this->conductedBy')";
	  // echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;;

	}
    
	function update($trainingID){
	   $sql="UPDATE $this->coreTable SET ".
	   "trainingTitle='$this->trainingTitle',
	    description='$this->description',
	    fromDate='$this->fromDate',
	    toDate='$this->toDate',
	    conductedBy='$this->conductedBy'
	    WHERE trainingID='$trainingID'";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($trainingID){
			$sql="delete from $this->coreTable WHERE trainingID='$trainingID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
