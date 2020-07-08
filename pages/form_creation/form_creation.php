<!DOCTYPE html>
<html>
<head>
	<title>Form Creation</title>
	 	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
    	
    	
</head>
<body>
  			<div class="container">
  				<div class="row">
  		<div id="records_content" class="col-8">
    		
  		</div>
  		<div class="col-4">
  			<div class="sticky-top">
  				<h4 align="center">Create Question</h4>
  				<form name="create-question">
  				<div class="form-group">
		          	<input type="text" autocomplete="off" name="" id="question" class="form-control" placeholder="Enter the question">
	        	 </div>
	        	<div class="form-group">
		        	<label for="type">Type:</label>
	    			<select name="type" id="type" onchange="optionhidefortext()" >
	    			<option value="radio">radio</option>
	    			<option value="text" >text</option>
	    			<option value="multiplechoice">multiplechoice</option>
	    			</select>
	        	</div>
	        	<div id="option" name="option">
			        <div class="form-group">
			          <input type="text" autocomplete="off"  id="option1" class="form-control" placeholder="Enter option 1">
			        </div>
			        <div class="form-group">
			          <input type="text" autocomplete="off"  id="option2" class="form-control" placeholder="Enter option 2">
			        </div>
			        <div class="form-group">
			          <input type="text" autocomplete="off"  id="option3" class="form-control" placeholder="Enter option 3">
			        </div>
			        <div class="form-group">
			          <input type="text" autocomplete="off"  id="option4" class="form-control" placeholder="Enter option 4">
			        </div>
			        <div class="form-group">
			          <input type="text" autocomplete="off"  id="option5" class="form-control" placeholder="Enter option 5">
			        </div>

	    	</div>
	    	<div class="footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="addRecord()">Save
	        </button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="formSubmit()">Clear
	        </button>
	        </div>
	  		</form>
	      </div>
  			</div>
  		</div>
  	</div>
  </div>

  		
 


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
 
	<script type="text/javascript">
		$(document).ready(function(){
        readRecords();

      });
      
      function readRecords(){
        var readrecord = "readrecord";
        $.ajax({
          url:"load_data.php",
          type:"post",
          data: { readrecord:readrecord },
          success:function(data,status){
            $('#records_content').html(data);
            if (status == 'success') {
            	optionhidefortextonrefresh();           
            	}
          }
        });
      }

       function addRecord(){
        var question = $('#question').val();
        var type = $('#type').val();
        var option1 = $('#option1').val();
        var option2 = $('#option2').val();
        var option3 = $('#option3').val();
        var option4 = $('#option4').val();
        var option5 = $('#option5').val();

        if (type == 'text'){
          option1 = null;
          option2 = null;
          option3 = null;
          option4 = null;
          option5 = null;
        }

        if ( question !== "") {
          $.ajax({
          url:"send_data.php",
          type:"post",
          data: { question : question,
          	  type : type,	
              option1 : option1,
              option2 : option2,
              option3 : option3,
              option4 : option4,
              option5 : option5,
           },

           success:function(data,status){
            readRecords();
            formSubmit();
           }

        });
      }
      else {
        alert("Question Field can not be empty");
      }
      }

      function updatetheparticularchange(element,column,id) {
        if(column == 2){
          var value1 = element.value;
            var id1 = element.name;
            var a = document.getElementById(id1);
            if (value1 == 'text') {
              a.style.display = "none";
            }
            else {

              a.style.display = "block";
            }
        }
      	var value = element.value;
        $.ajax({
              url:'load_data.php',
              type:'post',
              data: {
                value: value,
                column: column,
                id: id
              },
              success:function(data,status){
                 readRecords();
              }
            });
      }

       function deleteQuestion(deleteid){
        var conf = confirm("Are you sure?");
        if(conf==true){
          $.ajax({
            url:"send_data.php",
            type:"post",
            data: { deleteid:deleteid },
            success:function(data,status){
              readRecords();
            }
          });
        }
      }

     function optionhidefortext() {
     	var value = document.getElementById("type").value;
     	var a = document.getElementById("option");
     	if (value == 'text') {
        a.style.display = "none";
     	}
     	else {
     		a.style.display = "block";
     	}

     }

     function optionhidefortextonrefresh() {
     	var x = document.getElementsByClassName("content");
     	var a = document.getElementsByClassName("selectarea");
     	var b = document.getElementsByClassName("optionarea");
     	for (var i=0; i < x.length; i++) {
     		if (a[i].value == 'text'){
     			b[i].style.display = "none";
        }
     		else {
     			b[i].style.display = "block";
     		}
     	}
     }
     
     function formSubmit() {
     	var frm = document.getElementsByName("create-question")[0];
     	frm.reset();
     	// preventDefault();
     }
	</script>
</body>
</html>

