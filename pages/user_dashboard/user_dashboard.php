<?php
  session_start();
?>
<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <title>User Dashboard</title>

  </head>

<body>
  <nav class="navbar navbar-expand navbar-dark bg-dark">
    <a class="nav-link text-white" href="#"><?php echo $_SESSION['user_email']; ?></a>
    <a class="navbar-brand ml-auto" href="../user_login/user_login.php"><span><i class="fa fa-sign-in"></i></span> Logout</a>
  </nav>
  <br>
  <div class="container" id="records_content">
    <?php
      $data = '<div class="row">
                <div class="col-12 col-sm-2"></div>
                <div class="col-12 col-sm-8">
                <table class="table table-hover table-borderless table-striped">
                <thead class="thead-dark">
                  <tr>
                    <th>Sr No.</th>
                    <th>Form Name</th>
                    <th>Submit Form</th>
                  </tr>
                </thead>';
      
      include 'view.class.php';
      $view = new View();
      $rows = $view->fetchForms();
      if(!empty($rows)){
        $number = 1;
        foreach($rows as $row )
        {
      $data .= '<tr>
                    <th scope="row">'.$number.'</th>
                    <td>'.$row['Form_name'].'</td>
                    <td><button class="btn btn-success btn-sm" onclick="getFormDetails('.$row['F_id'].')">Fill Form</button></td>
                </tr>';
      $number++;          
        }
      }
      else {
        $data .= '<div class="row">
                    <div class="col-12">
                      <h2 class="text-center">No forms available for you!!</h2>
                    </div>
                  </div>';
      }
      
      $data .= '</tbody>
                </table>
                </div>
                  <div class="col-12 col-sm-2"></div>
                </div>';
      echo $data;
    ?>
  </div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
  
  function getFormDetails(F_id) {
  let test = F_id;
   $.ajax({
    url: "test.php",
    method: "post",
    data: {
      F_id: test,
    },
    success: function (data, success) {
      if (success == "success") {
        window.location.href = "user_feedback.php";
      }
    },
  });

}
</script>
</body>
</html>