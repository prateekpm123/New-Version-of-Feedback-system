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
				<td contenteditable="true" onBlur="updateValue(this,1,'.$row['id'].')">'.$row['form_name'].'</td>
				<td contenteditable="true" onBlur="updateValue(this,2,'.$row['id'].')">'.$row['form_session'].'</td>
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

	// if(isset($_POST['id']) && isset($_POST['id']) != "")
	// 	{
	// 		$form_id = $_POST['id'];
	// 		include 'details.class.php';
	// 		$view1 = new View();
	// 		$result = $view1->getFormId($form_id);
			

	// 		echo json_encode($result);
	// 	}

	if(isset($_POST['id']) && isset($_POST['value']) && isset($_POST['column'])) {
		$id = $_POST['id'];
		$value = $_POST['value'];
		$column = $_POST['column'];
	include 'control.class.php';	
	if($column == 1){	
		$update = new Control();
		$update->updateFormName($value, $id);
	}
	else if($column == 2){
		$update1 = new Control();
		$update1->updateFormSession($value, $id);
	}	
	}
	



 ?>