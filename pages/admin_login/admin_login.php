<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADMIN LOGIN</title>
    
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
    <!-- NAVBAR -->
    <!-- <?php 
        // include_once __DIR__.'/../../includes/constants/navbar.php';
    ?> -->
    <div style="padding-top:80px;"></div>

    <div class="row">
        <div class="col-lg-4 col-md-3 col-sm-2"></div>
        <div class="col-lg-4 col-md-6 col-sm-8">
            <div class="card-body">
                <h3 class="card-title"><b>ADMIN LOGIN</b></h3>
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
    <script>
        function validate() {

            let email = $('#email').val();
            let password = $('#pwd').val();
            // console.log(email, password)
            
            // if(password.length >= 8)
            // {
                $('#password-warning').html(''); 
                $.ajax({
                    url: "backend/validate_admin.php",
                    type: "post", 
                    data : {
                        email : email,
                        password : password,
                    },
                    success: function(data, status) {
                        console.log(data);
                        if(data == 1) {
                            window.location.href = "../form_dashboard/form_dashboard.php";
                        } else  {
                            $('#validation-warning').html('<p class="warning">Wrong email or password</p>'); 
                        }
                        
                    }    
                });
            // } else {
            //     // $('#password-warning').html('<p class="warning">Enter password length more than 8 letters</p>'); 
            // }
            

        }
    </script>
    <script scr="admin_login.js"></script>

</body>

</html>