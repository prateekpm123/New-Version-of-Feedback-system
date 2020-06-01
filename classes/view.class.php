<?php

// ** @desc OF THIS FILE
// ** This takes the datafrom the model.class.php and gives it to display in the front end
// **

include "Model.class.php";

class View extends Model {

    // @param: formid  
    public function showAdminData() {
        $results = $this->fetchAdminData();
        return $results;
    }


}


?>