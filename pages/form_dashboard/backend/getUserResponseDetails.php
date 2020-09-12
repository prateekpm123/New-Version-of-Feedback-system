<?php
  session_start();
  $F_id = $_POST['F_id'];
  $user_name = $_POST['User_name'];
  //$name = $_SESSION['Form_name'];
  $data = '<div class="card">
            <h4 class="card-header bg-primary text-white">'.$user_name.'</h4>
            <div class="card-body">
            <dl class="row">
                <dt class="col-3">Q_no.</dt>
                <dd class="col-9"><b>Answer</b></dd>
            </dl>';
  if(isset($_POST['F_id']) && isset($_POST['User_name'])){
  include '../../../classes/model.class.php';
  $view = new Model();
  $rows = $view->fetchUserNameResponse($F_id,$user_name);
  if(!empty($rows)){
		$number = 1;
		foreach($rows as $row ){
  $data .= '<dl class="row">
                <dt class="col-3">'.$number.'</dt>
                <dd class="col-9">'.$row['Answer_desc'].'</dd>
            </dl>';
            $number++;
    }
  }

    $data .= '</div>
          </div>';
  echo $data;
    
  
}
?>