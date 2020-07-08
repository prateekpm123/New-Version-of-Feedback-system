<?php 


if(isset($_POST['question']) && isset($_POST['type']) && isset($_POST['option1']) && isset($_POST['option2']
	) && isset($_POST['option3']) && isset($_POST['option4']) && isset($_POST['option5'])) {
	
			$question = $_POST['question'];
			$type = $_POST['type'];
			$option1 = $_POST['option1'];
			$option2 = $_POST['option2'];
			$option3 = $_POST['option3'];
			$option4 = $_POST['option4'];
			$option5 = $_POST['option5'];
			include 'model.class.php';
			$model = new Model();
			$model->insertRecord($question, $type, $option1, $option2, $option3, $option4, $option5);
	}

	if(isset($_POST['deleteid'])){
	$question_id = $_POST['deleteid'];
	include 'control.class.php';
	$control = new Control();
	$control->deleteQuestion($question_id);
}

 ?>

 