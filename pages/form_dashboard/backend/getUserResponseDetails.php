<?php
  session_start();
  $F_id = $_POST['F_id'];
  $user_name = $_POST['User_name'];
  //$name = $_SESSION['Form_name'];
  $data = '<div class="card">
            <h3 class="card-header bg-primary text-white">User Response</h3>
            <div class="card-body">';
  if(isset($_POST['F_id']) && isset($_POST['User_name'])){
  include '../../../classes/model.class.php';
  $view = new Model();
  $rows = $view->fetchUserNameResponse($F_id,$user_name);
  if(!empty($rows)){
		$number = 1;
		foreach($rows as $row ){
  $data .= '<dl class="row">
                <dt class="col-1">'.$number.'</dt>
                <dd class="col-8">'.$row['Answer_desc'].'</dd>
            </dl>';
            $number++;
    }
  }

    $data .= '</div>
          </div>';
  echo $data;
    
  
}
?>