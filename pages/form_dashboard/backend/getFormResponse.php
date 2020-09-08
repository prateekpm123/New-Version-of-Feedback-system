<?php
  session_start();
  $F_id = $_POST['F_id'];
  if(isset($_POST['F_id'])){
  include '../../../classes/model.class.php';
  $view = new Model();
  $count = $view->fetchUserResponseDetails($F_id);
  $data = '<div class="card">
              <h3 class="card-header bg-primary text-white">Form Statistics</h3>
              <div class="card-body">
                <dl class="row">
                  <dt class="col-6">Total Response</dt>
                  <dd class="col-6">'.$count.'</dd>
                </dl>
              </div>
            </div>';
  echo $data;

  }
?>