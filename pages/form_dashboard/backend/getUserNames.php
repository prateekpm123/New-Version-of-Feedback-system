<?php

  $F_id = $_POST['F_id'];
  session_start();
  include '../../../classes/model.class.php';
  $getUsers = new Model();
  $row = $getUsers->getFormDataForResponse($F_id);
  $_SESSION['F_id'] = $F_id;
  $_SESSION['Form_name'] = $row[0]['Form_name'];

?>