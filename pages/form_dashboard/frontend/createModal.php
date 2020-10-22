<?php

$data = '<div class="modal fade bd-example-modal-test" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Form Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <input type="text" class="form-control" id="form-name" placeholder="Form Name (Max 50 Characters)" maxlength="50">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" id="form-description" placeholder="Write the Form Description here... (Max 150 Characters)" maxlength="150"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="close-modal" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="insertNewForm()">Save</button>
                    </div>
                </div>
            </div>
        </div>';

echo $data;

// <label for="recipient-name" class="col-form-label">Recipient:</label>
