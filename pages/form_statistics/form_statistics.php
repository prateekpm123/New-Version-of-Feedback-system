<?php
session_start();
$F_id = $_SESSION['Form_name'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $F_id;?></title>
    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapcss.php';
    ?>
</head>
<style>
    .card {
        border: none;
    }

</style>
<body>
    <nav class="navbar navbar-light bg-light sticky-top">
		<div class="col-12 text-center">
	    	<button class="btn btn-outline-success" type="button" onClick="renderStatsOnLoad()">Display Stats</button>
            <button class="btn btn-outline-danger" id="print" type="button" onClick="printPage()" style="display: none;">Save as PDF</button>
	  	</div>
	</nav>
    <div class="container">
        <div class="row">
            <div class="col-12 col-sm-1"></div>
            <div class="col-12 col-sm-10" id="records_content"></div>
            <div class="col-12 col-sm-1"></div>
        </div>
    </div>

    <?php 
        include_once __DIR__.'/../../includes/constants/bootstrapjs.php';
        include_once __DIR__.'/../../includes/constants/jqueryLinks.php';
    ?>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="form_statistics.js"></script>
</body>
</html>