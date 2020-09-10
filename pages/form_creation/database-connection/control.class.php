<?php 
	
include 'dbh.class.php';

Class Control extends Dbh {
		public function updateQuestion($value, $id){
		$query = "UPDATE questions SET Question_desc = '$value' WHERE Q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateType($value, $id){
		$query = "UPDATE questions SET `type` = '$value', rating_scale = '' , Option1 = '', Option2 = '', Option3 = '', Option4 = '', Option5 = '' WHERE Q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateTypeWithScale($value, $id){
		$query = "UPDATE questions SET type = '$value', rating_scale = '5' , Option1 = '', Option2 = '', Option3 = '', Option4 = '', Option5 = '' WHERE Q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateScale($value, $id){
		$query = "UPDATE questions SET rating_scale = '$value', Option1 = '', Option2 = '', Option3 = '', Option4 = '', Option5 = '' WHERE Q_id = '$id'  ";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption1($value, $id){
		$query = "UPDATE questions SET Option1 = '$value' WHERE Q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption2($value, $id){
		$query = "UPDATE questions SET Option2 = '$value' WHERE Q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption3($value, $id){
		$query = "UPDATE questions SET Option3 = '$value' WHERE Q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption4($value, $id){
		$query = "UPDATE questions SET Option4 = '$value' WHERE Q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	public function updateOption5($value, $id){
		$query = "UPDATE questions SET Option5 = '$value' WHERE Q_id = '$id'";
		$result = $this->connect()->prepare($query);
		$result->execute([$value, $id]);
	}

	// public function deleteQuestion($question_id){
	// 	$query = " DELETE FROM questions WHERE Q_id = '$question_id' ";
	// 	$result = $this->connect()->prepare($query);
	// 	$result->execute([$question_id]);
	// }

	public function deleteQuestion($question_id){
		$query = "UPDATE questions SET DELETED=1 WHERE Q_id = '$question_id' ";
		$result = $this->connect()->prepare($query);
		$result->execute([$question_id]);

		$query1 = "UPDATE answers SET DELETED=1 WHERE Q_id = '$question_id' ";
		$result1 = $this->connect()->prepare($query1);
		$result1->execute([$question_id]);
	}
}



