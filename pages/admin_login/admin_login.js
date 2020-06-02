// function validate() {

//     let email = $('#email').val();
//     let password = $('#pwd').val();
//     // console.log(email, password)

//     if (password.length > 8) {
//         $.ajax({
//             url: "backend/validate_admin.php",
//             type: "post",
//             data: {
//                 email: email,
//                 password: password,
//             },
//             success: function (data, status) {
//                 console.log(data);
//             }
//         });
//     } else {
//         $('#password-warning').html('<p class="warning">Enter password length more than 8 letters</p>');
//     }


// }