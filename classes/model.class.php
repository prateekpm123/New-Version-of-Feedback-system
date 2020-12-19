<?php

/** @desc OF THIS FILE
 *  @param this class is the model, and its task is to interact with the database
**/
include 'Dbh.class.php';

class Model extends Dbh {

    protected $counter = 2;

    // Gives the latest version number for a Form name
    protected function getVersionNumber(string $formName) {
        return null;
    }

    // generate a form code for a Form name
    protected function generateFormCode() {
        $query = "SELECT * FROM form";

        try {
            $stmt = $this->connect()->prepare($query);
            $stmt->execute();
            $forms = $stmt->FetchAll();
            // return $forms ?? false;
            $rowCount = $stmt->rowCount();
            $rowCount = $rowCount + 1;
            $rowCount = (string)$rowCount;  
            return $rowCount;
        } 
        catch(Exception $e ) {
            echo "Fetching Forms data was not successfull ".$e->message();
        }
    }

    protected function fetchAdminData() {

        $sql = "SELECT * FROM user WHERE `DELETED`=0 ";

        try {
            $stmt = $this->connect()->prepare($sql);
            $stmt->execute();

            $results = $stmt->FetchAll();
            return $results ?? false;
        }
        catch(Exception $e) {
            echo "Database action was not successfull ".$e->message();
        }
        
    }

    protected function validateAdminLogin(string $admin_email, string $password) {
        $sql = "SELECT * FROM admin_credentials WHERE Admin_email =? AND Admin_Password=? AND `DELETED`=0 ";

        try {
            $stmt = $this->connect()->prepare($sql);
            $stmt->execute([$admin_email, $password]);

            $results = $stmt->FetchAll();
            $rowCount = $stmt->rowCount();

            if($rowCount > 1) {
                $ans = [$rowCount, $results];
                return null;
            }
            else if($rowCount = 0) {
                return null;
            }
            else if($rowCount = 1 ) {
                return $results ?? null;
            }
        }
        catch(Exception $e) {
            echo "Database action was not successfull".$e->message();
        }
        
    }

    protected function fetchForms($access_reciever) {
        $query = "SELECT * FROM form WHERE `F_id` IN (SELECT F_id from form_allotment WHERE `access_receiver`= ? ORDER BY `F_id` ASC) AND `Form_version`=1 AND `DELETED`=0";

        try {
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([$access_reciever]);
            $forms = $stmt->FetchAll();
            return $forms ?? false;
        } 
        catch(Exception $e ) {
            echo "Fetching Forms data was not successfull ".$e->message();
        }
        
    }

    public function fetchFormVersions($F_id) {
        session_start();
        // $query = "SELECT * FROM `form` WHERE `F_id`= ? AND `DELETED`=0 AND `Admin_id`= ?";

        // try{
        //     $stmt = $this->connect()->prepare($query);
        //     $stmt->execute([$F_id, $_SESSION['admin_id'] ]);
        //     $formIdName = $stmt->FetchAll();
        // }
        // catch(Exception $e) {
        //     echo "Fetching Forms Version Data was not successfull ".$e->message();
        // }
        
        try{
            // $Form_name = $formIdName[0]['Form_name'];
            // $query2 = "SELECT * FROM `form` WHERE `Form_name`= ? AND `Admin_id`=? AND  `DELETED`=0 ";
            $query2 = "SELECT * FROM form INNER JOIN publish_details ON form.F_id=publish_details.F_id WHERE form.Form_code in ( SELECT Form_code FROM form WHERE F_id=?  AND `Admin_email`=? AND  `DELETED`=0)";
    
            $stmt = $this->connect()->prepare($query2);
            $stmt->execute([$F_id, $_SESSION['admin_username']]);
            $formVersionsData = $stmt->FetchAll();
            //var_dump($formVersionsData);
            return $formVersionsData ?? false;
        }
        catch(Exception $e) {
            return "Fetching Forms Version Data was not successfull ".$e->message();
        }
    }

    
    // Insert forms based on who is logged in
    protected function insetNewForm(string $formName, string $formDesc) {
        session_start();
        
        $query =  "INSERT INTO `form`(`Admin_id`,`Admin_email`, `Form_name`, `Form_version`,`Form_Desc`, `DELETED`) VALUES (?,?,?, 1, ? ,0)";
        try {
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([ $_SESSION['admin_id'], $_SESSION['admin_username'], $formName, $formDesc]);


            $query2 = "SELECT `F_id` FROM form WHERE `Admin_id`= ? ORDER by F_id DESC LIMIT 1";
            $stmt2 = $this->connect()->prepare($query2);
            $stmt2->execute([$_SESSION['admin_id']]);
            $newInsertedF_id = $stmt2->fetchAll();

            $thisF_id = $newInsertedF_id['0']['F_id'];

            echo $thisF_id;
            // ADDING THE DATA INTO THE ACCESS TABLE
            $this->addTheEntryOfTheNewFormInAccessTable($thisF_id);
            // return true;

            $query8 = "INSERT INTO `publish_details`(`F_id`) VALUES (?)";
            $stmt8 = $this->connect()->prepare($query8);
            $stmt8->execute([$thisF_id]);

            $query1 = "UPDATE form SET Form_code = $thisF_id WHERE F_id = $thisF_id";
            $result = $this->connect()->prepare($query1);
            $result->execute([$thisF_id, $thisF_id]);
        } 
        catch(Exception $e ) {
            echo "Fetching Forms data was not successfull ".$e->message();
            return false;
        }
       

    }

