<?php

# Helper class for the User table

class User extends Core {

	var $userID;
	var $officePersonnelID;
	var $completeName;
	var $userName;
	var $passWord;
	var $email;
	var $status;
	var $userType;
	
	
	
	function User() {
		$this->Core();
		$this->coreTable = "upmin_setup.user";
	}	
	
	function load($userID){
		
		
		$sql="SELECT * FROM $this->coreTable WHERE userID='$userID'";
		//echo $sql;
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
	    	$this->userID=$row['userID'];
			$this->officePersonnelID=$row['officePersonnelID'];
	   		$this->userName=$row['userName'];
	   		$this->completeName=$row['completeName'];
	   		$this->status=$row['status'];	   			   			   		
	   		$this->email=$row['email'];
	   		$this->userType=$row['userType'];
	   		
	   	//	print_r($row);
	   	 return $this->sqlOK;  
		
	}
	function loadUserName($userName){
		
		if(!$myid)$id=$this->userid;
		$sql="SELECT * FROM $this->coreTable WHERE userName='$userName'";
		 $this->Execute($sql);
		   	$row=$this->result->FetchRow();	  
	    	$this->userID=$row['userID'];
			$this->officePersonnelID=$row['officePersonnelID'];
	   		$this->userName=$row['userName'];
	   		$this->completeName=$row['completeName'];
	   		$this->status=$row['status'];	   			   			   		
	   		$this->email=$row['email'];
	   		$this->userType=$row['userType'];
	   			   		
	   	//	print_r($row);
	   	 return $this->sqlOK;  
		
	}
		
		
	function validateOldPassword($userid,$pwd) {
		$passwordMD5 = md5($pwd);
		$this->Execute("Select * FROM $this->coreTable where passWord='$passwordMD5' and userName='$passwordMD5'");
		if($this->count > 0) return TRUE;
		else return FALSE;					
	}
	
	function validate($userName,$pwd) {
		$passwordMD5 = md5($pwd);
		$sql="Select * FROM $this->coreTable where passWord='$passwordMD5' and userName='$userName'";
		//echo $sql;
		$this->Execute($sql);
		if($this->count > 0) {
			$row=$this->result->FetchRow();	
			$this->userID=$row['userID'];
			$this->officePersonnelID=$row['officePersonnelID'];
	   		$this->userName=$row['userName'];
	   		$this->completeName=$row['completeName'];
	   		$this->status=$row['status'];	   			   			   		
	   		$this->email=$row['email'];					
	   		$this->userType=$row['userType'];
			return TRUE;
			
		}
		else return FALSE;					
	}
	function verifyUserName($userName) {
		//$passwordMD5 = md5($pwd);
		
		$this->Execute("Select * FROM $this->coreTable where userName='$userName' and status=1");
		if($this->count > 0) {
			$row=$this->result->FetchRow();	
			$this->userID=$row['userID'];
			$this->officePersonnelID=$row['officePersonnelID'];
	   		$this->userName=$row['userName'];
	   		$this->completeName=$row['completeName'];
	   		$this->status=$row['status'];	   			   			   		
	   		$this->email=$row['email'];					
	   		$this->userType=$row['userType'];
			return TRUE;
			
		}
		else return FALSE;					
	}
	
	function CheckIfUsernameExist($username)
	{
		//echo ("Select * FROM $this->coreTable where username='$username' and status=1");
		$sql="Select * FROM $this->coreTable where userName='$username'";
		//echo $sql;
		$this->Execute($sql);
		if($this->count > 0) return TRUE;
		else return FALSE;					
	}	
	function CheckIfOldUsernameExist($username,$userID)
	{
		//echo ("Select * FROM $this->coreTable where username='$username' and status=1");
		$sql="Select * FROM $this->coreTable where userName='$username' and userID!='$userID'";
		//echo $sql;
		$this->Execute($sql);
		if($this->count > 0) return TRUE;
		else return FALSE;					
	}	
	function save() {
			
				
		$passwordMD5 = md5($this->passWord);
		$sql="INSERT INTO $this->coreTable(userName,completeName,status,email,passWord,userType) ".
		     "VALUES('$this->userName','$this->completeName','$this->status','$this->email','$passwordMD5','$this->userType')";
		//echo $sql;
		$this->Execute($sql);		
			return $this->sqlOK;
		
	}
	function updateUser($userID) {		
				
		$username = safeString($this->userName);
		$completeName = safeString($this->completeName);				
		$sql="UPDATE $this->coreTable SET userName='$username',completeName='$completeName',email='$this->email',userType='$this->userType' where userID='$userID'";
		//echo $sql;
		$this->Execute($sql);		
		return $this->sqlOK;
		
	}
	# Updates the user data, only email and password can be changed with this function
	
		
	
	function deleteUser($id) {
		$id=safeString($id);
		$sql = "DELETE FROM $this->coreTable WHERE userID='$id'";
		//echo $sql;
		$this->Execute($sql);
		if($this->sqlOK)
		{
			$sql = "DELETE FROM userrole WHERE userID='$id'";
				$this->Execute($sql);
		}
		return $this->sqlOK;
	}
	
	function disableUser($id) {
		$id=safeString($id);
		$this->sql = "UPDATE $this->coreTable SET status=0 WHERE userID=$id";
		$this->Execute($this->sql);
		return $this->sqlOK;
	}
	
	
	function getUserList() {		
		$sql = "SELECT * FROM $this->coreTable";
		$this->Execute($sql);
		return $this->sqlOK;
	}
	
	
	function Visit($id) {		
		$this->Execute("UPDATE $this->coreTable SET lastVisit=NOW() WHERE userID='$id'");
		return ($this->sqlOK) ;
	}	

	
	function changePassword($id,$new) {
		$id = safeString($id);
		$sql="UPDATE $this->coreTable SET passWord='".md5($new)."' WHERE userID='$id'";
		$this->Execute($sql);
		//echo $sql;
		return ($this->sqlOK) ;
	}
	
	function updateLink($userID){
		$sql = "UPDATE $this->coreTable SET officePersonnelID='$this->officePersonnelID' WHERE userID='$userID'";
		
		$this->Execute($sql);
		return $this->sqlOK;
	}
	
	function getLink($userID){
		$sql="SELECT officePersonnelID FROM $this->coreTable WHERE userID='$userID'";
		$this->Execute($sql);
		$row=$this->result->FetchRow();	
		$this->officePersonnelID=$row['officePersonnelID'];
		
		return $this->sqlOK;
	}
}


?>