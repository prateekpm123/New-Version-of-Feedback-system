<?php 

require "../backend/getFormDetails.php";


renderFormVersionData();

function renderFormVersionData() {

    $F_id = $_POST['F_id'];
    
    $formInfoObj = new FormInfo();
    $formVersionData = $formInfoObj->giveFormVersionToRender($F_id);


		$data = '<table class="table table-borderless table-hover version">
		<thead>
				<tr align="center">
					<th>Versions</th>
					<th>Edit</th>
					<th>Options</th>
		</thead>
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
									<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon4">Start Date (YYYY-MM-DD)</span>
									</div>
									<input class="form-control publishClass5" aria-describedby="basic-addon4" type="text" value="'.$row['Start_date'].'">		
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="basic-addon4">End Date (YYYY-MM-DD)</span>
									</div>
									<input class="form-control publishClass6" aria-describedby="basic-addon4" type="text" value="'.$row['End_date'].'">		
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
				<td align="center" style="width: 10%;"><b>'.$row['Form_version'].'</b></th>
				<td align="center" style="width: 15%;">
					<button class="btn btn-sm btn-warning" onclick="sendFormDetails('.$row['F_id'].')">Edit</button>
				</td>
				<td align="center" style="width: 15%;">
					<div class="btn-group">
						<button type="button" class="btn btn-sm btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Action
						</button>
						<div class="dropdown-menu">
							<button class="dropdown-item" onclick="createVersion('.$row['F_id'].')">Create Version</button>
							<button class="dropdown-item" type="button" data-toggle="modal" 
							data-target="#publishModal'.$row['F_id'].'">Publish</button>
							<button class="dropdown-item" type="button" onclick="shareDetails('.$row['F_id'].')">Share</button>
						</div>
					</div>
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
