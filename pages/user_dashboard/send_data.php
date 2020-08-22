<?php
  if(isset($_POST['id']) && isset($_POST['value'])){
    $qid = $_POST['id'];
    $value = $_POST['value'];
    include 'control.class.php';
    $submit = new Control();
    $submit->insertAnswers($qid,$value);
  }

  if(isset($_POST['F_id'])){
    $F_id = $_POST['F_id'];
    include 'view.class.php';
    $form = new View();
    $form->removeForm($F_id);
  }

?>