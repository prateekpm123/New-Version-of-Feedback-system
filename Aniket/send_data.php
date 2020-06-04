<?php 
if(isset($_POST['formname']) && isset($_POST['formsession']))
{
	$formname = $_POST['formname'];
	$formsession = $_POST['formsession'];
	include 'model.class.php';
	$model = new Model();
	$model->insertRecord($formname, $formsession);
}

if(isset($_POST['deleteid'])){
	$formid = $_POST['deleteid'];
	include 'control.class.php';
	$control = new Control();
	$control->deleteRecord($formid);
}

if(isset($_POST['hidden_form_id_update'])){

	$hidden_form_id_update = $_POST['hidden_form_id_update'];
	$formnameupdate = $_POST['formnameupdate'];
	$formsessionupdate = $_POST['formsessionupdate'];
	include 'control.class.php';
	$control1 = new Control();
	$control1->updateRecord($formnameupdate, $formsessionupdate, $hidden_form_id_update);
}


 ?>