    // Inserting into the access table !!
    private function addTheEntryOfTheNewFormInAccessTable($newInsertedF_id) {
        $admin_username = $_SESSION['admin_username'];
        $admin_id = $_SESSION['admin_id'];
        try{
            $query2 = "INSERT INTO `form_allotment`(`F_id`, `Admin_id`,`Admin_email`, `access_giver`, `access_receiver`, `priviliges`, `DELETED`) VALUES (?, ?, ?, ? , ?, 'master', 0)";
            $stmt = $this->connect()->prepare($query2);
            $stmt->execute([$newInsertedF_id, $admin_id, $admin_username, $admin_username, $admin_username]);
            return true;
        } 
        catch(Exception $e) {
            return "Inserting into the access table failed".$e->message();
        }
        

    }

    protected function deleteForm($F_id) {
        try {
            session_start();
            $query = "UPDATE `form` SET DELETED=1 WHERE Form_code IN (SELECT Form_code FROM form WHERE F_id= ?) AND Admin_email= ?";
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([$F_id, $_SESSION['admin_username']]);
            return true;
        }
        catch(Exception $e) {
            return "Error in deleting the form due to :".$e->message();
        }
    }

    public function updateFormNameAndDescription($F_id, $FormName, $FormDescription) {
        try {
            session_start();
            $admin_email = $_SESSION['admin_username'];
            $query = "UPDATE `form` SET `Form_name`=?, `Form_Desc`=? WHERE Form_code IN (SELECT Form_code FROM form WHERE F_id= ?) AND Admin_email= ?";
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([$FormName, $FormDescription, $F_id, $admin_email ]);
            return "Update successfull";
        }
        catch(Exception $e) { 
            return "Error in updating the form due to :".$e->message();
        }
    }

    public function getFormQuestionData($F_id) {
        $query = "SELECT * FROM `questions` WHERE `F_id`=$F_id AND `DELETED`=0";
        try {
            $stmt = $this->connect()->prepare($query);
            $stmt->execute();
            $formData = $stmt->FetchAll();
            return $formData;
        } 
        catch(Exception $e ) {
            echo "Fetching Forms data was not successfull ".$e->message();
            return null;
        }
    }

