<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<link rel="stylesheet" href="user_feedback.css">
    <title>User Feedback</title>

  </head>

<body>
  
  <div class="container" id="records_content">
    
  </div>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

  $(document).ready(function(){
        readRecords();
  });

  function readRecords() {
		var readrecord = "readrecord";
        $.ajax({
          url:"load_data.php",
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

	function submitForm() {
		
	}
</script>
</body>
</html>