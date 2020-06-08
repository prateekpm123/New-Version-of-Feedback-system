<?php

require_once "../../../classes/Controller.class.php";

$formName = $_POST['formName'];
$formDesc = $_POST['formDesc']; 

insertModalDataToFormTable($formName, $formDesc);

 function insertModalDataToFormTable(string $formName, string $formDesc) {
    $contrObj = new Controller();
    $result = $contrObj->insertNewForm($formName, $formDesc);
    if($result == true) {
        echo "Insert successful";
    }
 
}   





// $obj = new setFormInfo();
// echo $obj->insertModalDataToFormTable($formName, $formDesc);

// echo $formDesc;
// echo $formName;