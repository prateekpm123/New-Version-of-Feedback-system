<?php

// ** @desc OF THIS FILE
// ** This class is the model, and its task is to interact with the database
// **
include 'Dbh.class.php';

class Model extends Dbh {

    protected function fetchAdminData() {

        $sql = "SELECT * FROM user";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute();

        $results = $stmt->FetchAll();
        return $results ?? false;
    }

}