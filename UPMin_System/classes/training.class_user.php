<?php

include_once ("/../core.class.php");

class Training extends Core{

    var $training_id;
    var $training_title;
    var $remarks;
    var $start_date;
    var $end_date;
    var $location;
    var $city;
    var $organizer;
    var $typ;
    var $descr;
    var $budget_id;
	var $nature;
 	
    function Training(){
        $this->Core();
		$this->coreTable = "upmin_training.training";
		
		$dbhost = 'localhost';
		$dbuser = 'root';
		$conn = mysql_connect($dbhost, $dbuser) or die ('Error connecting to mysql');
		$dbname = 'upmin_setup';
		mysql_select_db($dbname);
		$dbname2 = 'upmin_training';
		mysql_select_db($dbname2);
    }    
	
    function loadAll(){
		$sql="select DISTINCT * from 
		upmin_training.participant_training as pt, 
		upmin_setup.user as u, 
		upmin_training.training as t 
		WHERE pt.participant_id=u.userID 
		AND t.training_id=pt.training_id 
		AND pt.participant_id='".$_SESSION['userID']."'
		ORDER BY t.training_id ASC";
        $this->Execute($sql);
        return $this->sqlOK;
	}
	
	function loadNotMyTrainings(){
		$sql="select DISTINCT t.training_ID, t.training_title from 
		upmin_training.participant_training as pt, upmin_setup.user as u,
		upmin_training.training as t 
		WHERE pt.participant_id=u.userID 
		AND t.training_id=pt.training_id 
		AND NOT EXISTS (select pt.training_id from upmin_training.participant_training as pt WHERE t.training_id=pt.training_id and pt.participant_id='".$_SESSION['userID']."') ORDER BY t.training_ID ASC";
        $this->Execute($sql);
        return $this->sqlOK;
	}
	
	function search($s){
			$sql="select DISTINCT 
			t.training_ID, 
			c.training_title, 
			c.location, c.city 
		from upmin_training.training as c, 
			upmin_setup.user as u, 
			upmin_training.participant_training as t 
		WHERE  u.userID=t.participant_id AND 
			c.training_ID=t.training_id AND 
			u.userID='".$_SESSION['userID']."'AND
			(c.training_id LIKE '%$s%' OR 
			c.training_title LIKE '%$s%' OR 
			c.location LIKE '%$s%' OR 
			c.city LIKE '%$s%' OR 
			u.completeName LIKE '%$s%' OR 
			c.start_date='$s' OR c.end_date='$s') 
		ORDER BY c.training_id ASC";
			$this->Execute($sql);
			return $this->sqlOK;
	}    
    
	function load_ID($training_id){
		 $sql="select * from $this->coreTable where training_id='$training_id'";
		 $this->Execute($sql);
		 
		 $row=$this->result->FetchRow();
		 $this->training_id=$training_id;
		 $this->training_title=$row['training_title'];
		 $this->remarks=$row['remarks'];
		 $this->start_date=$row['start_date'];
		 $this->end_date=$row['end_date'];
		 $this->budget_id=$row['budget_id'];
		 $this->location=$row['location'];
		 $this->city=$row['city'];
		 $this->organizer=$row['organizer'];
		 $this->typ=$row['typ'];
		 $this->descr=$row['descr'];
		 //echo $this->descr;
		
		 return $this->sqlOK;
	}
	
	function getRole($id){
		$sql="select role from upmin_training.participant_training where training_id='$id' AND participant_id='".$_SESSION['userID']."'";
		$this->Execute($sql);
		
		$row=$this->result->FetchRow();
		$this->role=$row['role'];
		return $this->role;
	}
	
	function viewCert($id){
		$sql="select cert from upmin_training.participant_training where training_id='$id' AND participant_id='".$_SESSION['userID']."'";
		$this->Execute($sql);
		
		$row=$this->result->FetchRow();
		$this->cert=$row['cert'];
		return $this->cert;
	}

	function save(){
	   $sql="INSERT INTO $this->coreTable(
		training_title, 
		remarks, 
		start_date, 
		end_date, 
		location, 
		city,
		typ, 
		organizer, 
		descr)". 
		" VALUES(
		'$this->training_title',
		'$this->remarks',
		'$this->start_date',
		'$this->end_date',
		'$this->loc',
		'$this->city',
		'$this->typ', 
		'$this->organizer',
		'$this->descr')";
	   $this->Execute($sql);
	   return $this->sqlOK;
	}
	
	function saveFile($id, $name){
		$sql="UPDATE upmin_training.participant_training SET cert='$name' WHERE training_id='$id' AND participant_id='".$_SESSION['userID']."'";
		//echo $sql;
		$this->Execute($sql);
		return $this->sqlOK;
	}
	
	function addptt($id, $role){
		$sql="INSERT INTO upmin_training.participant_training(
			participant_id,
			training_id, role)".
			"VALUES(
			'".$_SESSION['userID']."',
			'$id', '$role')";
			//echo $sql;
		$this->Execute($sql);
		return $this->sqlOK;
	}
    
	function getID(){
		$sql="SELECT training_ID 
			FROM $this->coreTable WHERE 
			training_title='$this->training_title' AND 
			start_date='$this->start_date' AND 
			end_date='$this->end_date' AND 
			location='$this->loc' AND 
			city='$this->city'";
		$this->Execute($sql);
		$row=$this->result->FetchRow();
		$this->training_ID=$row['training_ID'];
		echo $this->training_ID;
		return $this->sqlOK;
	}
	
	function update($training_id){
		$sql="UPDATE $this->coreTable SET 
		`training_title` = '$this->training_title', 
		`start_date` = '$this->start_date', 
		`end_date` = '$this->end_date', 
		`location` = '$this->location', 
		`city` = '$this->city', 
		`remarks` = '$this->remarks', 
		`organizer` = '$this->organizer', 
		`typ` = '$this->typ', 
		`descr` = '$this->descr' 
		WHERE training_ID = $training_id";
	   $this->Execute($sql);
		$sql2="UPDATE upmin_training.participant_training SET role='$this->role'";
	   $this->Execute($sql2);
		
	   return $this->sqlOK;
	}
	
	function delete(){
			$sql="DELETE FROM 
				upmin_training.participant_training WHERE 
				training_id='$this->training_id' AND 
				participant_id='$this->participant_id'";
			$this->Execute($sql);
	        return $this->sqlOK;
	}	
}
?>