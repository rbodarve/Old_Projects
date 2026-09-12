<?php
//require_once ("core.class.php");

# Helper class for the User table

class publication extends Core {

	var $publicationID;
	var $title;
	var $publisher;
	var $volumeNo;
	var $edition;
	var $lastUpdated;
	var $dateCreated;
	
	function publication() {
		$this->Core();
		$this->coreTable = "research.publication";
	}
		
	function load($publicationID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE publicationID='$publicationID'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		   	$this->publicationID=$row['publicationID'];
		   	$this->title=$row['title'];
			$this->publisher=$row['publisher'];//add
		   	$this->volumeNo=$row['volumeNo'];//add
		   	$this->edition=$row['edition'];
			$this->lastUpdate=$row['lastUpdated'];
		   	$this->dateCreated=$row['dateCreated'];
			
	   	 return $this->sqlOK;  		
	}
	
	function getPublication($publicationID){		
		
		$sql="SELECT * FROM $this->coreTable WHERE publicationID='$publicationID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  

		if(empty($row['publisher']))
		{
			return "";	
		}
		else 
		{		   	
	   	 return $row['publisher'];  		
		}
	   	 
	}
	function loadAll()
	{
		$sql="SELECT * FROM $this->coreTable order by publisher asc";
		//echo $sql;
		 $this->Execute($sql);		   	
	   	 return $this->sqlOK;  		
	}
	function save(){
		
		$sql="INSERT INTO $this->coreTable(title,publisher,volumeNo,edition,dateCreated)".
				  " VALUES('$this->title','$this->publisher','$this->volumeNo',
				  '$this->edition',now())";					  	
		$this->Execute($sql);	
		
	   return $this->sqlOK;  	   	
	}	
	function update($publicationID){
		$sql="UPDATE $this->coreTable set title='$this->title',publisher='$this->publisher',volumeNo='$this->volumeNo',
		edition='$this->edition' where publicationID='$publicationID'";		
	
	//echo $sql;
	$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}	

	function deletepublication($publicationID){
				
		$sql="delete from $this->coreTable where publicationID='$publicationID'";
		//echo $sql;  
		$this->Execute($sql);	
	
	
	   return $this->sqlOK;  	   	
	}		
	
}


?>
