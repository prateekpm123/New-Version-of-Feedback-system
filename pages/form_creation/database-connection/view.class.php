<?php 


include 'dbh.class.php';

Class View extends Dbh {
    public function fetchRecords() {
        $data = null;
        // session_start();
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

    public function fetchparticularquestion($copyid) {
        $data = null;

        $query = " SELECT * FROM `questions` WHERE Q_id = '$copyid' ";
        $result = $this->connect()->prepare($query);
        if ($result->execute()){
            while ($row = $result->fetch()){
                $data[] = $row;
            }
        }
        return $data;
    }

    public function fetchFormNameAndDesc($F_id) {
        $data = null;
        $query = "SELECT * FROM `form` WHERE F_id = ?";
        $result = $this->connect()->prepare($query);
        $result->execute([$F_id]);
        $row = $result->fetch();
        $data[] = $row;
        return $data;
    }
}

 ?>