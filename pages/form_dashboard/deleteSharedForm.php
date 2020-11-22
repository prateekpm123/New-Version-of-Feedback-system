<?php 

$sharedId = htmlentities($_POST['shareId']);

require_once "../../classes/Controller.class.php";



$controllerObj = new Controller();

$ans = $controllerObj->deleteSharedFormContributor($sharedId);


// echo "$sharedId and $ans this is the shared ID";