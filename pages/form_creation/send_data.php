<?php 


if(isset($_POST['question']) && isset($_POST['type']) && isset($_POST['rating']) && isset($_POST['option1']) && isset($_POST['option2']) && isset($_POST['option3']) && isset($_POST['option4']) && isset($_POST['option5'])) {
	
			$question = $_POST['question'];
			$type = $_POST['type'];
			$rating = $_POST['rating'];
			$option1 = $_POST['option1'];
			$option2 = $_POST['option2'];
			$option3 = $_POST['option3'];
			$option4 = $_POST['option4'];
			$option5 = $_POST['option5'];
			include 'database-connection/model.class.php';
			$model = new Model();
			$model->insertRecord($question, $type, $rating, $option1, $option2, $option3, $option4, $option5);
	}

	if(isset($_POST['deleteid'])){
	$question_id = $_POST['deleteid'];
	include 'database-connection/control.class.php';
	$control = new Control();
	$control->deleteQuestion($question_id);
}

if(isset($_POST['copyquestion']) && isset($_POST['copytype']) && isset($_POST['copyscale']) && isset($_POST['copyoption1']) && isset($_POST['copyoption2']
	) && isset($_POST['copyoption3']) && isset($_POST['copyoption4']) && isset($_POST['copyoption5'])) {

	$copyquestion = $_POST['copyquestion'];
	$copytype = $_POST['copytype'];
	$copyscale = $_POST['copyscale'];
	$copyoption1 = $_POST['copyoption1'];
	$copyoption2 = $_POST['copyoption2'];
	$copyoption3 = $_POST['copyoption3'];
	$copyoption4 = $_POST['copyoption4'];
	$copyoption5 = $_POST['copyoption5'];
	include 'database-connection/model.class.php';
	$model1 = new Model();
	$model1->insertRecord($copyquestion, $copytype, $copyscale, $copyoption1, $copyoption2, $copyoption3, $copyoption4, 
		$copyoption5);
	}

 ?>

 