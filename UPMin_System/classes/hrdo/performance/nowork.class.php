<?php

# Helper class for the User table

class nowork extends Core {

	var $noWorkID;
	var $title;
	var $description;
	var $start;	
	var $end;
	var $hours;	
	var $isAnnual;
	
	function category() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.OPESnowork";
	}	

	function loadAll(){
		$sql = "SELECT * 
				FROM $this->coreTable";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}

	function save(){
		$sql = "INSERT INTO $this->coreTable (
				title, 
				description, 
				start, 
				end, 
				hours, 
				isAnnual
				) values (
				'$this->title',
				'$this->description',
				'$this->start',
				'$this->end',
				'$this->hours',
				'$this->isAnnual'
				)";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}

	function load(){
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE noWorkID = '$this->noWorkID'";
		//echo "<br>".$sql;
		$this->Execute($sql);
		$row = $this->result->FetchRow();
		$this->title = $row['title'];
		$this->description = $row['description'];
		$this->start = $row['start'];
		$this->end = $row['end'];
		$this->hours = $row['hours'];
		$this->isAnnual = $row['isAnnual'];
	}

	function update(){
		$sql = "UPDATE $this->coreTable
				SET 
				title = '$this->title',
				description = '$this->description',
				start = '$this->start',
				end = '$this->end',
				hours = '$this->hours',
				isAnnual = '$this->isAnnual'
				WHERE noWorkID = '$this->noWorkID'";
		echo "<br>".$sql;
		$this->Execute($sql);
	}
	
}
?>