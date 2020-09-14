<?php
session_start();
$admin_email = $_SESSION['admin_username'];
if(isset($_POST['read'])){
  $data = '<table class="table table-borderless table-hover table-striped">
            <thead class="thead-dark">
                <tr align="center">
                    <th>No.</th>
                    <th>Form Name</th>
                    <th>Version</th>
                    <th>Edit</th>
                </tr>
            </thead>';
  include '../../../classes/model.class.php';
  $view = new Model();
  $rows = $view->fetchSharedRecords($admin_email);
  if(!empty($rows)){
  $number = 1;
  foreach($rows as $row ) {
    $data .= '<tr>
                <td align="center" style="width: 10%"><b>'.$number.'</b></td>
                <td align="center" style="width: 60%">'.$row['Form_name'].'</td>
                <td align="center" style="width: 15%">'.$row['Form_version'].'</td>
                <td align="center" style="width: 15%">
                  <button class="btn btn-sm btn-danger" onclick="sendFormDetails('.$row['F_id'].')">Edit</button>        
                </td>         
              </tr>';
                $number++;
  }
  $data .= '</table><br>';
  echo $data;
}
else{
  echo "No Form Shared With You";
}
}

?>