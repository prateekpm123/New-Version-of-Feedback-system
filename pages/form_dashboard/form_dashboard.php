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
                <li class="nav-item active">
                    <a class="nav-link navbar-brand" href="#"><span><i class="fa fa-list-ul"></i></span> Form Control</a>
                </li>
                <!-- <li class="nav-item">
                    <a class="nav-link navbar-brand" href="#"><span><i class="fa fa-area-chart"></i></span> Form Statistics</a>
                </li> -->
                <li class="nav-item">
                    <a class="nav-link navbar-brand" href="#">
                        <?php 
                            echo $username; 
                        ?>
                    </a>
                </li>
                <li class="nav-item">
                    <button id="modal-button"  type="button" class="btn btn-primary rounded-pill" data-toggle="modal" data-target=".bd-example-modal-test">+ Create Form</button>
                </li>
            </ul>
            <a class="navbar-brand ml-auto" href="../admin_login/admin_login.php"><span><i class="fa fa-sign-in"></i></span> Logout</a>
    </nav>
    <br>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12 col-sm-2"></div>
            <div class="col-12 col-sm-8">
                <div class="row">
                    <div class="col-12">
                        <h2>Shared Forms</h2>
                    </div>
                    <div id="shared_content" class="col-12"></div> 
                </div>    
            </div>
        </div>
        <div class="row">
            <div class="col-12 col-sm-2"></div>
            <div class="col-12 col-sm-8">
                <div class="row">
                    <div class="col-12">
                        <h2>Forms</h2>
                    </div>  
                    <div id="form-content" class="col-12"></div>
                </div>
            </div>
        </div>
    </div>
    <div id="modal-area">
    </div>
    <!-- <div class="col-12 col-sm-6" id="form-version-content" > -->
        
    <!-- </div> -->
    

    <!-- Bootstrap js and jquery links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapjs.php';
        include_once __DIR__.'/../../includes/constants/jqueryLinks.php';
    ?>
    <script src="form_dashboard.js"></script>
    <script>

    function publishForm(F_id) {
    var a = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass1").value; 
    var b = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass2").value;
    var c = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass3").value;
    var d = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass4").value;
    var e = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass5").value;
    var f = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass6").value;
   // console.log(a);
   if (a == 'Everyone'){
        b = null;
        c = null;
        d = null;    
   }
   else if (a == 'Teacher'){
       c = null;
       d = null;
   }
   if (b == 'All Departments'){
       c = null;
       d = null;
   }
   if (c == 'All years'){
       d = null;
   }

   var table = document.getElementsByClassName("version-row");
   //console.log(table);
   for (var i=0; i<table.length; i++){
       if(table[i].style.color == "red"){
           table[i].style.color = "black";
           table[i].style.background = "white";
       }
   }
   var publish_color = document.getElementById("tableRow"+F_id);
   publish_color.style.color = "red";
   publish_color.style.background = "#ffcccb";
    $.ajax({
    url: "frontend/publishModal.php",
    method: "post",
    data: {
      F_id: F_id,
      Role: a,
      Department: b,
      Year: c,
      Division: d,
      Start: e,
      End: f
    },
    success: function (data, status) {
      
    },
  });
}

function publishChange(F_id) {
    var a = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass1").value;
    var b = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass2").value;
    var c = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass3").value;
    var x = document.getElementById("publishModal"+F_id+"").querySelector(".publishDiv1");
    var y = document.getElementById("publishModal"+F_id+"").querySelector(".publishDiv2");
    var z = document.getElementById("publishModal"+F_id+"").querySelector(".publishDiv3");

    if (a == 'Everyone'){
         x.style.display = "none";
         y.style.display = "none";
         z.style.display = "none";
    }
    else if (a== 'Teacher'){
        x.style.display = "block";
        y.style.display = "none";
        z.style.display = "none";
    }
    else{
        x.style.display = "block";
        y.style.display = "block";
        z.style.display = "block";
    }
}

function publishChange1(F_id){
    var a = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass1").value;
    var b = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass2").value;
    var c = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass3").value;
    var y = document.getElementById("publishModal"+F_id+"").querySelector(".publishDiv2");
    var z = document.getElementById("publishModal"+F_id+"").querySelector(".publishDiv3");

    if (b == 'All Departments'){
        y.style.display = "none";
        z.style.display = "none";
    }
    else if (b == 'CM' || b == 'IT' || b == 'ETRX' || b == 'EXTC'){
        if (a == 'Teacher'){
        y.style.display = "none";
        z.style.display = "none";  
        }
        else if (a == 'Student'){
            y.style.display = "block";
            z.style.display = "block";
        }
    }
}

function publishChange2(F_id){
    var c = document.getElementById("publishModal"+F_id+"").querySelector(".publishClass3").value;
    var z = document.getElementById("publishModal"+F_id+"").querySelector(".publishDiv3");

    if (c == 'All years'){
        z.style.display = "none";
    }
    else{
        z.style.display = "block";
    }
}

function shareDetails(F_id){
    $.ajax({
    url: "test.php",
    method: "post",
    data: {
      F_id: F_id,
    },
    success: function (data, success) {
      if (success == "success") {
     //   console.log(data);

        // alert("nothing delte");
        window.open("shareForm.php", "_blank");
      }
    },
  });
}

    </script>
</body>
</html>