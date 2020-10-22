<?php

$F_id = htmlentities($_POST['F_id']);
$FormName = htmlentities($_POST['FormName']);
$FormDescription = htmlentities($_POST['FormDescription']);


//require_once "../../../classes/Controller.class.php";

include '../../../classes/model.class.php';

$edit = new Model();
$edit->updateFormNameAndDescription($F_id, $FormName, $FormDescription);
