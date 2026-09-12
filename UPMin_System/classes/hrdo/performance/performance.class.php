<?php
include_once("classes/middletier/hrdo/performance/performancelog.class.php");
# Helper class for the User table

class performance extends Core {

	var $performanceID;
	var $personnelID;
	var $fromDate;
	var $toDate;
	var $remarks;
	var $status;
	
	function performance() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.OPESperformance";
	}	

	function loadAll(){
		$sql = "SELECT * 
				FROM $this->coreTable";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}

	function save(){
		$sql = "INSERT INTO $this->coreTable 
				(personnelID, fromDate, toDate, remarks)
				values ('$this->personnelID','$this->fromDate','$this->toDate','$this->remarks')";
		echo "<br>".$sql;
		$this->Execute($sql);
		
		$plog = new performanceLog();
		$plog->performanceID = $this->lastid;
		$plog->personnelID = $this->personnelID;
		$plog->fromDate = $this->fromDate;
		$plog->toDate = $this->toDate;
		$plog->remarks = $this->remarks;
		$plog->action = "SAVE";
		$plog->log();
	}

	function load(){
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE performanceID = $this->performanceID";
		//echo "<br>".$sql;
		$this->Execute($sql);
		$row = $this->result->FetchRow();
		$this->personnelID = $row['personnelID'];
		$this->fromDate = $row['fromDate'];
		$this->toDate = $row['toDate'];
		$this->remarks = $row['remarks'];
	}

	function update(){
		$this->load();
		
		$sql = "UPDATE $this->coreTable
				SET fromDate = '$this->fromDate',
					toDate = '$this->toDate',
					remarks = '$this->remarks'
				WHERE performanceID = $this->performanceID";
		//echo "<br>".$sql;
		$this->Execute($sql);
		
		$plog = new performanceLog();
		$plog->performanceID = $this->performanceID;
		$plog->personnelID = $this->personnelID;
		$plog->fromDate = $this->fromDate;
		$plog->toDate = $this->toDate;
		$plog->remarks = $this->remarks;
		$plog->status = $this->status;
		$plog->action = "UPDATE";
		$plog->log();		
	}
	
	function delete(){
		$this->load();
			
		$plog = new performanceLog();
		$plog->performanceID = $this->performanceID;
		$plog->personnelID = $this->personnelID;
		$plog->fromDate = $this->fromDate;
		$plog->toDate = $this->toDate;
		$plog->remarks = $this->remarks;
		$plog->status = $this->status;
		$plog->action = "DELETE";
		$plog->log();		
		
		$sql = "DELETE FROM $this->coreTable
				WHERE performanceID = $this->performanceID";
		//echo "<br>".$sql;
		$this->Execute($sql);
		
	}
		
	function loadByPersonnel(){
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE personnelID = $this->personnelID";
		//echo "<br>".$sql;
		$this->Execute($sql);		
	}
}
?>