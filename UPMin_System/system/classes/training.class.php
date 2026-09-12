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
    var $desc;
    var $budget_id;
 	
    function Training(){
        $this->Core();
		$this->coreTable = "upmin_training.training";
		
		$dbhost = 'localhost';
		$dbuser = 'root';
		$conn = mysql_connect($dbhost, $dbuser) or die ('Error connecting to mysql');
		$dbname = 'upmin_setup';
		$dbname2 = 'upmin_training';
		mysql_select_db($dbname);
		mysql_select_db($dbname2);
    }

    
    function loadAll(){
		$sql="select * from $this->coreTable ORDER BY  training_ID ASC ";
        $this->Execute($sql);
        return $this->sqlOK;
	}

    function search($s){
		$sql="select DISTINCT 
			t.training_ID, 
			c.training_title, 
			c.location, 
			c.city 
		from upmin_training.training as c, 
			upmin_setup.user as u, 
			upmin_training.participant_training as t 
		WHERE  u.userID=t.participant_id AND 
			c.training_ID=t.training_id AND 
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
		 $this->desc=$row['descr'];
		
		 return $this->sqlOK;
	}

	function load_training($training_id){
		$sql="SELECT Distinct * 
		from upmin_setup.user as u, 
		upmin_training.participant_training as t 
		WHERE t.training_id='$training_id' AND 
			u.userID=t.participant_id 
		ORDER BY u.userID ASC";
		$this->Execute($sql);
        return $this->sqlOK;
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
			'$this->location',
			'$this->city',
			'$this->typ', 
			'$this->organizer',
			'$this->desc')";
	   $this->Execute($sql);
	   echo $sql;
	   echo "\n\n";
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
		`descr` = '$this->desc' 
		WHERE training_ID = $training_id";
	   $this->Execute($sql);
	   return $this->sqlOK;
	}

	function delete($training_id){
			$sql="delete from $this->coreTable WHERE training_id='$training_id'";
			$this->Execute($sql);
			$sql2="DELETE from upmin_training.participant_training WHERE training_id='$training_id'";
			$this->Execute($sql2);
			$sql3="DELETE from upmin_training.budge WHERE budget_id='$training_id'";
			$this->Execute($sql3);
	        return $this->sqlOK;
	}
}