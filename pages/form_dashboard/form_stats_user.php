<?php
session_start();
$F_id = $_SESSION['F_id'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $_SESSION['Form_name']; ?></title>
    <!-- Bootstrap css links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapcss.php';
    ?>
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
  <nav class="navbar navbar-light bg-light sticky-top">
		<div class="col-12 text-center">
	    	<button class="btn btn-outline-danger" type="button" onClick="getRemaining(<?php echo $F_id; ?>)" >Remaining</button>
        <button class="btn btn-outline-primary" type="button" onClick="getMail(<?php echo $F_id; ?>)" >Send Mail</button>
        <div class="d-flex align-items-center" style="float: right;">
          <strong style="margin-right: 10px; display: none;" id="spinnerText">Sending Mails...</strong>
          <div class="spinner-border" role="status" style="display: none;" id="spinner">
            <span class="sr-only">Loading...</span>
          </div>
        </div>
	  	</div>
  </nav>
  <h3 align="center"><?php echo $_SESSION['Form_name']; ?></h3>
  <div class="container-fluid" id="records_content">
    <div class="row">
      <div class="col-12 col-sm-7">
        <input type="text" name="" class="form-control" id="myInput" placeholder="Search" onkeyup="searchFun()" style="width: 50%;">
      </div>
    </div>
    <div class="row">
    <?php
      $data = '<div class="col-12 col-sm-7" id="leftDiv">     
                <table class="table table-hover table-borderless" id="myTable">
                <thead class="thead-dark" align="center">
                  <tr>
                    <th style="width: 10%;">Sr No.</th>
                    <th style="width: 40%;">User Name</th>
                    <th style="width: 20%;">Date</th>
                    <th style="width: 30%;">Response</th>
                  </tr>
                </thead>';
      
      include '../../classes/model.class.php';
      $view = new Model();
      $rows = $view->fetchUsersResponse($F_id);
      if(!empty($rows)){
        $number = 1;
        foreach($rows as $row )
        {
      $data .= '<tr>
                    <td align="center"><b>'.$number.'</b></td>
                    <td align="center" id="'.$number.'">'.$row['User_email'].'</td>
                    <td align="center"> </td>
                    <td align="center"><button class="btn btn-success btn-sm" 
                    onclick="getUserResponseDetails('.$row['F_id'].','.$number.')">Check Response</button></td>
                </tr>';
      $number++;          
        }
      }
      else {
        $data .= '<div class="row">
                    <div class="col-12">
                      <h2 class="text-center">No responses for this form !!</h2>
                    </div>
                  </div>';
      }
      
      $data .= '</table>
                  </div>';
      echo $data;
    ?>
    <div class="col-12 col-sm-5" id="response_card">
      
    </div>
    </div>
  </div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://smtpjs.com/v3/smtp.js"></script>
<script>
  function searchFun(){
    let filter = document.getElementById('myInput').value;
    let myTable = document.getElementById('myTable');
    let tr = myTable.getElementsByTagName('tr');
    //console.log(tr);
    for(var i=1; i<tr.length; i++){
      let td = tr[i].getElementsByTagName('td')[1];

      if(td){
        let textValue = td.textContent || td.innerHTML;

        if(textValue.indexOf(filter) >= 0){
          tr[i].style.display = "";
        }else{
          tr[i].style.display = "none";
        }
      }
    }
  }

  function getUserResponseDetails(F_id,num){
    x = document.getElementById(num).textContent;
    //console.log(x);
    $.ajax({
    url: "backend/getUserResponseDetails.php",
    method: "post",
    data: {
      F_id: F_id,
      User_name: x,
    },
    success: function (data, success) {
    $("#response_card").html(data);
    //console.log(data);
    },
  });
  }

  function getRemaining(F_id) {
    $.ajax({
    url: "backend/getRemainingUsers.php",
    method: "post",
    data: {
      F_id: F_id,
    },
    success: function (data, success) {
      $("#response_card").html(data);
    },
  });
  }

  function getMail(RF_id) {
    document.getElementById('spinnerText').style.display = "block";
    document.getElementById('spinner').style.display = "block";
    $.ajax({
    url: "backend/getRemainingUsers.php",
    method: "post",
    data: {
      RF_id: RF_id,
    },
    success: function (data, success) {
      //var mail_ids = data.split(",");
      sendMail(data);
      console.log(data);
    },
  });
  }

  function sendMail(mail_id) {
    
  Email.send({ 
        Host: "smtp.gmail.com", 
        Username: "",  //Enter email id in the double qoutes
        Password: "", //Enter the password for the same
        To: mail_id, 
        From: "", //Same email id
        Subject: "Sending Email using javascript", 
        Body: "Well that was easy!!", 
      }) 
        .then(function (message) {  
          document.getElementById('spinnerText').style.display = "none";
          document.getElementById('spinner').style.display = "none";
          alert("mail sent successfully");
        }); 
  }
</script>
</body>
</html>