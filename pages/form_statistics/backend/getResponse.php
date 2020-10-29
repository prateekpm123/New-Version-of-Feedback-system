<?php
    session_start();

    if(isset($_POST['Q_id'])){
        $Q_id = $_POST['Q_id'];
        include '../../../classes/model.class.php';
        $getResponseData = new Model();
        $data = $getResponseData->getResponseData($Q_id);
        $list = implode(',', $data);
        echo $list;
    }

    if(isset($_POST['MQ_id'])){
        $Q_id = $_POST['MQ_id'];
        include '../../../classes/model.class.php';
        $getResponseData = new Model();
        $data = $getResponseData->getResponseDataForMulti($Q_id);
        $list = implode(',', $data);
        echo $list;
    }

    if(isset($_POST['rating_Q_id'])){
        $Q_id = $_POST['rating_Q_id'];
        include '../../../classes/model.class.php';
        $getResponseData = new Model();
        $data = $getResponseData->getResponseDataForRating($Q_id);
        $list = implode(',', $data);
        echo $list;
    }
?>