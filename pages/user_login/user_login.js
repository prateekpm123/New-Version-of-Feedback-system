function validate() {

    let email = $('#email').val();
            let password = $('#pwd').val();
            // console.log(email, password)
            
            // if(password.length >= 8)
            // {
                $('#password-warning').html(''); 
                $.ajax({
                    url: "backend/validate_user.php",
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