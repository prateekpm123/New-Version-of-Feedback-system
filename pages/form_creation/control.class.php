<?php 
	
	include 'dbh.class.php';

	Class Control extends Dbh {
		public function updateQuestion($value, $id){
		$query = "UPDATE create_form SET question = '$value' WHERE q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateType($value, $id){
		$query = "UPDATE create_form SET type = '$value', option1 = '', option2 = '', option3 = '', option4 = '', option5 = '' WHERE q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption1($value, $id){
		$query = "UPDATE create_form SET option1 = '$value' WHERE q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption2($value, $id){
		$query = "UPDATE create_form SET option2 = '$value' WHERE q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption3($value, $id){
		$query = "UPDATE create_form SET option3 = '$value' WHERE q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption4($value, $id){
		$query = "UPDATE create_form SET option4 = '$value' WHERE q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption5($value, $id){
		$query = "UPDATE create_form SET option5 = '$value' WHERE q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function deleteQuestion($question_id){
		$query = " DELETE FROM create_form WHERE q_id = '$question_id' ";
		$result = $this->connect()->prepare($query);
		$result->execute([$question_id]);
	}

}



 ?>