<?php 

require "../backend/getFormDetails.php";


renderFormVersionData();

function renderFormVersionData() {

    $F_id = $_POST['F_id'];
    
    $formInfoObj = new FormInfo();
    $formVersionData = $formInfoObj->giveFormVersionToRender($F_id);


    $data = '<table class="table table-bordered table-striped">
				<tr>
					<th>No.</th>
					<th>Form Name</th>
					<th>Form Version</th>
					<th>Update Details</th>
					<th>Edit Form</th>
					<th>Delete Form</th>
				</tr>';

	if(!empty($formVersionData)){
		$number = 1;
		foreach($formVersionData as $row ){

			$data .= '<tr>
				<td>'.$number.'</td>
				<td contenteditable="true">'.$row['Form_name'].'</td>
				<td>'.$row['Form_version'].'</td>
				<td>
					<button onclick="GetFormDetails('.$row['F_id'].')"
					class="btn btn-info">Update</button>
				</td>
				<td>
					<button class="btn btn-warning">Edit</button>
				</td>
				<td>
					<button onclick="DeleteForm('.$row['F_id'].')" class="btn
						btn-danger">Delete</button>
				</td>
				</tr>';
				$number++;
		}
	}

	$data .= '</table>';
	echo $data;

}
