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
				<button style="border-style: none; background-color: transparent;"><i class="material-icons">
				settings
				</i></button>
				<!-- Example single danger button -->
				<div class="btn-group">
				<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Action
				</button>
				<div class="dropdown-menu">
					<button class="dropdown-item" onclick="createVersion('.$row['F_id'].')">Create Version</button>
					
					<button class="dropdown-item" type="button" class="btn btn-primary" data-toggle="modal" data-target="#publishModal" onclick="publishForm('.$row['F_id'].')">Publish</button>
					
					<button id="modal-button" type="button" class="dropdown-item" data-toggle="modal" data-target=".bd-example-modal-share-modal" onclick="shareModal('.$row['F_id'].')">Share</button>

					<button class="dropdown-item" onclick="otherSettings('.$row['F_id'].')">Other settings</button>
					<div class="dropdown-divider"></div>
					<button class="dropdown-item disabled" >Separated link</button>
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
