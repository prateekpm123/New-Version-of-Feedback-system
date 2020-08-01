


<!-- require "../backend/getFormDetails.php";


//renderPublishModal();

//function renderPublishModal() {

 //   $F_id = $_POST['F_id'];
    
  //  $formInfoObj = new FormInfo();
 //   $formVersionData = $formInfoObj->giveFormVersionToRender($F_id);

    $data = '';
//	if(!empty($formVersionData)){
		$number = 1;
//		foreach($formVersionData as $row ){

			$data .= '<div class="modal fade" id="publishModal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
										<div class="modal-header">
												<h5 class="modal-title" id="staticBackdropLabel">Publish Details</h5>
												<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
												</button>
										</div>
                                        <div class="modal-body">
                                            <p>'.$F_id.'</p>
											<div class="input-group mb-3">
												<div class="input-group-prepend">
													<span class="input-group-text" id="basic-addon1">Role</span>
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
								</div>';
			
			
			
				$number++;
//		}
//	} else {
		$data .= '<h4 style="color: red;"> Admin id is empty, so try creating a new form !</h4>';
//	}

	
	echo $data;

//} -->
