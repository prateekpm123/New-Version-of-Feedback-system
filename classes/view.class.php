<?php

// ** @desc OF THIS FILE
// ** This takes the datafrom the model.class.php and gives it to display in the front end
// **

class View extends Model {

    // @param: formid  
    public function showQuestions() {
        $results = $this->getQuestionData();
        echo "Questions <br>";
        var_dump($results);

        // echo "<h2>" .$results[4]['Questions']."</h2><br><br>";

        // foreach ( $results as $result ) {
        //     echo $result['Questions'] .'<br>';
        // }
    }

}