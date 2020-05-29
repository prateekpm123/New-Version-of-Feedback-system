<?php

// ** @desc OF THIS FILE
// ** This class is the model, and its task is to interact with the database
// **

class Model extends Dbh {

    protected function getQuestionData() {

        $sql = "SELECT * FROM questins";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute();

        $results = $stmt->FetchAll();
        return $results ?? false;
    }

}