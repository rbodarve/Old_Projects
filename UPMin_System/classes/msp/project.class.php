<?php
//require_once ("core.class.php");

# Helper class for the User table

class projectResearch extends Core {

	var $projectID;
	VAR $projTypeID;
	var $projectName;
	var $fundID;
	var $budget;
	var $collegeCode;
	var $startDate;
	var $endDate;
	var $remarks;
	var $projStatusID;
	var $userID;
	var $lastUpdate;
	var $dateCreated;
	var $fundName;
	var $status;
	var $projectType;
	
	function projectResearch() {
		$this->Core();
		$this->coreTable = "upmin_msp.project";
	}
		
	function load($projectID){		
		
		//$sql="SELECT * FROM $this->coreTable WHERE projectID='$projectID'";
		$sql="SELECT * FROM $this->coreTable as a left join upmin_msp.fund as b on a.fundID=b.fundID left
		 join upmin_msp.projecttype as c on a.projTypeID=c.projTypeID left join upmin_msp.projstatus as d 
		 on a.projStatusID=d.projStatusID  where a.projectID='$projectID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->projectID=$row['projectID'];
		   	$this->projectName=$row['projectName'];
		   	$this->fundID=$row['fundID'];
		   	$this->budget=$row['budget'];
		   	$this->collegeCode=$row['collegeCode'];
		   	$this->startDate=$row['startDate'];
		   	$this->endDate=$row['endDate'];
		   	$this->projTypeID=$row['projTypeID'];
		   	$this->remarks=$row['remarks'];		   		   			   	
		   	$this->projStatusID=$row['projStatusID'];
		   	$this->userID=$row['userID'];
		   	$this->lastUpdate=$row['lastUpdate'];
		   	$this->dateCreated=$row['dateCreated'];
		   	$this->fundName=$row['fundName'];
		   	$this->projectType=$row['projTypeName'];
		   	$this->status=$row['projStatusName'];
		
	   	 return $this->sqlOK;  		
	}
		
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable as a left join upmin_msp.fund as b on a.fundID=b.fundID left
		 join upmin_msp.projecttype as c on a.projTypeID=c.projTypeID left join upmin_msp.projstatus as d on a.projStatusID=d.projStatusID 
		 order by projectName asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(projectname,fundID,budget,collegeCode,startDate,endDate,remarks,
		projStatusID,projTypeID,userID,dateCreated) VALUES('$this->projectName','$this->fundID','$this->budget',
		'$this->collegeCode','$this->startDate','$this->endDate','$this->remarks','$this->projStatusID',
		'$this->projTypeID','$this->userID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($projectID){
		$sql="UPDATE $this->coreTable set projectName='$this->projectName',fundID='$this->fundID',budget='$this->budget'
		,collegeCode='$this->collegeCode',startDate='$this->startDate',endDate='$this->endDate',projStatusID='$this->projStatusID'
		,remarks='$this->remarks',projTypeID='$this->projTypeID',userID='$this->userID' where projectID='$projectID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deleteProject($projectID){
				
		$sql="delete from $this->coreTable where projectID='$projectID'";
		$this->Execute($sql);	
	
	//echo $sql;  
	   return $this->sqlOK;  	   	
	}		
	
}


?>
