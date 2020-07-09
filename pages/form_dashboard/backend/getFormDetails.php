<?php 

require_once "../../../classes/View.class.php";


class FormInfo {

    public function giveFormDataToRender($access_reciever) {
        $viewClassObj = new View();
        $formsData = $viewClassObj->getFormData($access_reciever);
        return $formsData;
    }

    public function giveFormVersionToRender($F_id) {
        $viewClassObj = new View();
        $formVersionData = $viewClassObj->getFormVersionData($F_id);
        return $formVersionData;
    }

    public function getFormVersionQuestionData($F_id) {
        $viewClassObj = new View();
        $formQuestionData = $viewClassObj->getFormVersionQuestionData($F_id);
        return $formQuestionData;
    }

}



