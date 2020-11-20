<?php

if(isset($_POST['F_id'])) {
    $F_id = $_POST['F_id'];
    include '../../../classes/model.class.php';
    $model = new Model();
    $data = $model->checkForPublish($F_id);
    echo $data;
}

if(isset($_POST['publish_F_id'])) {
    $F_id = $_POST['publish_F_id'];
    include '../../../classes/model.class.php';
    $model = new Model();
    $data = $model->unPublishForm($F_id);
}

?>