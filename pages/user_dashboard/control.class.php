<?php

include 'dbh.class.php';

Class Control extends Dbh {
  public function insertAnswers($id, $value) {
    session_start();
    $user_email = $_SESSION['user_email'];
    $F_id = $_SESSION['F_id'];
    // $query = "DELETE FROM answers WHERE User_email = ? AND Q_id = ? ";
    // $result = $this->connect()->prepare($query);
    // $result->execute([$user_email,$id]);

    $query = "SELECT * FROM answers WHERE User_email = '$user_email' AND Q_id = $id ";
    $result = $this->connect()->prepare($query);
    if ($result->execute([$user_email,$id])){
      while ($rows = $result->fetch()){
          $data = $rows;
      }
  }

    if(!empty($data)){
      $query1 = "UPDATE answers SET Answer_desc = '$value' WHERE User_email = '$user_email' AND Q_id = $id  ";
      $result1 = $this->connect()->prepare($query1);
      $result1->execute([$value,$user_email,$id]);
    }

    else {
    $query1 = "INSERT INTO answers (`User_email`,`F_id`,`Q_id`,`Answer_desc`) VALUES (?,?,?,?) ";
    $result1 = $this->connect()->prepare($query1);
    $result1->execute([$user_email,$F_id,$id,$value]);
    }
  }
}

?>