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
<div class="container">
<br><br>
  <div class="row">
    <div class="col-lg-3"></div>
      <div class="col-lg-6">
      <?php
      error_reporting(0);
        $F_id = $_SESSION['F_id'];
        $admin_email = $_SESSION['Admin_email'];
        include '../../classes/model.class.php';
        $view = new Model();
        $rows = $view->fetchShareDetails($F_id,$admin_email);
        $data = '<div class="card">
                    <h3 class="card-header bg-primary text-white">Form Collaborate</h3>
                    <div class="card-body">
                    <form>
                      <dl class="row">
                        <dt class="col-4">Recipient 1: </dt>
                        <dd class="col-8"><input type="text" id="text1" onchange="formSubmit(this,1)" class="form-control" 
                        value="'.$rows[0]['shared_with'].'"</dd>
                      </dl>
                      <dl class="row">
                        <dt class="col-4">Recipient 2: </dt>
                        <dd class="col-8"><input type="text" id="text2" onchange="formSubmit(this,2)" class="form-control" 
                        value="'.$rows[1]['shared_with'].'"</dd>
                      </dl>
                      <dl class="row">
                        <dt class="col-4">Recipient 3: </dt>
                        <dd class="col-8"><input type="text" id="text3" onchange="formSubmit(this,3)" class="form-control" 
                        value="'.$rows[2]['shared_with'].'"</dd>
                      </dl>
                      <dl class="row">
                        <dt class="col-4">Recipient 4: </dt>
                        <dd class="col-8"><input type="text" id="text4" onchange="formSubmit(this,4)" class="form-control" 
                        value="'.$rows[3]['shared_with'].'"</dd>
                      </dl>
                      <dl class="row">
                        <dt class="col-4"></dt>
                        <dd class="col-8"><button class="btn btn-primary" onclick="formSubmit()">Save</button>
                          <button type="button" class="btn btn-danger" onclick="formClear()">Clear</button>
                        </dd>
                      </dl>
                      </form>
                    </div>
                  </div>';
        echo $data;
      ?>
      </div>
    <div class="col-lg-3"></div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>

function formClear(){
  var a = document.getElementById('text1');
  var b = document.getElementById('text2');
  var c = document.getElementById('text3');
  var d = document.getElementById('text4');
  a.value = null;
  b.value = null;
  c.value = null;
  d.value = null;
}

function formSubmit(element,num) {
  var a = element.value;
  //console.log(a);
  $.ajax({
    url: "backend/sendShareDetails.php",
    method: "post",
    data: {
      shared_id: a,
      num: num
    },
    success: function (data, success) {
    //alert("Data Successfully Saved")
    //console.log(data);
    },
  });
}

</script>
</body>
</html>