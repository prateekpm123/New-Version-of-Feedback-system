<?php 

require "../backend/getFormDetails.php";


renderFormVersionData();

function renderFormVersionData() {

    $F_id = $_POST['F_id'];
    
    $formInfoObj = new FormInfo();
    $formVersionData = $formInfoObj->giveFormVersionToRender($F_id);


		$data = '<table class="table table-borderless table-hover table-responsive version">
				<tr align="center">
					<th>Versions</th>
					<th>Edit</th>
					<th>Publish</th>
					<th>Share</th>
					<th>Create</th>
					<th>Statistics</th>
					<th>Response</th>
				</tr>';

	if(!empty($formVersionData)){
		$number = 1;
		foreach($formVersionData as $row ){

			$data .= '<div class="modal fade" id="publishModal'.$row['F_id'].'" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
												<select class="form-control publishClass1" aria-describedby="basic-addon1" onchange="publishChange('.$row['F_id'].')">
														
														<option selected hidden>'.$row['Role'].'</option>
														<option>Everyone</option>
														<option>Teacher</option>
														<option>Student</option>
												</select>		
											</div>
											<div class="publishDiv1">
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon2">Department</span>
												</div>
												<select class="form-control publishClass2" aria-describedby="basic-addon2" onchange="publishChange1('.$row['F_id'].')">
														<option selected hidden>'.$row['Department'].'</option>
														<option>All Departments</option>
														<option>CM</option>
														<option>IT</option>
														<option>EXTC</option>
														<option>ETRX</option>
												</select>		
											</div>
											</div>
											<div class="publishDiv2">
											<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text" id="basic-addon3">Year</span>
											</div>
											<select class="form-control publishClass3" aria-describedby="basic-addon3" onchange="publishChange2('.$row['F_id'].')">
													<option selected hidden>'.$row['Year'].'</option>
													<option>All years</option>
													<option>FE</option>
													<option>SE</option>
													<option>TE</option>
													<option>BE</option>
											</select>		
										</div>
										</div>
										<div class="publishDiv3">
										<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon3">Division</span>
										</div>
										<select class="form-control publishClass4" aria-describedby="basic-addon3">
												<option selected hidden>'.$row['Division'].'</option>
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
									</div>
										</div>
										<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
												<button class="btn btn-primary" onclick="publishForm('.$row['F_id'].')" data-dismiss="modal">Publish</button>
										</div>
										</div>
								</div>
								</div>
			
			<tr id="tableRow'.$row['F_id'].'" class="version-row published'.$row['Published'].'">
				<td align="center"><b>'.$row['Form_version'].'</b></th>
				<td align="center">
					<a onclick="sendFormDetails('.$row['F_id'].')"><span class="material-icons">create</span></a>
				</td>
				<td align="center">
					<a data-toggle="modal" data-target="#publishModal'.$row['F_id'].'"><span class="material-icons">event_note</span></a>
				</td>
				<td align="center">
					<a onclick="shareDetails('.$row['F_id'].')"><span class="material-icons">share</span></a>
				</td>
				<td align="center">
					<a onclick="createVersion('.$row['F_id'].')"><span class="material-icons">add_circle_outline</span></a>
				</td>
				<td align="center">
					<a onClick="goToStatsPage('.$row['F_id'].')"><span class="material-icons">bar_chart</span></a>
				</td>
				<td align="center">
					<a onclick="getUserNames('.$row['F_id'].')"><span class="material-icons">open_in_new</span></a>
				</td>
				</tr>';
		}
	} else {
		$data .= '<h4 style="color: red;"> Admin id is empty, so try creating a new form !</h4>';
	}

	$data .= '</table>';

	echo $data;

	
}

?>
