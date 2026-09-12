<?php

# Helper class for the User table

class performanceLog extends Core {

	var $performanceLogID;
	var $performanceID;
	var $personnelID;
	var $fromDate;
	var $toDate;
	var $remarks;
	var $status;
	var $action;
	
	function performanceLog() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.OPESperformance_log";
	}	

	function log(){
		$sql = "INSERT INTO $this->coreTable (
				performanceID,
				personnelID,
				fromDate,
				toDate,
				remarks,
				status,
				action
				) VALUES (
				'$this->performanceID',
				'$this->personnelID',
				'$this->fromDate',
				'$this->toDate',
				'$this->remarks',
				'$this->status',
				'$this->action'
				)";
		echo "<br>".$sql;
		$this->Execute($sql);
	}
}
?>