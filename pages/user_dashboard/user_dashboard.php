<html>
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>User Dashboard</title>

  </head>

<body>
  <div class="container" id="records_content">
    
  </div>




<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
  function readRecords() {
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
</script>
</body>
</html>