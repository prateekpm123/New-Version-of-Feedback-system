<?php

require('../../../classes/View.class.php');

if(isset($_POST['email']) && isset($_POST['password'])) {
    $user_email = htmlEntities($_POST['email']);
    $user_password = htmlEntities($_POST['password']);
}
    

$admin = new View();
// $result = $admin->getAdminValidationResults("prateek.manta@sakec.ac.in", "123456789");
$result = $admin->viewUserValidationResults($user_email, $user_password);



if($result != null) {
    // echo "<br>";
    // echo $result;
    // echo "<br>";

    echo 1;
    session_start();
    $_SESSION["user_email"] = $result['0']['User_email'];
    $_SESSION["user_id"] = $result['0']['User_id'];
    $_SESSION["role"] = $result['0']['Role'];
    $_SESSION["user_mentor"] = $result['0']['Mentor'];
    $_SESSION["user_department"] = $result['0']['Department'];
    $_SESSION["user_year"] = $result['0']['Year'];
    $_SESSION["user_div"] = $result['0']['Division'];



    // echo "<br>";
} else if ( $result == null ) {
    echo "";
} else {
    echo "" ?? "More than one user with same credentails found";
}
