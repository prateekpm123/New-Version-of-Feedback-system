<?php

// require "../backend/getFormDetails.php";


session_start();
renderData($_SESSION['admin_username']);


function renderData($username) {
    // $formInfoObj = new FormInfo();
    // $formData = $formInfoObj->giveFormDataToRender($username);
    $F_id = $_SESSION['F_id'];
    $admin_email = $_SESSION['Admin_email'];
    include '../../classes/model.class.php';
    $view = new Model();
    $formData = $view->fetchShareDetails($F_id,$admin_email);
    
    $data = '<table class="table table-borderless table-hover table-responsive table-striped">
                    <thead class="thead-dark">
                        <tr align="center">
                            <th>No.</th>
                            <th>Admin Email</th>
                            <th>Delete</th>
                        </tr>
                    </thead>';

    if(!empty($formData)){
		$number = 1;
		foreach($formData as $row ){
            // $Form_name = $row['F_id'];
			$data .= '<tr>
				<td align="center" style="width: 10%"><b>'.$number.'</b></td>
				<td align="center" style="width: 60%" >'.$row['shared_with'].'</td>
				<td align="center" style="width: 60%" ><button onclick="deleteSharedForms('.$row['id'].')" class="btn btn-danger">Delete</button></td>
                
				</tr>';
				$number++;
		}
    }
    else {
        echo "<h2>You haven't shared forms with anyone</h2>";
    }
    $data .= '</table>';
    echo $data;

}