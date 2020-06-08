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
    <link rel="stylesheet" href="form_dashboard.css">
</head>
<body>
    <!-- NAVBAR -->
    <?php 
        include_once __DIR__.'/../../includes/constants/navbar.php';
    ?>
    <div class="container-fluid">
        <div class="row">
        <div class="col-lg-2"></div>
        <div class="col-lg-8">
            <h2 class="text-primary">Your Forms</h2>
            <!-- <button class="btn btn-primary" onclick="test()">Test</button> -->

            <div id="form-content"></div>
            <h2>Versions</h2>
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