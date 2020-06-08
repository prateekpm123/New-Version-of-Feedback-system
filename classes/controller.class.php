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

}