    public function createNewFormVersions($F_id) {
        // session_start();
        $this->counter++;
        $query = "SELECT * FROM `form` WHERE `F_id`=$F_id ";
        $stmt = $this->connect()->prepare($query);
        $stmt->execute();
        $formData = $stmt->FetchAll();
        

        $query2 = "SELECT * FROM `form` WHERE `Form_name`=? AND `Admin_email`=? ";
        $stmt2 = $this->connect()->prepare($query2);
        $stmt2->execute([$formData[0]["Form_name"], $formData[0]["Admin_email"]]);
        $formData2 = $stmt2->FetchAll();
        $noOfFormVersions = $stmt2->rowCount();
        $noOfFormVersions++;


        $query3 = "INSERT INTO `form`(`Admin_id`, `Admin_email`, `Form_name`, `Form_version`, `Form_Desc`, `DELETED`) VALUES (?, ?, ? , ?, ?, ?)";
        $stmt3 = $this->connect()->prepare($query3);
        $stmt3->execute([ $formData[0]["Admin_id"], $formData[0]["Admin_email"], $formData[0]["Form_name"], $noOfFormVersions,$formData[0]["Form_Desc"], 0] );

        
        $query4 = "SELECT * FROM `form` WHERE `Form_name`=? AND `Admin_email`=? AND `Form_version`=? AND`DELETED`=0";
        $stmt4 = $this->connect()->prepare($query4);
        $stmt4->execute([ $formData[0]["Form_name"],  $formData[0]["Admin_email"], $noOfFormVersions] );
        $formDataOfCurrentVersion = $stmt4->FetchAll();        
        $latestFormVersionId = $formDataOfCurrentVersion[0]["F_id"];
        $previousFormVersionId = $F_id;

        $query8 = "INSERT INTO publish_details(`F_id`) VALUES (?)";
        $stmt8 = $this->connect()->prepare($query8);
        $stmt8->execute([$latestFormVersionId]);
       
        
        $query6 = "SELECT * FROM `questions` WHERE `F_id`=?";
        $stmt6 = $this->connect()->prepare($query6);
        $stmt6->execute([ $previousFormVersionId ] );
        $previousFormVersionData = $stmt6->FetchAll();  
        //echo $previousFormVersionId;
        //echo var_dump($previousFormVersionData);

        $questionCounter = 1;
        $arrayStart = 0;
        foreach($previousFormVersionData as $row) {
            $query7 = "INSERT INTO `questions` (`F_id`, `Breakpoints`, `rating_scale`, `type`, `Question_desc`, `Option1`, `Option2`, `Option3`, `Option4`, `Option5`, `Default_Option`, `DELETED`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt7 = $this->connect()->prepare($query7);
            $stmt7->execute([$latestFormVersionId, $previousFormVersionData[$arrayStart]["Breakpoints"], $previousFormVersionData[$arrayStart]["rating_scale"] , $previousFormVersionData[$arrayStart]["type"] , $previousFormVersionData[$arrayStart]["Question_desc"], $previousFormVersionData[$arrayStart]["Option1"], $previousFormVersionData[$arrayStart]["Option2"], $previousFormVersionData[$arrayStart]["Option3"], $previousFormVersionData[$arrayStart]["Option4"], $previousFormVersionData[$arrayStart]["Option5"],  $previousFormVersionData[$arrayStart]["Default_Option"],  $previousFormVersionData[$arrayStart]["DELETED"]]);
            $arrayStart++;
            $questionCounter++;
        }

        $query9 = "SELECT * FROM `form` WHERE `Form_name`=? AND `Form_version` = 1 AND `Admin_email`=? ";
        $stmt9 = $this->connect()->prepare($query9);
        $stmt9->execute([$formData[0]["Form_name"], $formData[0]["Admin_email"]]);
        $formcodeData = $stmt9->fetch();

        $query5 = "UPDATE form SET Form_code = ? WHERE F_id = ?";
        $result = $this->connect()->prepare($query5);
        $result->execute([$formcodeData["F_id"],$latestFormVersionId]);
        echo $formcodeData["F_id"];
   
    }

