<?php
// THIS ENABLES TYPE DECLARATION IN PHP, WHICH AVAILABLE IN LABGUAGES LIKE DART
declare( strict_types = 1 );            
include __DIR__.'/../../includes/class-autoLoad.inc.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <!-- Bootstrap css links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapcss.php';
    ?>
</head>
<body>
    <a href="../admin_login/admin_login.php" class="btn btn-primary">Admin Login</a>
    <a href="../user_login/user_login.php" class="btn btn-primary">User Login</a>

    <!-- Bootstrap js and jquery links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapjs.php';
        include_once __DIR__.'/../../includes/constants/jqueryLinks.php';
    ?>
</body>
</html>