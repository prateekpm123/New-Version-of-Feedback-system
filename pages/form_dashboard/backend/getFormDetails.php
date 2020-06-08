<?php 

require_once "../../../classes/View.class.php";




class FormInfo {

    public function giveFormDataToRender() {
        $viewClassObj = new View();
        $formsData = $viewClassObj->getFormData();
        return $formsData;
    }

    public function giveFormVersionToRender($Form_name) {
        $viewClassObj = new View();
        $formVersionData = $viewClassObj->getFormVersionData($Form_name);
        return $formVersionData;
    }

}



