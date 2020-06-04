<?php 

$con = mysqli_connect('localhost','root','','form_details');
extract($_POST);

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

// get userid for update
// if(isset($_POST['id']))
// {
// 	$formid = $_POST['id'];
// 	include 'views.class.php';
// 	$view1 = new View();
// 	$rows1 = $view1->getFormId($formid);

// 	$response = array();

// 	if(!empty($rows1)){
// 		$response = $rows1 ;
// 	}

// 	echo json_encode($response);
	


	//$response = array();

	//if(!empty($rows)) {

	// 	//foreach($rows as $row){
	//$response = $rows;
	//}
	// }
	// else
	// {
	// 	$response['status'] = 200;
	// 	$response['message'] = "Data not found!";
	// }

	
//}

if(isset($_POST['id']) && isset($_POST['id']) != "")
{
	$form_id = $_POST['id'];
	$query = "SELECT * FROM form_table WHERE id = '$form_id'";
	if (!$result = mysqli_query($con,$query)) {
		exit(mysqli_error());
	}

	$response = array();

	if(mysqli_num_rows($result) > 0) {
		while ($array = mysqli_fetch_assoc($result)) {
			$response = $array;
		}
	}
	else
	{
		$response['status'] = 200;
		$response['message'] = "Data not found!";
	}

	echo json_encode($response);
}
else
{
	$response['status'] = 200;
	$response['message'] = "Invalid Request!";
}
	// include 'view.class.php';
	// $view1 = new View();
	// $result = $view1->getFormId($form_id);


	 //$response = array();

	 //$response = $result;
	
		// while($row = $result){
		//  echo json_encode($row);
		// }
	

	// if(!empty($result)) {
	//  	 while ($row = $result){
	// 		$response = $row;
	//  	}
 // 	echo json_encode($response);
	//  }
	

	//echo json_encode($response);

// else
// {
// 	$response['status'] = 200;
// 	$response['message'] = "Invalid Request!";
// }




 ?>