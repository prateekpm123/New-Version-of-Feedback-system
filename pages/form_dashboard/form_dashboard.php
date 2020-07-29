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
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">

    <link rel="stylesheet" href="form_dashboard.css">
</head>
<body>
    <!-- NAVBAR -->
    <?php 
        $username = $_SESSION['admin_username'];
    ?>
    <?php 
        include_once __DIR__.'/../../includes/constants/navbar.php';
    ?>
    <div class="container-fluid">
        <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <div class="row">
                <div class="col-lg-6">
                    <h2 class="">Your Forms</h2>
                </div>
                <div class="col-lg-6">
                    <!-- <button class="btn btn-primary" onclick="createForm()"><b>Create before</b></button> -->
                    <button id="modal-button" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Create</button>
                    <div id="modal-area">
                    </div>
                    
                </div>
            </div>
            <div id="form-content"></div>
            <div class="row">
                <div class="col-lg-6">
                    <h2>Versions</h2>
                </div>
                <div class="col-lg-6">
                    <!-- <button id="create-version" type="button" class="btn btn-primary">Create Version</button> -->
                </div>
                <div id="publish-modal">
                    
                </div>
            </div>
            <div id="form-version-content">
                
            </div>
        </div>
        

        
        <div class="col-lg-2"></div>
    </div>
    </div>
    

    <!-- Bootstrap js and jquery links from constants folder -->
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapjs.php';
        include_once __DIR__.'/../../includes/constants/jqueryLinks.php';
    ?>
    <script src="form_dashboard.js"></script>
</body>
</html>