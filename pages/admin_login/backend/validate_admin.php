<?php

require('../../../classes/View.class.php');

if(isset($_POST['email']) && isset($_POST['password'])) {
    $admin_email = htmlEntities($_POST['email']);
    $password = htmlEntities($_POST['password']);
}
    
// if(isset($_POST['submit'])) {
//     // $admin_email = htmlEntities($_POST['admin_email']);
//     // $password = htmlEntities($_POST['password']);
// }

// $admin_email = htmlEntities($_POST['admin_email']);
// $password = htmlEntities($_POST['password']);


$admin = new View();
// $result = $admin->getAdminValidationResults("prateek.manta@sakec.ac.in", "123456789");
$result = $admin->getAdminValidationResults($admin_email, $password);



if($result != null) {
    // echo "<br>";
    // echo $result;
    // echo "<br>";

    echo 1;
    session_start();
    $_SESSION["admin_username"] = $result['0']['Admin_email'];
    $_SESSION["admin_id"] = $result['0']['Admin_id'];
    // echo "<br>";
} else if ( $result == null ) {
    echo "";
} else {
    echo "" ?? "More than one user with same credentails found";
}
// echo $admin_email;
// echo $password;
// var_dump($result);
// $count = count($adminData);
// echo "count is ".$count;

// if($count == 1) {
//     // echo '../../form_dashboard/test.php';
//     header('../../form_dashboard/test.php');
//     // echo "<script>location.href='../../form_dashboard/test.php'</script>";
//     // echo "<script>alert('let sel')</script>";
//     // echo "<script>location.href='../admin_login.php'</script>";

// }
// echo "<br>";
// echo($result['0']['Admin_email']);