<?php

require "../backend/getFormDetails.php";


session_start();
renderData($_SESSION['admin_username']);


function renderData($username) {
    $formInfoObj = new FormInfo();
    $formData = $formInfoObj->giveFormDataToRender($username);
    
    $data = '';

    if(!empty($formData)){
		$number = 1;
		foreach($formData as $row ){
            $Form_name = $row['Form_name'];
            $data .= '<div class="modal fade" id="formModal'.$row['F_id'].'" data-backdrop="false" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content">
                        <div class="modal-header">
                                <h5 class="modal-title" id="staticBackdropLabel">Form Details</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                        </div>
                        <div class="modal-body">
                        <form>
                            <div>
                            <label>Form Name:</label>
                            <input class="form-control" value="'.$Form_name.'" id="editFormName'.$row['F_id'].'" maxlength="50">
                            </div>
                            <br>
                            <div>
                            <label>Form Description:</label>
                            <textarea class="form-control" id="editFormDescription'.$row['F_id'].'" maxlength="150">'.$row['Form_Desc'].'</textarea>
                            </div>
                        </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button class="btn btn-primary" data-dismiss="modal" onClick="editFormDetails('.$row['F_id'].')">Save</button>
						</div>
                        </div>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="stopResponse'.$row['F_id'].'" data-keyword="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Confirm</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Do you want to stop taking responses for this form?</p>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-success" data-dismiss="modal" onclick="unPublishForm('.$row['F_id'].')">Yes</button>
                                    <button class="btn btn-danger" data-dismiss="modal">No</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="notPublished'.$row['F_id'].'" data-keyword="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="staticBackdropLabel">Confirm</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>This form has not been publised.</p>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-success" data-dismiss="modal">OK</button>
                                </div>
                            </div>
                        </div>
                    </div>
            
            
            
            
                    <div class="card" id="'.$row['F_id'].'">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-8">
                                    <h5>'.$number.'. '.$Form_name.'</h5>
                                </div>
                                <div class="col-4">
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-sm-6">
                                    <p class="card-text">'.$row['Form_Desc'].'</p>
                                    <button onclick="getFormVersions('.$row['F_id'].')" class="btn btn-sm btn-info">View</button>
                                    <button class="btn btn-sm btn-danger" onclick="deleteForms('.$row['F_id'].')" >Delete</button>
                                    <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#formModal'.$row['F_id'].'">Edit</button>
                                    <button class="btn btn-primary btn-sm" onclick="checkForPublish('.$row['F_id'].')">Stop Response</button>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-12" id="form_version_content'.$row['F_id'].'" ></div> 
                            </div>
                        </div>
                    </div><br>';
				$number++;
		}
    }
    $data .= '';
    echo $data;

}

// data-toggle="modal" data-target="#stopResponse'.$row['F_id'].'"