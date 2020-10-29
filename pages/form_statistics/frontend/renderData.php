<?php
session_start();
$F_id = $_SESSION['F_id'];

include '../../../classes/model.class.php';

renderData($F_id);

function renderData($F_id) {
    $getAllQuestions = new Model();
    $response = $getAllQuestions->getFormQuestionData($F_id);

    $data = '';

    if(!empty($response)) {
        $number = 1;
        foreach($response as $row ) {
            if($row['type'] == 'radio') {
                $data .= '<div class="card stats" id="'.$row['Q_id'].'">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>No. </strong></div><div style="display: inline;">'.$number.'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Type: </strong></div><div style="display: inline;" class="type">'.$row['type'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Question: </strong></div><div style="display: inline;">'.$row['Question_desc'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="outeroption"><label><strong>1:</strong></label><div class="option" style="display: inline;"> '.$row['Option1'].'</div></div>
                                        <div class="outeroption"><label><strong>2:</strong></label><div class="option" style="display: inline;"> '.$row['Option2'].'</div></div>
                                        <div class="outeroption"><label><strong>3:</strong></label><div class="option" style="display: inline;"> '.$row['Option3'].'</div></div>
                                        <div class="outeroption"><label><strong>4:</strong></label><div class="option" style="display: inline;"> '.$row['Option4'].'</div></div>
                                        <div class="outeroption"><label><strong>5:</strong></label><div class="option" style="display: inline;"> '.$row['Option5'].'</div></div>
                                    </div>
                                </div><br>  
                                <div class="row">
                                    <div class="col-12 col-sm-6" id="piechart'.$row['Q_id'].'"></div>
                                    <div class="col-12 col-sm-6" id="columnchart'.$row['Q_id'].'"></div>
                                </div>       
                            </div>
                    </div><br>';
            $number++;
            }
            else if ($row['type'] == 'multiplechoice') {
                $data .= '<div class="card stats" id="'.$row['Q_id'].'">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>No. </strong></div><div style="display: inline;">'.$number.'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Type: </strong></div><div style="display: inline;" class="type">'.$row['type'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Question: </strong></div><div style="display: inline;">'.$row['Question_desc'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                    <div class="outeroption"><label><strong>1:</strong></label><div class="option" style="display: inline;"> '.$row['Option1'].'</div></div>
                                    <div class="outeroption"><label><strong>2:</strong></label><div class="option" style="display: inline;"> '.$row['Option2'].'</div></div>
                                    <div class="outeroption"><label><strong>3:</strong></label><div class="option" style="display: inline;"> '.$row['Option3'].'</div></div>
                                    <div class="outeroption"><label><strong>4:</strong></label><div class="option" style="display: inline;"> '.$row['Option4'].'</div></div>
                                    <div class="outeroption"><label><strong>5:</strong></label><div class="option" style="display: inline;"> '.$row['Option5'].'</div></div>
                                    </div>
                                </div><br>  
                                <div class="row">
                                    <div class="col-12 col-sm-3"></div>
                                    <div class="col-12 col-sm-6" id="columnchart'.$row['Q_id'].'"></div>
                                    <div class="col-12 col-sm-3"></div>
                                </div>       
                            </div>
                    </div><br>';
            $number++;
            }
            else if ($row['type'] == 'linearscale') {
                $data .= '<div class="card stats" id="'.$row['Q_id'].'">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>No. </strong></div><div style="display: inline;">'.$number.'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Type: </strong></div><div style="display: inline;" class="type">'.$row['type'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Question: </strong></div><div style="display: inline;">'.$row['Question_desc'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                    <div class="outeroption"><label><strong>1:</strong></label><div class="option" style="display: inline;"> '.$row['Option1'].'</div></div>
                                    <div class="outeroption"><label><strong>2:</strong></label><div class="option" style="display: inline;"> '.$row['Option2'].'</div></div>
                                    <div class="outeroption"><label><strong>3:</strong></label><div class="option" style="display: inline;"> '.$row['Option3'].'</div></div>
                                    <div class="outeroption"><label><strong>4:</strong></label><div class="option" style="display: inline;"> '.$row['Option4'].'</div></div>
                                    <div class="outeroption"><label><strong>5:</strong></label><div class="option" style="display: inline;"> '.$row['Option5'].'</div></div>
                                    </div>
                                </div><br>  
                                <div class="row">
                                    <div class="col-12 col-sm-6" id="piechart'.$row['Q_id'].'"></div>
                                    <div class="col-12 col-sm-6" id="columnchart'.$row['Q_id'].'"></div>
                                </div>       
                            </div>
                        </div><br>';
            $number++;
            }
            else if ($row['type'] == 'rating') {
                $data .= '<div class="card stats" id="'.$row['Q_id'].'">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>No. </strong></div><div style="display: inline;">'.$number.'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Type: </strong></div><div style="display: inline;" class="type">'.$row['type'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Question: </strong></div><div style="display: inline;">'.$row['Question_desc'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12 col-sm-6" id="piechart'.$row['Q_id'].'"></div>
                                    <div class="col-12 col-sm-6" id="columnchart'.$row['Q_id'].'"></div>
                                </div>       
                            </div>
                        </div><br>';
            $number++;
            }
            else {
                $data .= '<div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>No. </strong></div><div style="display: inline;">'.$number.'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Type: </strong></div><div style="display: inline;" class="type">'.$row['type'].'</div>
                                    </div>
                                </div><br>
                                <div class="row">
                                    <div class="col-12">
                                        <div style="display: inline;"><strong>Question: </strong></div><div style="display: inline;">'.$row['Question_desc'].'</div>
                                    </div>
                                </div>
                            </div>
                        </div>';
            $number++;
            }
        }
    }
    else {
        echo "<h2>Something went Wrong!!</h2>";
    }
    $data .= '';
    echo $data;
}
?>