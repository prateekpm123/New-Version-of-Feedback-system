<?php 
include 'dbh.class.php';

Class Control extends Dbh {
	public function deleteRecord($formid){
		$query = " DELETE FROM form_table WHERE id = ? ";
		$result = $this->connect()->prepare($query);
		$result->execute([$formid]);
	}

	public function updateRecord($formnameupdate, $formsessionupdate, $hidden_form_id_update){
		$query = " UPDATE `form_table` SET `form_name`= ? ,`form_session`= ? WHERE id= ? ";
		$result = $this->connect()->prepare($query);
		$result->execute([$formnameupdate, $formsessionupdate, $hidden_form_id_update]);
	}
}



 ?>