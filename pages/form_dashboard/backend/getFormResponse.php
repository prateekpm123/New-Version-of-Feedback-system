<?php
  session_start();
  $F_id = $_POST['F_id'];
  //$name = $_SESSION['Form_name'];
  if(isset($_POST['F_id'])){
  include '../../../classes/model.class.php';
  $view = new Model();
  $count = $view->fetchUserResponseDetails($F_id);
  $data = '<div class="card">
              <div class="card-body">
                <dl class="row">
                  <dt class="col-5">Total Response</dt>
                  <dd class="col-3">'.$count.'</dd>
                  <dd class="col-4"><button class="btn btn-sm btn-success" onclick="getUserNames('.$F_id.')">More Details</button></dd>
                </dl>
              </div>
            </div>';
  echo $data;

  }
?>