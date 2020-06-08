<?php 


extract($_POST);
//include 'view.class.php';
//include 'details.class.php';

	if(isset($_POST['readrecord'])){

	$data = '<table class="table table-bordered table-striped">
				<tr>
					<th>No.</th>
					<th>Form Name</th>
					<th>Form Session</th>
					<th>Update Details</th>
					<th>Edit Form</th>
					<th>Delete Form</th>
				</tr>';

	include 'view.class.php';
	$view = new View();
	$rows = $view->fetchRecords();
	if(!empty($rows)){
		$number = 1;
		foreach($rows as $row ){

			$data .= '<tr>
				<td>'.$number.'</td>
				<td>'.$row['form_name'].'</td>
				<td>'.$row['form_session'].'</td>
				<td>
					<button onclick="GetFormDetails('.$row['id'].')"
					class="btn btn-info">Update</button>
				</td>
				<td>
					<button class="btn btn-warning">Edit</button>
				</td>
				<td>
					<button onclick="DeleteForm('.$row['id'].')" class="btn
						btn-danger">Delete</button>
				</td>
				</tr>';
				$number++;
		}
	}

	$data .= '</table>';
	echo $data;

}

	if(isset($_POST['id']) && isset($_POST['id']) != "")
		{
			$form_id = $_POST['id'];
			include 'details.class.php';
			$view1 = new View();
			$result = $view1->getFormId($form_id);
			

			echo json_encode($result);
		}





 ?>