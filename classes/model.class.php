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
        $query = "SELECT * FROM `form` WHERE `F_id`= ? AND `DELETED`=0 AND `Admin_id`= ?";

        try{
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([$F_id, $_SESSION['admin_id'] ]);
            $formIdName = $stmt->FetchAll();
        }
        catch(Exception $e) {
            echo "Fetching Forms Version Data was not successfull ".$e->message();
        }
        
        try{
            $Form_name = $formIdName[0]['Form_name'];
            $query2 = "SELECT * FROM `form` WHERE `Form_name`= ? AND `Admin_id`=? AND  `DELETED`=0 ";
        }
        catch(Exception $e) {
            return false;
        }
       
        try{
            $stmt = $this->connect()->prepare($query2);
            $stmt->execute([$Form_name, $_SESSION['admin_id']]);
            $formVersionsData = $stmt->FetchAll();
            return $formVersionsData ?? false;
        }
        catch(Exception $e) {
            return "Fetching Forms Version Data was not successfull ".$e->message();
        }
    }

    
    // Insert forms based on who is logged in
    protected function insetNewForm(string $formName, string $formDesc) {
        session_start();
        
        $query =  "INSERT INTO `form`(`Admin_id`,`Admin_email`, `Form_name`, `Form_version`,`Form_Desc`, `Form_details`, `DELETED`) VALUES (?,?,?, 1, ? ,1,0)";
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
            return true;
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
            $query = "UPDATE `form` SET DELETED=1 WHERE F_id= ? ";
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([$F_id]);
            return true;
        }
        catch(Exception $e) {
            return "Error in deleting the form due to :".$e->message();
        }
    }

    protected function updateFormName($F_id, $Form_name) {
        try {
            $query = "UPDATE `form` SET `Form_name`=? WHERE F_id= ? ";
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([$Form_name, $F_id]);
            return "Update successfull";
        }
        catch(Exception $e) {
            return "Error in updating the form due to :".$e->message();
        }
    }

    protected function getFormQuestionData($F_id) {
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


        $query3 = "INSERT INTO `form`(`Admin_id`, `Admin_email`, `Form_name`, `Form_version`, `Form_Desc`, `Form_details`, `DELETED`) VALUES (?, ?, ? , ?, '', 1, ?)";
        $stmt3 = $this->connect()->prepare($query3);
        $stmt3->execute([ $formData[0]["Admin_id"], $formData[0]["Admin_email"], $formData[0]["Form_name"], $noOfFormVersions, 0] );

        
        $query4 = "SELECT * FROM `form` WHERE `Form_name`=? AND `Admin_email`=? AND `Form_version`=? AND`DELETED`=0";
        $stmt4 = $this->connect()->prepare($query4);
        $stmt4->execute([ $formData[0]["Form_name"],  $formData[0]["Admin_email"], $noOfFormVersions] );
        $formDataOfCurrentVersion = $stmt4->FetchAll();        
        $latestFormVersionId = $formDataOfCurrentVersion[0]["F_id"];
        // return $latestFormVersionId;

        $query7 = "INSERT INTO `questions` (`Q_id`, `Q_no`, `F_id`, `Breakpoints`, `rating_scale`, `type`, `Question_desc`, `Option1`, `Option2`, `Option3`, `Option4`, `Option5`, `Default_Option`, `DELETED`) VALUES (NULL, '1', ?, '', '', 'text', ?, 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', 'NULL', '0')";
        $stmt7 = $this->connect()->prepare($query7);
        $stmt7->execute([$latestFormVersionId, $this->counter]);


        $query5 = "SELECT * FROM `form` WHERE `Form_name`=? AND `Admin_email`=? AND `Form_version`=? AND`DELETED`=0";
        $stmt5 = $this->connect()->prepare($query5);
        $noOfFormVersions--;
        $stmt5->execute([ $formData[0]["Form_name"],  $formData[0]["Admin_email"], $noOfFormVersions] );
        $formDataOfPreviousVersion = $stmt5->FetchAll();  
        $previousFormVersionId = $formDataOfCurrentVersion[0]["F_id"];
       
        
        $query6 = "SELECT * FROM `questions` WHERE `F_id`=?";
        $stmt6 = $this->connect()->prepare($query6);
        $stmt6->execute([ $previousFormVersionId ] );
        $previousFormVersionData = $stmt6->FetchAll();  
        echo $previousFormVersionId;
        echo var_dump($previousFormVersionData);

        $questionCounter = 1;
        $arrayStart = 0;
        foreach($previousFormVersionData as $row) {
            $query7 = "INSERT INTO `questions` (`Q_no`, `F_id`, `Breakpoints`, `rating_scale`, `type`, `Question_desc`, `Option1`, `Option2`, `Option3`, `Option4`, `Option5`, `Default_Option`, `DELETED`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt7 = $this->connect()->prepare($query7);
            $stmt7->execute([$questionCounter, $latestFormVersionId, $previousFormVersionData[$arrayStart]["Breakpoints"], $previousFormVersionData[$arrayStart]["rating_scale"] , $previousFormVersionData[$arrayStart]["type"] , $previousFormVersionData[$arrayStart]["Question_desc"], $previousFormVersionData[$arrayStart]["Option1"], $previousFormVersionData[$arrayStart]["Option2"], $previousFormVersionData[$arrayStart]["Option3"], $previousFormVersionData[$arrayStart]["Option4"], $previousFormVersionData[$arrayStart]["Option5"],  $previousFormVersionData[$arrayStart]["Default_Option"],  $previousFormVersionData[$arrayStart]["DELETED"]]);
            // echo $previousFormVersionData[$arrayStart]["Question_desc"];
            $arrayStart++;
        }

        $query8 = "SELECT * FROM `questions` WHERE `F_id`=?";
        $stmt8 = $this->connect()->prepare($query8);
        $stmt8->execute([ $latestFormVersionId ] );
        $newinsertedquestions = $stmt8->FetchAll();  
        return $newinsertedquestions;
        
    }
}



// $obj = new Model();
// $results = $obj->createNewFormVersions(273);
// echo var_dump($results);
// echo (string)$results;   