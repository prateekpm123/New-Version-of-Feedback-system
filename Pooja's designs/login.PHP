<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LOGIN</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
    <link rel="stylesheet" href="jquery-ui-1.12.1.custom/jquery-ui.min.css">
    <link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet">
    <link rel="stylesheet" href="login.css">

</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-header">
        <!-- <a class="navbar-brand" href="#">Navbar</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button> -->

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="index.php">Home </a>
                </li>

                <!-- <li class="nav-item dropdown" id="user_dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Admin panel
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" id="dropdown">
                        <a class="dropdown-item" href="web/index.php">Stats</a>
                        <a class="dropdown-item" href="admin-control.html">Forms creation</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li> -->

                <li class="nav-item dropdown" id="user_dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php
                            if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) 
                            {
                                // echo "$username"; 
                                echo $_SESSION['uname'];
                            } 
                            else 
                            {
                                echo "Please log in first to see this page.";
                            }
                        ?>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" id="dropdown">
                        <a class="dropdown-item" href="logout.php">Logout</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="login.php">Login</a>
                </li>
                <!-- <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li> -->
            </ul>
        </div>
    </nav>

    <div class="container">
        <div class="row">
        <a class="push_button red" href="Admin_login.php" style="color:#FFF;
            text-decoration: none;">ADMIN LOGIN</a>

        <a class="push_button blue" href="User_login.php" style="color:#FFF;
            text-decoration: none;">USER LOGIN</a>

        </div>
    </div>


    <!-- ##### Bootstrap libraries ##### -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <!--  ###### Jquery libraries ##### -->
    <script src="jquery-ui-1.12.1.custom/external/jquery/jquery.js"></script>
    <script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
    <script src="#"></script>

</body>

</html>