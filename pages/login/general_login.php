<?php

?>

<html>
  <button onclick=AdminLoginPage();>Admin</button>
  <button onclick=UserLoginPage();>User</button>

  <script>
    function AdminLoginPage(){
      window.location.href = "admin_login.php"
    }

    function UserLoginPage(){
      window.location.href = "user_login.php"
    }
    
  
  
  </script>

</html>