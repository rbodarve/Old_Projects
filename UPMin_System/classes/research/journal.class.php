<?php
//require_once ("core.class.php");

# Helper class for the User table

class journal extends Core {

	var $journalID;
	var $datePublished;
	var $journalTitle;
	var $volume;
	var $editor;
	var $publicationID;
	var $issue;
	var $ISSN;
	var $lastUpdated;
	var $dateCreated;
	
	function journal() {
		$this->Core();
		$this->coreTable = "research.journal";
	}
		
	function load($journalID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE journalID='$journalID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->journalID=$row['journalID'];
			$this->datePublished=$row['datePublished'];//add
		   	$this->journalTitle=$row['journalTitle'];
		   	$this->volume=$row['volume'];
			$this->editor=$row['editor'];
			$this->publicationID=$row['publicationID'];
			$this->issue=$row['issue'];
			$this->ISSN=$row['ISSN'];
			$this->lastUpdate=$row['lastUpdated'];
		   	$this->dateCreated=$row['dateCreated'];
			
	   	 return $this->sqlOK;  		
	}
	
	function getjournal($journalID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE journalID='$journalID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['editor']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['editor'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by editor asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(journalTitle,datePublished,volume,editor,publicationID,issue,ISSN,dateCreated)".
				  " VALUES('$this->journalTitle','$this->datePublished','$this->volume','$this->editor','$this->publicationID',
				  '$this->issue','$this->ISSN',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($journalID){
		$sql="UPDATE $this->coreTable set  journalTitle='$this->journalTitle',datePublished='$this->datePublished',volume='$this->volume',
		editor='$this->editor',publicationID='$this->publicationID',issue='$this->issue',ISSN='$this->ISSN' where journalID='$journalID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deletejournal($journalID){
				
		$sql="delete from $this->coreTable where journalID='$journalID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
