<?php

/**  @desc OF THIS FILE
* @param This takes the datafrom the model.class.php and gives it to display in the front end
**/ 

include "Model.class.php";

class View extends Model {

    // @param: formid  
    public function showAdminData() {
        $results = $this->fetchAdminData();
        return $results;
    }
    
    public function getAdminValidationResults(string $admin_email, string $password) {
        $results = $this->validateAdminLogin($admin_email, $password);
        return $results;
    }

    public function getFormData($access_reciever) {
        $forms = $this->fetchForms($access_reciever);
        if($forms == false ) {
            // $empty =  "OOPS got nothing to show";
            return null;
        }
        else {
            return $forms;
        }
    }

    public function getFormVersionData($F_id) {
        $formVersionData = $this->fetchFormVersions($F_id);
        if($formVersionData == false ) {
            // $empty =  "OOPS got nothing to show";
            return null;
        }
        else {
            return $formVersionData ?? null;
        }
    }

    public function getFormVersionQuestionData($F_id) {
        $formQuestionData = $this->getFormQuestionData($F_id);
        return $formQuestionData;
    }

    public function viewUserValidationResults(string $admin_email, string $password) {
        $results = $this->validateUser($admin_email, $password);
        return $results;
    }

}

