<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>User Dashboard</title>

  </head>

<body>
  <nav class="navbar navbar-expand navbar-dark bg-dark">
    <h4 class="text-white">Username</h4>
    <a class="navbar-brand ml-auto" href="#">Logout</a>
  </nav>
  <div class="container" id="records_content">
    <?php
      $data = '<div class="row">
                <div class="col-12 col-sm-2"></div>
                <div class="col-12 col-sm-8">
                <h2 align="center">Pending Forms</h2>
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
                    <td><button class="btn btn-success btn-sm">Fill Form</button></td>
                </tr>';
      $number++;          
        }
      }
      
      $data .= '</tbody>
                </table>
                </div>
                  <div class="col-12 col-sm-2"></div>
                </div>';
      echo $data;
    ?>
  </div>




<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>