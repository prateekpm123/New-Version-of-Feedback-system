<?php 


include 'dbh.class.php';

Class View extends Dbh {
    public function fetchRecords() {
        $data = null;
        session_start();
        $formId = $_SESSION['F_id'];
        $query = " SELECT * FROM `questions` WHERE `F_id`=$formId AND `DELETED`=0";
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