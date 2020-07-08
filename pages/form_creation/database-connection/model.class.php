<?php 

include 'dbh.class.php';

	Class Model extends Dbh {
		public function insertRecord($question, $type, $option1, $option2, $option3, $option4, $option5){
			
				
					$query = " INSERT INTO `questions` (`F_id`,`Question_desc`, `type` , `Option1`, `Option2`,
															`Option3`, `Option4`, `Option5`) 
								VALUES ('1', '$question', '$type', '$option1', '$option2', '$option3', '$option4', '$option5' ) ";
					$result = $this->connect()->prepare($query);
					$result->execute([$question, $type, $option1, $option2, $option3, $option4, $option5]);
				
		}


	}






 ?>

 