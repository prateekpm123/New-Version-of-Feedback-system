<?php

session_start();

?>

<!DOCTYPE html>
	<html>
		<head>
			<title>
			<?php

				echo "Preview : ".$_SESSION["Form_name"];

			?>
			</title>
				<meta charset="utf-8">
		    	<meta name="viewport" content="width=device-width, initial-scale=1">
		      	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
		      	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
		    	<link rel="stylesheet" href="form_preview.css">
		</head>
<body>

	
		
		<div id="records_content" class="container">
			
		</div>
		
	



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.19.1/js/mdb.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
        readRecords();
      });

	function readRecords() {
		var readrecord = "readrecord";
        $.ajax({
          url:"load_preview.php",
          type:"post",
          data: { readrecord:readrecord },
          success:function(data,status){
            $('#records_content').html(data);
            optionhidefornull();
          }
        });
	}

	function optionhidefornull(){
		var x = document.getElementsByClassName("content");
		var option1 = document.getElementsByClassName("option1");
		var option2 = document.getElementsByClassName("option2");
		var option3 = document.getElementsByClassName("option3");
		var option4 = document.getElementsByClassName("option4");
		var option5 = document.getElementsByClassName("option5");
		var option1div = document.getElementsByClassName("option1class");
		var option2div = document.getElementsByClassName("option2class");
		var option3div = document.getElementsByClassName("option3class");
		var option4div = document.getElementsByClassName("option4class");
		var option5div = document.getElementsByClassName("option5class");

		  for(var i=0; i<x.length; i++){
			if(option1[i].value == ''){
				option1div[i].style.display = "none";
			}
			if(option2[i].value == ''){
				option2div[i].style.display = "none";
			}
			if(option3[i].value == ''){
				option3div[i].style.display = "none";
			}
			if(option4[i].value == ''){
				option4div[i].style.display = "none";
			}
			if(option5[i].value == ''){
				option5div[i].style.display = "none";
			}
		  }
	}

	function printPage(){
		var printArea = document.getElementById("records_content").innerHTML;
		var originalContent = document.body.innerHTML;
		document.body.innerHTML = printArea;
		var x = document.getElementById("print");
		x.style.display = "none";
		window.print();
		document.body.innerHTML = originalContent;
	}
</script>
</body>
</html>

