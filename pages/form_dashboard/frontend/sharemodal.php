<?php

$F_id = $_POST['F_id'];

printShareModal($F_id);

function printShareModal($F_id) {
    $data2 = '<div class="modal fade bd-example-modal-share-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">New message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>'.$F_id.'</p>
                        </div>
                        <div class="modal-footer">
                            <button id="close-modal" type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save</button>
                        </div>
                    </div>
                </div>
            </div>';

    echo $data2;
}