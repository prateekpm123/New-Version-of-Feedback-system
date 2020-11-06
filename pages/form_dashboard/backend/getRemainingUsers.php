<?php
session_start();

if(isset($_POST['F_id'])) {
    include '../../../classes/model.class.php';
    $F_id = $_POST['F_id'];
    $view = new Model();
    $rows = $view->getRemainingUsers($F_id);
    $data = '<table class="table table-hover table-responsive table-borderless">
            <thead align="center">
            <tr>
                <th>No.</th>
                <th>Username</th>
            </tr>
            </thead>';
    if(!empty($rows)) {
        $number = 1;
        foreach ($rows as $row) {
            $data .= '<tr>
                        <td align="center">'.$number.'</td>
                        <td align="center">'.$row['user_email'].'</td>
                    </tr>';
            $number++;
        }
    }
    $data .= '</table>';
    echo $data;
}

if(isset($_POST['RF_id'])) {
    include '../../../classes/model.class.php';
    $F_id = $_POST['RF_id'];
    $view = new Model();
    $rows = $view->getRemainingUsers($F_id);
    if(!empty($rows)) {
        $data = array();
        foreach ($rows as $row) {
            array_push($data, $row['user_email']);
        }
    }
    $dataStr = implode(",", $data);
    echo $dataStr;
}


?>