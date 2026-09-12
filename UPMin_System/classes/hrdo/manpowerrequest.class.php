<?php
//require_once ("/../core.class.php");

# Helper class for the User table

class manpowerRequest extends Core {

	var $manpowerRequestID;
	var $departmentID;
	var $sectionID;
	var $positionID;
	var $noMale;
	var $noFemale;
	var $dateFiled;
	var $dateNeeded;
	var $civilStatusID;
	var $ageFrom;
	var $ageTo;
	var $workExperience;
	var $jobSpecification;
	var $requestReason;
	var $requestedBy;
	var $educLevelID;
	var $trainingDetails;
	var $status;
	var $justification;
	
    
	function manpowerRequest() {
		$this->Core();
		$this->coreTable = "jserp_hrdo.manpowerrequest";
	}	
	
	function loadAll(){
		$sql="select * from $this->coreTable  ";
        $this->Execute($sql);
        //echo $sql;
	   	 return $this->sqlOK;
	}
	
	function loadlist(){
		$sql="select dateFiled,noMale,noFemale,manpowerRequestID,
		(select positionName from position as b where b.positionID=a.positionID ) as positionName		
		 from $this->coreTable as a ";
        $this->Execute($sql);
        //echo $sql;
	   	 return $this->sqlOK;
	}
	
	
	function loadrequestID($manpowerRequestID){
				
		$sql="SELECT * FROM $this->coreTable WHERE manpowerRequestID='$manpowerRequestID'";
		//echo $sql;
		    $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
	    	$this->manpowerRequestID=$row['manpowerRequestID'];
	    	$this->departmentID=$row['departmentID'];
	    	$this->sectionID=$row['sectionID'];
	    	$this->positionID=$row['positionID'];
	    	$this->noFemale=$row['noFemale'];
	    	$this->noMale=$row['noMale'];
	    	$this->dateFiled=$row['dateFiled'];
	    	$this->dateNeeded=$row['dateNeeded'];
	    	$this->civilStatusID=$row['civilStatusID'];
	    	$this->ageFrom=$row['ageFrom'];
	    	$this->ageTo=$row['ageTo'];
	    	$this->workExperience=$row['workExperience'];
	    	$this->jobSpecification=$row['jobSpecification'];
	    	$this->requestReason=$row['requestReason'];
	    	$this->requestedBy=$row['requestedBy'];
	    	$this->educLevelID=$row['educLevelID'];
	    	$this->trainingDetails=$row['trainingDetails'];
	    	$this->status=$row['status'];
	    	$this->status=$row['justification'];
	    	   		   		
	   	 // print_r($row);
	   	 return $this->sqlOK;  
		
	}
	
	
	function save() {
				
		$sql="INSERT INTO $this->coreTable (departmentID,
		sectionID,
		positionID,
		noFemale,
		noMale,
		dateFiled,
		dateNeeded,
		civilStatusID,
		ageFrom,
		ageTo,
		workExperience,
		jobSpecification,
		requestReason,
		requestedBy,
		educLevelID,
		trainingDetails,
		justification) ".
		"VALUES('$this->departmentID',
		'$this->sectionID',
		'$this->positionID',
		'$this->noFemale',
		'$this->noMale',
		'$this->dateFiled',
		'$this->dateNeeded',
		'$this->civilStatusID',
		'$this->ageFrom',
		'$this->ageTo',
		'$this->workExperience',
		'$this->jobSpecification',
		'$this->requestReason',
		'$this->requestedBy',
		'$this->educLevelID',
		'$this->trainingDetails',
		'$this->justification')";
		
		$this->Execute($sql);		
		//echo $sql;
			return $this->sqlOK;
		
	}

	function update($manpowerRequestID){
	   $sql="UPDATE $this->coreTable SET ".
	   "departmentID='$this->departmentID',
	   sectionID='$this->sectionID',
	   positionID='$this->positionID',
	   noFemale='$this->noFemale',
	   noMale='$this->noMale',
	   dateFiled='$this->dateFiled',
	   dateNeeded='$this->dateNeeded',
	   civilStatusID='$this->civilStatusID',
	   ageFrom='$this->ageFrom',
	   ageTo='$this->ageTo',
	   workExperience='$this->workExperience',
	   jobSpecification='$this->jobSpecification',
	   requestReason='$this->requestReason',
	   requestedBy='$this->requestedBy',
	   educLevelID='$this->educLevelID',
	   trainingDetails='$this->trainingDetails',
	   justification='$this->justification'	   
	    WHERE manpowerRequestID='$manpowerRequestID'";
	   //echo $sql;
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($manpowerRequestID){
			$sql="delete from $this->coreTable WHERE manpowerRequestID='$manpowerRequestID'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	

}


?>