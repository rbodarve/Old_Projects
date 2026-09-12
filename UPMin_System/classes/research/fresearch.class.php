<?php
//require_once ("core.class.php");
//include_once("classes/middletier/research/journal.class.php");
# Helper class for the User table

class fresearch extends Core {

	var $researchID;
	var $journalID;
	var $fundAgencyID;
	var $startDate;
	var $endDate;
	var $rtitle;
	var $budget;
	var $facultyID;
	var $lastUpdated;
	var $dateCreated;
	
	function fresearch() {
		$this->Core();
		$this->coreTable = "research.fresearch";
	}
		
	function load($researchID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE researchID='$researchID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->researchID=$row['researchID'];
		   	$this->journalID=$row['journalID'];
		   	$this->fundAgencyID=$row['fundAgencyID'];
			$this->startDate=$row['startDate'];//add
		   	$this->endDate=$row['endDate'];//add
			$this->rtitle=$row['rtitle'];//add
			$this->budget=$row['budget'];
			$this->facultyID=$row['facultyID'];
			$this->lastUpdate=$row['lastUpdated'];
		   	$this->dateCreated=$row['dateCreated'];
			
	   	 return $this->sqlOK;  		
	}
	
/*	function getresearch($researchID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE researchID='$researchID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['rtitle']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['rtitle'];  		
		}
	   	 
	}	*/	
	function loadAll()
	{
		$sql="SELECT distinct * FROM $this->coreTable as a join research.fundingagency as b join research.journal as c join research.publication as d join research.faculty as e on a.fundAgencyID=b.fundAgencyID and 
		a.journalID=c.journalID and c.publicationID=d.publicationID and a.facultyID=e.facultyID order by rtitle asc";
		
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(journalID,fundAgencyID,startDate,endDate,rtitle,budget,facultyID,dateCreated)".
				  " VALUES('$this->journalID','$this->fundAgencyID','$this->startDate','$this->endDate','$this->rtitle','$this->budget','$this->facultyID',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($researchID){
		$sql="UPDATE $this->coreTable set journalID='$this->journalID',fundAgencyID='$this->fundAgencyID',startDate='$this->startDate',endDate='$this->endDate',
		rtitle='$this->rtitle',budget='$this->budget',facultyID='$this->facultyID' where researchID='$researchID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deletefresearch($researchID){
				
		$sql="delete from $this->coreTable where researchID='$researchID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	   return $this->sqlOK;  	   	
	}		
	
	function search($facultyID)
	{
		//$sql="SELECT researchID,rtitle,budget FROM $this->coreTable as a , research.faculty as b where a.facultyID=b.facultyID order by rtitle asc";
		$sql = "SELECT researchID,rtitle,budget FROM $this->coreTable where facultyID = '$facultyID'";
		//$sql="SELECT researchID,rtitle,budget FROM $this->coreTable as a left join research.faculty as b on a.facultyID=b.facultyID  where facultyID = '$facultyID' order by rtitle asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
        function res()
	{
		//$sql="SELECT researchID,rtitle,budget FROM $this->coreTable as a , research.faculty as b where a.facultyID=b.facultyID order by rtitle asc";
		$sql = "SELECT researchID,rtitle,budget FROM $this->coreTable where facultyID = '$facultyID'";
		//$sql="SELECT researchID,rtitle,budget FROM $this->coreTable as a left join research.faculty as b on a.facultyID=b.facultyID  where facultyID = '$facultyID' order by rtitle asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	
}


?>
