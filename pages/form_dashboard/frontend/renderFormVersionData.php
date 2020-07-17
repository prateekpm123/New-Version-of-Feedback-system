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
					<th>Edit Form</th>
					<th>Delete Form</th>
					<th>Other options</th>

				</tr>';

	if(!empty($formVersionData)){
		$number = 1;
		foreach($formVersionData as $row ){

			$data .= '<tr>
				<td>'.$number.'</td>
				<td>'.$row['Form_name'].'</td>
				<td>'.$row['Form_version'].'</td>
				<td>
					<button class="btn btn-warning" onclick="sendFormDetails('.$row['F_id'].')">Edit</button>
				</td>
				<td>
					<button onclick="deleteFormVersion('.$row['F_id'].')" class="btn
						btn-danger">Delete</button>
				</td>
				<td>
                    <div class="dropdown">
                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Options
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <button class="dropdown-item"  >View</button>
                            <button class="dropdown-item"  >Delete</button>
                            <button class="dropdown-item" >Something else here</button>
                        </div>
                    </div>
                </td>
				</tr>';
				$number++;
		}
	} else {
		$data .= '<h4 style="color: red;"> Admin id is empty, so try creating a new form !</h4>';
	}

	$data .= '</table>';
	echo $data;

}
