<?php

require('../../../classes/View.class.php');

if(isset($_POST['email']) && isset($_POST['password'])) {
    $admin_email = htmlEntities($_POST['email']);
    $password = htmlEntities($_POST['password']);
}
    
$admin = new View();
$adminData = $admin->getAdminValidationResults($admin_email, $password);

echo $admin_email;
echo $password;
var_dump($adminData);

