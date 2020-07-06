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
    public function generateFormCode() {
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

    protected function fetchForms() {
        $query = "SELECT * FROM form WHERE Form_version=1 AND `DELETED`=0 ";

        try {
            $stmt = $this->connect()->prepare($query);
            $stmt->execute();
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

    // Insert forms
    protected function insetNewForm(string $formName, string $formdesc) {
        $query = "INSERT INTO `form`(`Admin_id`, `Form_code`, `Form_name`, `Form_version`, `Form_details`, `DELETED`) VALUES ('PRA', :formCount, :formName, 1,1,0)";
        try {
            $stmt = $this->connect()->prepare($query);
            $stmt->execute([
                'formCount' =>$rowCount,
                'formName' => $formName,
            ]);
            return true;
        } 
        catch(Exception $e ) {
            echo "Fetching Forms data was not successfull ".$e->message();
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
// $results = $obj->getFormQuestionData(1);
// echo var_dump($results);
// echo (string)$results;   