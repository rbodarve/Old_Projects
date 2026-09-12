<?php

# Helper class for the User table

class category extends Core {

	var $categoryID;
	var $code;
	var $categoryName;
	var $description;
	
	function category() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.OPEScategory";
	}	

	function loadAll(){
		$sql = "SELECT * 
				FROM $this->coreTable";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}

	function save(){
		$sql = "INSERT INTO $this->coreTable 
				(code, categoryName, description)
				values ('$this->code','$this->categoryName','$this->description')";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}

	function load(){
		$sql = "SELECT * 
				FROM $this->coreTable
				WHERE categoryID = $this->categoryID";
		//echo "<br>".$sql;
		$this->Execute($sql);
		$row = $this->result->FetchRow();
		$this->code = $row['code'];
		$this->categoryName = $row['categoryName'];
		$this->description = $row['description'];
	}

	function update(){
		$sql = "UPDATE $this->coreTable
				SET code = '$this->code',
					categoryName = '$this->categoryName',
					description = '$this->description'
				WHERE categoryID = $this->categoryID";
		echo "<br>".$sql;
		$this->Execute($sql);
	}
	
}
?>