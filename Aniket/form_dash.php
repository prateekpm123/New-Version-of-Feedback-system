<!DOCTYPE html>
<html>
<head>
  <title></title>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  
</head>
<body>

<div class="container">
  <h1 class="text-primary text-center">ADMIN DASHBOARD</h1>

  <div class="d-flex justify-content-end">
    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#myModal">Create Form
    </button>
  </div>

  <h2 class="text-danger">Forms </h2>
  <div id="records_content">
    
  </div>

  <!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Form Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="form-group">
          <label> Form Title</label>
          <input type="text" name="" id="formname" class="form-control" placeholder="Enter Form Name">
        </div>
        <div class="form-group">
          <label> Session</label>
          <input type="text" name="" id="formsession" class="form-control" placeholder="Enter Session">
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

<!-- update model -->
<div class="modal" id="update_form_modal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Form Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="form-group">
          <label> Form Title</label>
          <input type="text" name="" id="update_formname" class="form-control" placeholder="Enter Form Name">
        </div>
        <div class="form-group">
          <label> Session</label>
          <input type="text" name="" id="update_formsession" class="form-control" placeholder="Enter Session">
        </div>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="updateformdetail()">Save
        </button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <input type="hidden" name="" id="hidden_form_id">
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
          }
        });
      }






      function addRecord(){
        var formname = $('#formname').val();
        var formsession = $('#formsession').val();

        $.ajax({
          url:"send_data.php",
          type:"post",
          data: { formname : formname,
              formsession : formsession
           },

           success:function(data,status){
            readRecords();
           }

        });
      }

      function DeleteForm(deleteid){
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

      function GetFormDetails(id){
        $('#hidden_form_id').val(id);

        $.post("load_data.php", {
          id:id
        }, function(data,status){
          var form = JSON.parse(data);
          $('#update_formname').val(form.form_name);
          $('#update_formsession').val(form.form_session);
          //console.log(data);
        }
        );

        $('#update_form_modal').modal("show");
      }

      function updateformdetail(){
        var formnameupdate = $('#update_formname').val();
        var formsessionupdate = $('#update_formsession').val();

        var hidden_form_id_update = $('#hidden_form_id').val();

        $.post("send_data.php",{

          hidden_form_id_update:hidden_form_id_update,
          formnameupdate:formnameupdate,
          formsessionupdate:formsessionupdate
        },
        function(data,status){
          $('#update_form_modal').modal("hide");
          readRecords();
        }
          

          );
        }
        
      
    </script>
</body>
</html>