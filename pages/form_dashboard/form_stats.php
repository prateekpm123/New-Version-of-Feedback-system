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
    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
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

    <br>
  <div class="container-fluid" id="records_content">
    <div class="row">
    <?php
      $data = '<div class="col-12 col-sm-8">
                <table class="table table-hover table-borderless table-striped">
                <thead align="center" class="thead-dark">
                  <tr>
                    <th style="width: 10%;">Sr No.</th>
                    <th style="width: 60%;">Form Name</th>
                    <th style="width: 10%;">Version</th>
                    <th style="width: 20%;">Response</th>
                  </tr>
                </thead>';
      
      include '../../classes/model.class.php';
      $view = new Model();
      $rows = $view->fetchPublishedForms();
      if(!empty($rows)){
        $number = 1;
        foreach($rows as $row )
        {
      $data .= '<tr>
                    <td align="center"><b>'.$number.'</b></td>
                    <td align="center">'.$row['Form_name'].'</td>
                    <td align="center">'.$row['Form_version'].'</td>
                    <td align="center"><button class="btn btn-success btn-sm" onclick="getResponseDetails('.$row['F_id'].')">Check Response</button></td>
                </tr>';
      $number++;          
        }
      }
      else {
        $data .= '<div class="row">
                    <div class="col-12">
                      <h2 class="text-center">No forms have been published!!</h2>
                    </div>
                  </div>';
      }
      
      $data .= '</table>
                  </div>';
      echo $data;
    ?>
  
    <div class="col-12 col-sm-4 sticky-top" id="response_card">

    </div>
    
    
    </div>
  </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
  function getResponseDetails(F_id) {
  $.ajax({
    url: "backend/getFormResponse.php",
    method: "post",
    data: {
      F_id: F_id,
    },
    success: function (data, success) {
    $("#response_card").html(data);
    //console.log(data);
    },
  });
}

  function getUserNames(F_id) {
    $.ajax({
    url: "backend/getUserNames.php",
    method: "post",
    data: {
      F_id: F_id,
    },
    success: function (data, success) {
    window.location = "form_stats_user.php"
    //console.log(data);
    },
  });
  }
</script>
</body>
</html>