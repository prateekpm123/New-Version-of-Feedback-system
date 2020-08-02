
<?php

extract($_POST);
	if(isset($_POST['F_id']) && isset($_POST['Role']) && isset($_POST['Department']) && isset($_POST['Year']) && isset($_POST['Division']) && isset($_POST['Start']) && isset($_POST['End'])){
		$F_id = $_POST['F_id'];
		$role = $_POST['Role'];
		$department = $_POST['Department'];
		$year = $_POST['Year'];
		$division = $_POST['Division'];
		$start = $_POST['Start'];
		$end = $_POST['End'];

		

		include '../../../classes/model.class.php';
		$publish = new Model;
		$publish->publishForm($F_id,$role,$department,$year,$division,$start,$end);
	}



?>