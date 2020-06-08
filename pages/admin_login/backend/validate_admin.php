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
$adminData = $admin->getAdminValidationResults($admin_email, $password);

// echo $admin_email;
// echo $password;
// var_dump($adminData);
$count = count($adminData);
// echo "count is ".$count;

if($count == 1) {
    // echo '../../form_dashboard/test.php';
    header('../../form_dashboard/test.php');
    // echo "<script>location.href='../../form_dashboard/test.php'</script>";
    // echo "<script>alert('let sel')</script>";
    // echo "<script>location.href='../admin_login.php'</script>";

}

// echo $count;