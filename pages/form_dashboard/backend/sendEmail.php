<?php

if(isset($_POST['F_id']) && isset($_POST['mail_ids'])){
    $F_id = $_POST['F_id'];
    $mail_ids = $_POST['mail_ids'];
    $message = "Hello";
    mail('singh.aniket0408@gmail.com', 'Test', $message);
}


?>