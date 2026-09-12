<?php

# Helper class for the User table

class reftable extends Core {

	var $reftableID;
	var $officeID;
	var $refTableCode;
	var $function;
	var $operationalDefinition;
	var $output;
	var $performanceIndicator;
	var $categoryID;
	var $point;
	
	function reftable() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.OPESreftable";
	}	

	function loadAll(){
		$sql = "SELECT * 
				FROM $this->coreTable as a
				LEFT JOIN upmin_hrdo.OPEScategory as b ON a.categoryID = b.categoryID
				LEFT JOIN upmin_hrdo.office as c ON a.officeID = c.officeID";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}

	function loadByOffice(){
		$sql = "SELECT * 
				FROM $this->coreTable as a
				LEFT JOIN upmin_hrdo.OPEScategory as b ON a.categoryID = b.categoryID
				LEFT JOIN upmin_hrdo.office as c ON a.officeID = c.officeID
				WHERE officeID = $this->officeID";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}
	
	function load(){
		$sql = "SELECT * 
				FROM $this->coreTable as a
				LEFT JOIN upmin_hrdo.OPEScategory as b ON a.categoryID = b.categoryID
				LEFT JOIN upmin_hrdo.office as c ON a.officeID = c.officeID
				WHERE reftableID = $this->reftableID";
		//echo "<br>".$sql;
		$this->Execute($sql);
		$row = $this->result->FetchRow();
		$this->reftableID = $row['reftableID'];
		$this->officeID = $row['officeID'];
		$this->refTableCode = $row['refTableCode'];
		$this->function = $row['function'];
		$this->operationalDefinition = $row['operationalDefinition'];
		$this->output = $row['output'];
		$this->performanceIndicator = $row['performanceIndicator'];
		$this->categoryID = $row['categoryID'];
		$this->point = $row['point'];
	}

	function save(){
		$sql = "INSERT INTO $this->coreTable (
				officeID, 
				refTableCode, 
				function, 
				operationalDefinition, 
				output, 
				performanceIndicator,
				categoryID,
				point
				) Values (
				$this->officeID, 
				'$this->refTableCode',
				'$this->function',
				'$this->operationalDefinition',
				'$this->output',
				'$this->performanceIndicator',
				$this->categoryID,
				'$this->point'
				)";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}

	function update(){
		$sql = "UPDATE $this->coreTable SET
				officeID = $this->officeID,
				refTableCode = '$this->refTableCode',
				function = '$this->function', 
				operationalDefinition = '$this->operationalDefinition', 
				output = '$this->output', 
				performanceIndicator = '$this->performanceIndicator',
				categoryID = $this->categoryID,
				point = '$this->point'
				WHERE reftableID = $this->reftableID";
		echo "<br>".$sql;
		$this->Execute($sql);
	}
	
}
?>