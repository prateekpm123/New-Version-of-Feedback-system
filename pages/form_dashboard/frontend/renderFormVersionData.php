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

			$data .= '<div class="modal fade" id="publishModal'.$row['F_id'].'" data-backdrop="static" data-keyboard="false" 	  tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
										<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">Publish Details</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
										</div>
										<div class="modal-body">
										
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon1">Publish For</span>
												</div>
												<select class="form-control" aria-describedby="basic-addon1" id="">
														<option>Select Here</option>
														<option>Everyone</option>
														<option>Teacher</option>
														<option>Student</option>
												</select>		
											</div>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon2">Department</span>
												</div>
												<select class="form-control" aria-describedby="basic-addon2" id="">
														<option>Select Here</option>
														<option>All Departments</option>
														<option>CM</option>
														<option>IT</option>
														<option>EXTC</option>
														<option>ETRX</option>
												</select>		
											</div>
											<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon3">Year</span>
											</div>
											<select class="form-control" aria-describedby="basic-addon3" id="">
													<option>Select Here</option>
													<option>All years</option>
													<option>FE</option>
													<option>SE</option>
													<option>TE</option>
													<option>BE</option>
											</select>		
										</div>
										<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon3">Division</span>
										</div>
										<select class="form-control" aria-describedby="basic-addon3" id="">
												<option>Select Here</option>
												<option>All Divisions</option>
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>D</option>
										</select>		
									</div>
									<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon4">Duration</span>
									</div>
									<input class="form-control" aria-describedby="basic-addon4" type="date">		
								</div>
										</div>
										<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary">Publish</button>
										</div>
										</div>
								</div>
								</div>
			
			
			<tr>
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
<<<<<<< HEAD
					
					<button class="dropdown-item" type="button" class="btn btn-primary" data-toggle="modal" data-target="#publishModal" onclick="publishForm('.$row['F_id'].')">Publish</button>
					
					<button id="modal-button" type="button" class="dropdown-item" data-toggle="modal" data-target=".bd-example-modal-share-modal" onclick="shareModal('.$row['F_id'].')">Share</button>

=======
					<button class="dropdown-item" type="button" class="btn btn-primary" data-toggle="modal" data-target="#publishModal'.$row['F_id'].'" onclick="publishForm('.$row['F_id'].')">Publish</button>
>>>>>>> efffbb6b3de8783855e55666148d8ca733c46823
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
