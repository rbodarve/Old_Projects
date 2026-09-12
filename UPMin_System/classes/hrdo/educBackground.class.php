<?php

//require_once ("/../core.class.php");

class educBackground extends Core{

    var $employeeInfoID;
    var $educLevelID;
    var $educbackgroundID;
    var $degree;
    var $honors;
    var $school;
    var $incDates;
    
    
    
    function educBackground(){
        $this->Core();
		$this->coreTable = "jserp_hrdo.educbackground";
    }

    
    function loadAll($employeeInfoID){
		$sql="select * from $this->coreTable as a left join educlevel as b on a.educLevelID=b.educLevelID where a.employeeInfoID='$employeeInfoID'";
		//$sql="select * from $this->coreTable where employeeInfoID='$employeeInfoID'";
		//echo $sql;
        $this->Execute($sql);
	   	 return $this->sqlOK;
	}

    
    
	function load_ID($educbackgroundID){
		 $sql="select * from $this->coreTable where educbackgroundID='$educbackgroundID'";
		 $this->Execute($sql);
		 $row=$this->result->FetchRow();
		 $this->educbackgroundID=$row['educbackgroundID'];
		 $this->employeeInfoID=$row['employeeInfoID'];
		 $this->educLevelID=$row['educLevelID'];
		 $this->school=$row['school'];
		 $this->degree=$row['degree'];
		 $this->honors=$row['honors'];
		 $this->incDates=$row['incDates'];
		 //echo $sql;
		 return $this->sqlOK;
	}

	
	
   
	function save(){
	   $sql="INSERT INTO $this->coreTable(educLevelID,school,degree,honors,incDates,employeeInfoID)".
	  " VALUES('$this->educLevelID','$this->school','$this->degree','$this->honors','$this->incDates','$this->employeeInfoID')";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;;

	}
    
	function update($educbackgroundID){
	   $sql="UPDATE $this->coreTable SET ".
	   "educLevelID='$this->educLevelID',school='$this->school',degree='$this->degree',honors='$this->honors',incDates='$this->incDates' WHERE educbackgroundID='$educbackgroundID'";
	    $this->Execute($sql);
	    // echo $sql;
	   return $this->sqlOK;
	}

	function delete($educbackgroundID){
			$sql="delete from $this->coreTable WHERE educbackgroundID='$educbackgroundID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}

?>
