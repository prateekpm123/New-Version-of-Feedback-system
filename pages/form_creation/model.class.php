<?php 

include 'dbh.class.php';

	Class Model extends Dbh {
		public function insertRecord($question, $type, $option1, $option2, $option3, $option4, $option5){
			
				
					$query = " INSERT INTO `create_form` (`question`, `type` , `option1`, `option2`,
															`option3`, `option4`, `option5`) 
								VALUES ( '$question', '$type', '$option1', '$option2', '$option3', '$option4', '$option5' ) ";
					$result = $this->connect()->prepare($query);
					$result->execute([$question, $type, $option1, $option2, $option3, $option4, $option5]);
				
		}


	}






 ?>

 