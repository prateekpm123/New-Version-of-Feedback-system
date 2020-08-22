<?php

include 'dbh.class.php';

Class Control extends Dbh {
  public function insertAnswers($id, $value) {
    session_start();
    $user_email = $_SESSION['user_email'];
    $query = "DELETE FROM answers WHERE User_email = ? AND Q_id = ? ";
    $result = $this->connect()->prepare($query);
    $result->execute([$user_email,$id]);

    $query1 = "INSERT INTO answers (`User_email`,`Q_id`,`Answer_desc`) VALUES (?,?,?) ";
    $result1 = $this->connect()->prepare($query1);
    $result1->execute([$user_email,$id,$value]);
  }
}

?>