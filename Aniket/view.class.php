<?php 

include 'dbh.class.php';

	Class View extends Dbh {
		public function fetchRecords(){
			$data = null;

			$query = " SELECT * FROM `form_table` ";
			$result = $this->connect()->prepare($query);
			if ($result->execute()){
				while ($row = $result->fetch()){
					$data[] = $row;
				}
			}
			return $data;
		}

		public function getFormId($formid){

			$data = null;
			$query = "SELECT * FROM form_table WHERE id = ? ";
			$result = $this->connect()->prepare($query);
			if($result->execute([$formid])){
				while ($row = $result->fetch()){
					$data = $row;
				}
			}
			return $data;
	}
}



 ?>

