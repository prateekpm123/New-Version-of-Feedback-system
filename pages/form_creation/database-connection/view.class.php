<?php 

session_start();
// $formId = $_SESSION['F_id'];
include 'dbh.class.php';

Class View extends Dbh {
    public function fetchRecords() {
        $data = null;

        $query = " SELECT * FROM `questions` WHERE `F_id`=1 AND `DELETED`=0";
        $result = $this->connect()->prepare($query);
        if ($result->execute()){
            while ($row = $result->fetch()){
                $data[] = $row;
            }
        }
        return $data;
    }
}

 ?>