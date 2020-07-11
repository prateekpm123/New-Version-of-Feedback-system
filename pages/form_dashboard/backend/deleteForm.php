<?php

require_once "../../../classes/Controller.class.php";

$F_id = htmlentities($_POST['F_id']);

$controllerObj = new Controller();

$controllerObj->deleteFormControl($F_id);

