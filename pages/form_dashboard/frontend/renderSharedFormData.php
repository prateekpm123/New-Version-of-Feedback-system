<?php
session_start();
$admin_email = $_SESSION['admin_username'];
if(isset($_POST['read'])){
  $data = '';
  include '../../../classes/model.class.php';
  $view = new Model();
  $rows = $view->fetchSharedRecords($admin_email);
  if(!empty($rows)){
  $number = 1;
  foreach($rows as $row ) {
    $data .= '<div class="card">
                <h5 class="card-header">'.$number.'. '.$row['Form_name'].'</h5>
                <div class="card-body">
                  <div class="row">
                    <div class="col-12 col-md-6">
                      <p class="card-text">'.$row['Form_Desc'].'</p>
                      <button class="btn btn-sm btn-warning" onclick="sendFormDetails('.$row['F_id'].')">Edit</button>
                    </div>
                    <div class="col-12 col-md-6"> 
                            <h6>Form Version: '.$row['Form_version'].'</h6>
                            <h6>Admin: '.$row['Admin_email'].'</h6>  
                    </div>
                  </div>  
                </div>
            </div><br>';
                $number++;
  }
  $data .= '';
  echo $data;
}
else{
  echo "No Form Shared With You";
}
}

?>