    public function publishForm($F_id,$role,$department,$year,$division){

        $query = "UPDATE publish_details SET Role='$role',Department='$department',Year='$year',Division='$division' WHERE F_id=$F_id ";
        $result=$this->connect()->prepare($query);
        $result->execute([$role,$department,$year,$division,$end,$F_id]);

        if ($role == 'Everyone') {
            $query1 = "SELECT * FROM user";
            $result1=$this->connect()->prepare($query1);
            if ($result1->execute()){
                while ($rows = $result1->fetch()){
                    $data[] = $rows;
                }
            }
        }
        else if ($role == 'Teacher'){
            if ($department == 'All Departments'){
                $query1 = "SELECT * FROM user WHERE Role='$role' ";
                $result1=$this->connect()->prepare($query1);
                if ($result1->execute([$role])){
                    while ($rows = $result1->fetch()){
                        $data[] = $rows;
                    }
                }
            }
            else {
                $query1 = "SELECT * FROM user WHERE Role='$role'AND Department='$department' AND Year='' AND 
                Division='' ";
                $result1=$this->connect()->prepare($query1);
                if ($result1->execute([$role,$department])){
                    while ($rows = $result1->fetch()){
                        $data[] = $rows;
                    }
                }
            }    
        }
        else if ($role == 'Student') {
            if ($department == 'All Departments') {
                $query1 = "SELECT * FROM user WHERE Role='$role' ";
                $result1=$this->connect()->prepare($query1);
                if ($result1->execute([$role])){
                    while ($rows = $result1->fetch()){
                        $data[] = $rows;
                    }
                }
            }
            else {
                if ($year == 'All years') {
                    $query1 = "SELECT * FROM user WHERE Role='$role'AND Department='$department' ";
                    $result1=$this->connect()->prepare($query1);
                    if ($result1->execute([$role,$department])){
                        while ($rows = $result1->fetch()){
                            $data[] = $rows;
                        }
                    }
                }
                else {
                    if ($division == 'All Divisions') {
                        $query1 = "SELECT * FROM user WHERE Role='$role'AND Department='$department' AND Year='$year' ";
                        $result1=$this->connect()->prepare($query1);
                        if ($result1->execute([$role,$department,$year])){
                            while ($rows = $result1->fetch()){
                                $data[] = $rows;
                            }
                        }
                    }
                    else {
                        $query1 = "SELECT * FROM user WHERE Role='$role'AND Department='$department' AND Year='$year' AND 
                        Division='$division' ";
                        $result1=$this->connect()->prepare($query1);
                        if ($result1->execute([$role,$department,$year,$division])){
                            while ($rows = $result1->fetch()){
                                $data[] = $rows;
                            }
                        }
                    }                 
                }  
            }     
        }

        $query4 = "SELECT Form_code FROM form WHERE F_id = $F_id";
        $result4 = $this->connect()->prepare($query4);
        $result4->execute([$F_id]);
        $formCode = $result4->fetch();

        $query6 = "DELETE FROM user_form_access WHERE Form_code = ?";
        $result6 = $this->connect()->prepare($query6);
        $result6->execute([$formCode["Form_code"]]);
        
            foreach($data as $row){
            $query2 = " INSERT INTO `user_form_access` (`user_email`,`F_id`,`Form_code`) 
            VALUES (?,?,?) ";
            $result2=$this->connect()->prepare($query2);
            $result2->execute([$row['User_email'],$F_id,$formCode["Form_code"]]);
            }

        $query5 = "UPDATE form SET published = 0 WHERE Form_code = ?";
        $result5 = $this->connect()->prepare($query5);
        $result5->execute([$formCode["Form_code"]]);
        
        $query3 = "UPDATE form SET published = 1 WHERE F_id = ?";
        $result3 = $this->connect()->prepare($query3);
        $result3->execute([$F_id]);

    }


    public function validateUser($user_name, $user_password) {
        $sql = "SELECT * FROM user WHERE User_email =? AND User_password=? AND `DELETED`=0 ";

        try {
            $stmt = $this->connect()->prepare($sql);
            $stmt->execute([$user_name, $user_password]);

            $results = $stmt->FetchAll();
            $rowCount = $stmt->rowCount();

            if($rowCount > 1) {
                $ans = [$rowCount, $results];
                return null;
            }
            else if($rowCount = 0) {
                return null;
            }
            else if($rowCount = 1 ) {
                return $results ?? null;
            }
        }
        catch(Exception $e) {
            echo "Database action was not successfull".$e->message();
        }
    }

    public function fetchPublishedForms(){
        $data = null;
        $admin_email = $_SESSION['admin_username'];
        $query = "SELECT * FROM form WHERE Admin_email = ? AND published = 1 AND DELETED = 0 ";
        $result = $this->connect()->prepare($query);
        if ($result->execute([$admin_email])){
            while ($row = $result->fetch()){
                $data[] = $row;
            }
        }
        return $data;
    }
    
    public function fetchUserResponseDetails($F_id){
        $data = null;
        $query = "SELECT * FROM user_response WHERE F_id = ?";
        $result = $this->connect()->prepare($query);
        //$result->execute([$F_id]);
        $count = 0;
        if ($result->execute([$F_id])){
            while ($row = $result->fetch()){
                $count = $count + 1;
            }
        }
        return $count;
    }

    public function getFormDataForResponse($F_id){
        $data = null;
        $query = "SELECT * FROM form WHERE F_id = ? ";
        $result = $this->connect()->prepare($query);
        if ($result->execute([$F_id])){
            while ($row = $result->fetch()){
                $data[] = $row;
            }
        }
        return $data;
    }

    public function fetchUsersResponse($F_id) {
        $data = null;
        $query = " SELECT * FROM user_response WHERE F_id = ? ";
        $result = $this->connect()->prepare($query);
        if ($result->execute([$F_id])){
            while ($row = $result->fetch()){
                $data[] = $row;
            }
        }
        return $data;
    }

