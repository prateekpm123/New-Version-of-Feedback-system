
<?php

extract($_POST);
	if(isset($_POST['F_id']) && isset($_POST['Role']) && isset($_POST['Department']) && isset($_POST['Year']) && isset($_POST['Division'])){
		$F_id = $_POST['F_id'];
		$role = $_POST['Role'];
		$department = $_POST['Department'];
		$year = $_POST['Year'];
		$division = $_POST['Division'];

		include '../../../classes/model.class.php';
		$publish = new Model;
		$publish->publishForm($F_id,$role,$department,$year,$division);
	}



?>