<?php

session_start();
$F_id = $_SESSION['F_id'];
$admin_email = $_SESSION['Admin_email'];
if(isset($_POST['shared_id']) ) {
  $shared_id = $_POST['shared_id'];
  $num = $_POST['num'];
  include '../../../classes/model.class.php';
  $view = new Model();
  $view->sendSharedFormDetails($F_id,$admin_email,$shared_id);
}

?>