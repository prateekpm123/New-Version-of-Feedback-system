<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Dashboard</title>
    <!-- Bootstrap css links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapcss.php';
    ?>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="form_dashboard.css">
</head>
<body>
    <?php 
      $username = $_SESSION['admin_username'];
    ?>
    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-header">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link navbar-brand" href="form_dashboard.php"><span><i class="fa fa-list-ul"></i></span> Form Control</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link navbar-brand" href="#"><span><i class="fa fa-area-chart"></i></span> Form Statistics</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link navbar-brand" href="#">
                        <?php 
                            echo $username; 
                        ?>
                    </a>
                </li>
            </ul>
            <a class="navbar-brand ml-auto" href="../admin_login/admin_login.php"><span><i class="fa fa-sign-in"></i></span> Logout</a>
    </nav>

<!-- Bootstrap js and jquery links from constants folder -->
    <?php 
      include_once __DIR__.'/../../includes/constants/bootstrapjs.php';
      include_once __DIR__.'/../../includes/constants/jqueryLinks.php';
    ?>
</body>
</html>