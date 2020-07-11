<?php

$F_id = htmlentities($_POST['F_id']);
$FormName = htmlentities($_POST['FormName']);
$column = htmlentities($_POST['column']);


require_once "../../../classes/Controller.class.php";

if( $column == 1 ) {
    $controllerObj = new Controller();

    $controllerObj->updateFormNameControl($F_id, $FormName);
}
