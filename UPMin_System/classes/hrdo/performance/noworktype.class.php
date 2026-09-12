<?php

# Helper class for the User table

class noworktype extends Core {

	var $noWorkTypeID;
	var $noWorkType;
	
	function noworktype() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.OPESnoworktype";
	}	

	function loadAll(){
		$sql = "SELECT * 
				FROM $this->coreTable";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}
	
}
?>