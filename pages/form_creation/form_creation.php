<!DOCTYPE html>
<html>
<head>
	<title>Form Creation</title>
	 	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    	
</head>
<body>
	
		<div class="d-flex justify-content-end">
    	<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">Create Question</button>
  		</div>
  		<div id="records_content">
    		
  		</div>

  		<!----Modal----->
  		<div class="modal" id="myModal">
  			<div class="modal-dialog">
    			<div class="modal-content">

	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Create Question</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>

	      <!-- Modal body -->
	      <div class="modal-body">
	        <div class="form-group">
	          <label> Question</label>
	          <input type="text" name="" id="question" class="form-control" placeholder="Enter the question">
	        </div>
	        <div class="form-group">
	          <label> Option 1</label>
	          <input type="text" name="" id="option1" class="form-control" placeholder="Enter option">
	        </div>
	        <div class="form-group">
	          <label> Option 2</label>
	          <input type="text" name="" id="option2" class="form-control" placeholder="Enter option">
	        </div>
	        <div class="form-group">
	          <label> Option 3</label>
	          <input type="text" name="" id="option3" class="form-control" placeholder="Enter option">
	        </div>
	        <div class="form-group">
	          <label> Option 4</label>
	          <input type="text" name="" id="option4" class="form-control" placeholder="Enter option">
	        </div>
	        <div class="form-group">
	          <label> Option 5</label>
	          <input type="text" name="" id="option5" class="form-control" placeholder="Enter option">
	        </div>
	      </div>

	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="addRecord()">Save
	        </button>
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
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
          url:"form_creation_back.php",
          type:"post",
          data: { readrecord:readrecord },
          success:function(data,status){
            $('#records_content').html(data);
          }
        });
      }

       function addRecord(){
        var question = $('#question').val();
        var option1 = $('#option1').val();
        var option2 = $('#option2').val();
        var option3 = $('#option3').val();
        var option4 = $('#option4').val();
        var option5 = $('#option5').val();

        $.ajax({
          url:"form_creation_back.php",
          type:"post",
          data: { question : question,
              option1 : option1,
              option2 : option2,
              option3 : option3,
              option4 : option4,
              option5 : option5,
           },

           success:function(data,status){
            readRecords();
           }

        });
      }

	</script>
</body>
</html>