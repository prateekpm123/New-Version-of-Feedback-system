<?php 

require "getFormDetails.php";


// $form_name = $_POST['Form_name'];


renderFormVersionData();

function renderFormVersionData() {

    $form_name = $_POST['Form_name'];
    $formInfoObj = new FormInfo();
    $formData = $formInfoObj->giveFormVersionToRender($form_name);
    echo var_dump($formData);
}