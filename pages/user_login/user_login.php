<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>USER LOGIN</title>
    
    <!-- Bootstrap css links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapcss.php';
    ?>
    <link rel="stylesheet" href="admin_login.css">

</head>

<body> 
<div class="container-fluid">
    <?php  
        $username = "nothing";
     ?>
    <!-- NAVBAR
    <?php 
        //include_once __DIR__.'/../../includes/constants/navbar.php';
    ?> -->
    <div style="padding-top:80px;"></div>
    <div class="row">
        <div class="col-lg-4 col-md-3 col-sm-2"></div>
        <div class="col-lg-4 col-md-6 col-sm-8">
            <div class="card-body">
                <h3 class="card-title"><b>USER LOGIN</b></h3>
                <hr>
                <!-- <form action="backend/validate_admin.php" method="post"> -->
                    <div class="input-group flex-nowrap">
                        <input type="email" class="form-control" placeholder="Admin Email" aria-label="email" id="email"
                        aria-describedby="addon-wrapping" name="admin_email">
                    </div>
                    <div id="email-warning">
                    </div>

                    <div class="input-group flex-nowrap">
                        <input type="password" class="form-control" placeholder="Password" aria-label="Password" id="pwd"
                            aria-describedby="addon-wrapping" name="password">
                    </div>
                    <div id="password-warning">
                    </div>
                    <div id="validation-warning">
                    </div>
                    <div class="custom-control custom-checkbox my-1 mr-sm-2">
                        <input type="checkbox" class="custom-control-input" id="customControlInline">
                        <label class="custom-control-label" for="customControlInline">Remember me</label>
                    </div>

                    <br>
                    <!-- <input type="submit" class="btn btn-primary btn-lg btn-block submit" name="login" value="Login" onclick="validate()"> -->
                    <button class="btn btn-primary form-control" onclick="validate()">Login</button>

                    <p class="forgot"><a href="www.google.com"><u>Forgot password?</u></a></p>

                <!-- </form> -->
            </div>
        </div>  
        <div class="col-lg-4 col-md-3 col-sm-2"></div>
    </div>
</div>
    



    <!-- Bootstrap js and jquery links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapjs.php';
        include_once __DIR__.'/../../includes/constants/jqueryLinks.php';
    ?>
    <script src="user_login.js"></script>

</body>

</html>