<?php

/** @desc OF THIS FILE
 *  @param this class is the model, and its task is to interact with the database
**/
include 'Dbh.class.php';

class Model extends Dbh {

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
        $query = "SELECT * FROM form WHERE `F_id` IN (SELECT F_id from access WHERE `access_receiver`= ? ORDER BY `F_id` ASC) AND `Form_version`=1";

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

    protected function fetchFormVersions($F_id) {
        $query = "SELECT * FROM `form` WHERE `F_id`= ? AND `DELETED`=0 ";

        try{
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([$F_id]);
            $formIdName = $stmt->FetchAll();
        }
        catch(Exception $e) {
            echo "Fetching Forms Version Data was not successfull ".$e->message();
        }
        
        $Form_name = $formIdName[0]['Form_name'];

        $query2 = "SELECT * FROM `form` WHERE `Form_name`= ?";
        try{
            $stmt = $this->connect()->prepare($query2);
            $stmt->execute([$Form_name]);
            $formVersionsData = $stmt->FetchAll();
            return $formVersionsData ?? false;
        }
        catch(Exception $e) {
            return "Fetching Forms Version Data was not successfull ".$e->message();
        }
    }

    
    // Insert forms based on who is logged in
    protected function insetNewForm(string $formName, string $formDesc) {
        $query =  "INSERT INTO `form`(`Admin_id`, `Form_name`, `Form_version`,`Form_Desc`, `Form_details`, `DELETED`) VALUES ('PRA',?, 1,? ,1,0)";
        try {
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([$formName, $formDesc]);
            $query2 = "SELECT `F_id` FROM form ORDER by F_id DESC LIMIT 1";
            $stmt2 = $this->connect()->prepare($query2);
            $stmt2->execute();
            $newInsertedF_id = $stmt2->fetchAll();

            $thisF_id = $newInsertedF_id[0]['F_id'];


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
        session_start();
        $admin_username = $_SESSION['admin_username'];
        try{
            $query2 = "INSERT INTO `access`(`F_id`, `Admin_id`, `access_giver`, `access_receiver`, `priviliges`, `DELETED`) VALUES (?, 'PRA', ? , ?, 'master', 0)";
            $stmt = $this->connect()->prepare($query2);
            $stmt->execute([$newInsertedF_id, $admin_username, $admin_username]);
            return true;
        } 
        catch(Exception $e) {
            return "Inserting into the access table failed".$e->message();
        }
        

    }

    protected function getFormQuestionData($F_id) {
        $query = "SELECT * FROM `questions` WHERE `F_id`=$F_id";
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

}



// $obj = new Model();
// $results = $obj->insetNewForm("1", "nothing");
// echo var_dump($results);
// echo (string)$results;   