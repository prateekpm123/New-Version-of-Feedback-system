<?php

include 'dbh.class.php';

Class View extends Dbh {
  public function fetchForms(){
    $data = null;
    $query = " SELECT * FROM user_form_access INNER JOIN form ON user_form_access.F_id=form.F_id ";
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