<?php

# Helper class for the User table

class personnelinfo extends Core {

	var $personnelinfoID;
	var $personnelID;
	var $birthDate;
	var $birthCity;
	var $birthProvince;
	var $gender;
	var $civilStatus;
	var $citizenship;
	var $height;
	var $weight;
	var $bloodType;
	var $resHouseNumber;
	var $resStreet;
	var $resCity;
	var $resProvince;
	var $resZipCode;
	var $resTelNo;
	var $permHouseNumber;
	var $permStreet;
	var $permCity;
	var $permProvince;
	var $permZipCode;
	var $permTelNo;
	var $email;
	var $mobile;
	var $GSIS;
	var $HDMF;
	var $PHIC;
	var $BP;
	var $SSS;
	var $TIN;


	function personnelinfo() {
		$this->Core();
		$this->coreTable = "upmin_hrdo.personnelinfo";
	}	

	function loadAll(){
		$sql = "SELECT * 
				FROM $this->coreTable";
		//echo "<br>".$sql;
		$this->Execute($sql);
	}

	function save(){
		$sql = "INSERT INTO $this->coreTable (
				personnelID,
				birthDate,
				birthCity,
				birthProvince,
				gender,
				civilStatus,
				citizenship,
				height,
				weight,
				bloodType,
				resHouseNumber,
				resStreet,
				resCity,
				resProvince,
				resZipCode,
				resTelNo,
				permHouseNumber,
				permStreet,
				permCity,
				permProvince,
				permZipCode,
				permTelNo,
				email,
				mobile,
				GSIS,
				HDMF,
				PHIC,
				BP,
				SSS,
				TIN
				) VALUES (
				'$this->personnelID',
				'$this->birthDate',
				'$this->birthCity',
				'$this->birthProvince',
				'$this->gender',
				'$this->civilStatus',
				'$this->citizenship',
				'$this->height',
				'$this->weight',
				'$this->bloodType',
				'$this->resHouseNumber',
				'$this->resStreet',
				'$this->resCity',
				'$this->resProvince',
				'$this->resZipCode',
				'$this->resTelNo',
				'$this->permHouseNumber',
				'$this->permStreet',
				'$this->permCity',
				'$this->permProvince',
				'$this->permZipCode',
				'$this->permTelNo',
				'$this->email',
				'$this->mobile',
				'$this->GSIS',
				'$this->HDMF',
				'$this->PHIC',
				'$this->BP',
				'$this->SSS',
				'$this->TIN'
				)";
		//echo "<br>".$sql;
		$this->Execute($sql);		
	}
	
	function load(){
		$sql = "SELECT * FROM $this->coreTable
				WHERE personnelID = '$this->personnelID'";
		$this->Execute($sql);
		$row = $this->result->FetchRow();
		$this->personnelinfoID = $row['personnelinfoID'];
		$this->personnelID = $row['personnelID'];
		$this->birthDate = $row['birthDate'];
		$this->birthCity = $row['birthProvince'];
		$this->birthProvince = $row['birthProvince'];
		$this->gender = $row['gender'];
		$this->civilStatus = $row['civilStatus'];
		$this->citizenship = $row['citizenship'];
		$this->height = $row['height'];
		$this->weight = $row['weight'];
		$this->bloodType = $row['bloodType'];
		$this->resHouseNumber = $row['resHouseNumber'];
		$this->resStreet = $row['resStreet'];
		$this->resCity = $row['resCity'];
		$this->resProvince = $row['resProvince'];
		$this->resZipCode = $row['resZipCode'];
		$this->resTelNo = $row['resTelNo'];
		$this->permHouseNumber = $row['permHouseNumber'];
		$this->permStreet = $row['permStreet'];
		$this->permCity = $row['permCity'];
		$this->permProvince = $row['permProvince'];
		$this->permZipCode = $row['permZipCode'];
		$this->permTelNo = $row['permTelNo'];
		$this->email = $row['email'];
		$this->mobile = $row['mobile'];
		$this->GSIS = $row['GSIS'];
		$this->HDMF = $row['HDMF'];
		$this->PHIC = $row['PHIC'];
		$this->BP = $row['BP'];
		$this->SSS = $row['SSS'];
		$this->TIN = $row['TIN'];
	}
}
?>