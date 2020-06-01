<?php

require('../../../classes/View.class.php');

if(isset($_POST['email']) && isset($_POST['password'])) {
    $admin_email = $_POST['email'];
    $password = $_POST['password'];
}
    
$admin = new View();
$adminData = $admin->showAdminData();

var_dump($adminData);

