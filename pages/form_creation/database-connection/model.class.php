<?php 

include 'dbh.class.php';

	Class Model extends Dbh {
		public function insertRecord($question, $type, $rating, $option1, $option2, $option3, $option4, $option5){
			
				session_start();
				$F_id = $_SESSION['F_id'];
					$query = " INSERT INTO `questions` (`F_id`,`Question_desc`, `type`, `rating_scale` , `Option1`, `Option2`,
															`Option3`, `Option4`, `Option5`) 
								VALUES ('$F_id', '$question', '$type' , '$rating' , '$option1', '$option2', '$option3', '$option4', '$option5' ) ";
					$result = $this->connect()->prepare($query);
					$result->execute([$question, $type, $rating, $option1, $option2, $option3, $option4, $option5]);
				
		}

		

	}






 ?>

 