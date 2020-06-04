<?php 

include 'dbh.class.php';

	Class Model extends Dbh {
		public function insertRecord($formname, $formsession){
			
				
					$query = " INSERT INTO `form_table` (`form_name`, `form_session`) 
								VALUES ( ?, ? )";
					$result = $this->connect()->prepare($query);
					$result->execute([$formname, $formsession]);
				
		}


	}






 ?>