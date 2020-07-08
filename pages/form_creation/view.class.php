<?php 

    include 'dbh.class.php';

    Class View extends Dbh {
        public function fetchRecords() {
            $data = null;

            $query = " SELECT * FROM `create_form` ";
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