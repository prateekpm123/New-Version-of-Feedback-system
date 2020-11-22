<?php

// ** @desc OF THIS FILE
// ** This updates, deletes, insert or any kinda of data manipulation into the database
// **
require "Model.class.php";

class Controller extends Model {

    public function insertNewForm(string $formName, string $formdesc) {
        $result = $this->insetNewForm($formName, $formdesc);
        return $result;
    }

    public function deleteFormControl($F_id) {
        $result = $this->deleteForm($F_id);
        return $result;
    }

    public function updateFormNameControl($F_id, $FormName ) {
        $result = $this->updateFormName($F_id, $FormName );
        return $result;
    }

    public function createNewFormVersionsController($F_id) {
        $result = $this->createNewFormVersions($F_id);
        return $result;
    }

    public function deleteSharedFormContributor($sharedFormId) {
        $result = $this->deleteSharedFormContributorModal($sharedFormId);
        return $result;
    }

}