<?php

include 'dbh.class.php';

Class View extends Dbh {
  public function fetchForms(){
    
    $user_email = $_SESSION['user_email'];
    $data = null;
    $query = " SELECT * FROM user_form_access INNER JOIN form ON user_form_access.F_id=form.F_id 
    WHERE user_email = ? ";
    $result = $this->connect()->prepare($query);
    if ($result->execute([$user_email])){
        while ($row = $result->fetch()){
            $data[] = $row;
        }
    }
    return $data;
    
  }
}




?>