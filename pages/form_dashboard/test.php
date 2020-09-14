<?php

require_once "../../classes/View.class.php";


$F_id = $_POST['F_id'];
session_start();
$_SESSION['F_id'] = $F_id;

$viewObj = new View();
$formData = $viewObj->getFormVersionData($F_id);
echo($formData);
$_SESSION["Form_name"] = $formData[0]['Form_name'];
$_SESSION["Form_desc"] = $formData[0]['Form_Desc'];
$_SESSION["Form_version"] = $formData[0]['Form_version'];
$_SESSION["Admin_email"] = $formData[0]['Admin_email'];
// $_SESSION['Form_name'] = "testing";
// $_SESSION['Form_desc'] = "test";

?>