    public function fetchUserNameResponse($F_id,$user_name) {
        $data = null;
        $query = "SELECT * FROM answers WHERE F_id = ? AND User_email = ? AND DELETED = 0 ORDER BY Q_id ";
        $result = $this->connect()->prepare($query);
        if ($result->execute([$F_id,$user_name])){
            while ($row = $result->fetch()){
                $data[] = $row;
            }
        }
        return $data;
    }

    public function fetchShareDetails($F_id,$admin_email) {
        $data = null;
        $query = "SELECT * FROM shared_forms WHERE F_id = ? AND Admin_email = ?";
        $result = $this->connect()->prepare($query);
        if ($result->execute([$F_id,$admin_email])){
            while ($row = $result->fetch()){
                $data[] = $row;
            }
        }
        return $data;
    }

    public function sendSharedFormDetails($F_id,$admin_email,$shared_id){
        // $query = "SELECT * FROM shared_forms WHERE F_id = ? ";
        // $result = $this->connect()->prepare($query);
        // $result->execute([$F_id]);
        // $rows = $result->fetchAll();

        // if(!empty($rows)){
        //     $query1 = "UPDATE shared_forms SET shared_with = ? WHERE F_id = ? ";
        //     $result1 = $this->connect()->prepare($query1);
        //     $result1->execute([$shared_id,$F_id]);
        // }
        // else{
            $query1 = "INSERT INTO shared_forms(F_id,Admin_email,shared_with) VALUES (?,?,?)";
            $result1 = $this->connect()->prepare($query1);
            $result1->execute([$F_id,$admin_email,$shared_id]);
        // /}
    }
    
    public function fetchSharedRecords($admin_email) {
        $data = null;
        $query = "SELECT * FROM shared_forms INNER JOIN form ON shared_forms.F_id=form.F_id WHERE shared_with = ? ";
        $result = $this->connect()->prepare($query);
        if ($result->execute([$admin_email])){
            while ($row = $result->fetch()){
                $data[] = $row;
            }
        }
        return $data;
    }

    public function getResponseData($Q_id) {
        $data = array();
        $query = " SELECT * FROM questions WHERE Q_id = ? ";
        $result = $this->connect()->prepare($query);
        $result->execute([$Q_id]);
        $row = $result->fetchAll();
        array_push($data, $row[0]["Option1"]);
        array_push($data, $row[0]["Option2"]);
        array_push($data, $row[0]["Option3"]);
        array_push($data, $row[0]["Option4"]);
        array_push($data, $row[0]["Option5"]);

        $count = array();
        
        $query1 = " SELECT * FROM answers WHERE Q_id = ? AND Answer_desc = ? ";
        $result1 = $this->connect()->prepare($query1);
        $count_op1 = 0;
        if ($result1->execute([$Q_id,$data[0]])) {
            while ($row1 = $result1->fetch()) {
                $count_op1 = $count_op1 + 1;
            }
        }

        $query2 = " SELECT * FROM answers WHERE Q_id = ? AND Answer_desc = ? ";
        $result2 = $this->connect()->prepare($query2);
        $count_op2 = 0;
        if ($result2->execute([$Q_id,$data[1]])) {
            while ($row2 = $result2->fetch()) {
                $count_op2 = $count_op2 + 1;
            }
        }

        $query3 = " SELECT * FROM answers WHERE Q_id = ? AND Answer_desc = ? ";
        $result3 = $this->connect()->prepare($query3);
        $count_op3 = 0;
        if ($result3->execute([$Q_id,$data[2]])) {
            while ($row3 = $result3->fetch()) {
                $count_op3 = $count_op3 + 1;
            }
        }

        $query4 = " SELECT * FROM answers WHERE Q_id = ? AND Answer_desc = ? ";
        $result4 = $this->connect()->prepare($query4);
        $count_op4 = 0;
        if ($result4->execute([$Q_id,$data[3]])) {
            while ($row4 = $result4->fetch()) {
                $count_op4 = $count_op4 + 1;
            }
        }

        $query5 = " SELECT * FROM answers WHERE Q_id = ? AND Answer_desc = ? ";
        $result5 = $this->connect()->prepare($query5);
        $count_op5 = 0;
        if ($result5->execute([$Q_id,$data[4]])) {
            while ($row5 = $result5->fetch()) {
                $count_op5 = $count_op5 + 1;
            }
        }

        array_push($count, $count_op1);
        array_push($count, $count_op2);
        array_push($count, $count_op3);
        array_push($count, $count_op4);
        array_push($count, $count_op5);

        return $count;

    }

