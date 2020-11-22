<?php 
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Share Forms</title>
    <!-- Bootstrap css links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapcss.php';
    ?>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="form_dashboard.css">
</head>
<body onload="formRenderData()">
<div class="container"> 
<br><br>
  <div class="row">
    <div class="col-lg-3"></div>
      <div class="col-lg-6">
        <div class="card">
          <h3 class="card-header bg-primary text-white">Form Collaborate</h3>
          <div class="card-body">
            <input type="text" class="form-control" style="margin-bottom:10px;" id="shareEmail" placeholder="Enter email id of the person you wanna share with">
            <button class="btn btn-primary" onclick="formSubmit()">Share</button>
            <p>
              <?php  
                // echo $_SESSION['F_id'];
                $F_id = $_SESSION['F_id'];
                $admin_email = $_SESSION['Admin_email'];
                include '../../classes/model.class.php';
                $view = new Model();
                $formData = $view->fetchShareDetails($F_id,$admin_email);
                // var_dump($formData);
              ?>
            </p>
            <div id="shareFormData"></div>
          </div>
        </div>
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

function formSubmit() {
  a = $("#shareEmail").val();
  // var a = "testing";
  // num = 3
  // alert(a);
  $.ajax({
    url: "backend/sendShareDetails.php",
    method: "post",
    data: {
      shared_id: a,
    },
    success: function (data, success) {
    // alert("Data Successfully Saved")
    //console.log(data);
    formRenderData();
    $("#shareEmail").val() = "";
    document.getElementById("shareEmail").value = '';
    },
  });
}

function deleteSharedForms(ShareId) {
  console.log("Shared form ID is ",ShareId);
  $.ajax({
    url: 'deleteSharedForm.php',
    method: 'post',
    data: {
      shareId :ShareId,
    },
    success: function(data, status) {
      // alert(data);
      formRenderData();
    },
  });
}

function formRenderData() {
  $.ajax({
    url: 'renderShareFormData.php',
    method: 'post',
    data: {},
    success: function (data, status) {
      $('#shareFormData').html(data);
      //console.log('Form data render is working');
    },
  });
}

</script>
</body>
</html>