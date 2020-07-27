<?php

require_once "../../../classes/Controller.class.php";


$F_id = htmlentities($_POST['F_id']);

$controllerObj = new Controller();

$result = $controllerObj->createNewFormVersionsController($F_id);
var_dump($result);