    public function getResponseDataForRating($Q_id) {
        $data = [0, 0, 0, 0, 0];
        $query = " SELECT * FROM answers WHERE Q_id = ? ";
        $result = $this->connect()->prepare($query);
        $result->execute([$Q_id]);
        $rowCount = $result->rowCount();
        $rows = $result->fetchAll();
        for ($i = 0; $i < $rowCount; $i++){
            if ($rows[$i]['Answer_desc'] == '1') {
                $data[0] = $data[0] + 1;
            }
            else if ($rows[$i]['Answer_desc'] == '2') {
                $data[1] = $data[1] + 1;
            }
            else if ($rows[$i]['Answer_desc'] == '3') {
                $data[2] = $data[2] + 1;
            }
            else if ($rows[$i]['Answer_desc'] == '4') {
                $data[3] = $data[3] + 1;
            }
            else if ($rows[$i]['Answer_desc'] == '5') {
                $data[4] = $data[4] + 1;
            }
        }
        return $data;
    }

    public function getResponseDataForMulti($Q_id) {
        $data = array();
        $query = " SELECT * FROM questions WHERE Q_id = ? ";
        $result = $this->connect()->prepare($query);
        $result->execute([$Q_id]);
        $row = $result->fetchAll();
        array_push($data, $row[0]["Option1"]);
        array_push($data, $row[0]["Option2"]);
        array_push($data, $row[0]["Option3"]);
        array_push($data, $row[0]["Option4"]);
        array_push($data, $row[0]["Option5"]);
        
        //$dataStr = implode(",", $data);

        $count = array();

        $count_op1 = 0;
        $count_op2 = 0;
        $count_op3 = 0;
        $count_op4 = 0;
        $count_op5 = 0;
        
        $query1 = " SELECT * FROM answers WHERE Q_id = ? ";
        $result1 = $this->connect()->prepare($query1);
        $result1->execute([$Q_id]);
        $rows = $result1->fetchAll();
        $rowCount = $result1->rowCount();

        for($i=0; $i<$rowCount; $i++) {
            $ansArr = explode(',', $rows[$i]['Answer_desc']);
            $resultofDiff = count(array_diff($data,$ansArr));
            $diff = 5 - $resultofDiff;
            for ($j=0; $j<$diff; $j++) {
                $index = array_search($ansArr[$j], $data);
                if ($index == 0) {
                    $count_op1 = $count_op1 + 1;
                }
                if ($index == 1) {
                    $count_op2 = $count_op2 + 1;
                }
                if ($index == 2) {
                    $count_op3 = $count_op3 + 1;
                }
                if ($index == 3) {
                    $count_op4 = $count_op4 + 1;
                }
                if ($index == 4) {
                    $count_op5 = $count_op5 + 1;
                }
            }
        }

        array_push($count, $count_op1);
        array_push($count, $count_op2);
        array_push($count, $count_op3);
        array_push($count, $count_op4);
        array_push($count, $count_op5);
        array_push($count, $rowCount);

        return $count;
    }

    public function getRemainingUsers($F_id) {
        $data = null;
        $query = " SELECT * FROM user_form_access WHERE F_id = ? ";
        $result = $this->connect()->prepare($query);
        $result->execute([$F_id]);
        $data = $result->fetchAll();
        return $data;
    }

    public function checkForPublish($F_id) {
        $data = null;
        $query = " SELECT Published FROM form WHERE Form_code = ? ";
        $result = $this->connect()->prepare($query);
        $result->execute([$F_id]);
        $data = $result->fetchAll();
        $rowCount = $result->rowCount();
        for($i=0; $i<$rowCount; $i++) {
            if($data[$i]['Published'] == 1) {
                return 1;
            }
        }
        return 0;
    }

    public function unPublishForm($F_id) {
        $query = " UPDATE form SET Published = 0 WHERE Form_code = ? ";
        $result = $this->connect()->prepare($query);
        $result->execute([$F_id]);

        $query1 = "DELETE FROM user_form_access WHERE Form_code = ? ";
        $result1 = $this->connect()->prepare($query1);
        $result1->execute([$F_id]);
    }

    protected function deleteSharedFormContributorModal($sharedFormId) {
        $query = "DELETE FROM `shared_forms` WHERE `shared_forms`.`id` =?";
        $result = $this->connect()->prepare($query);
        $result->execute([$sharedFormId]);
        return 1;
    }

    
}
