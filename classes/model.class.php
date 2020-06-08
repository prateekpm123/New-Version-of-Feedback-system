<?php

/** @desc OF THIS FILE
 *  @param this class is the model, and its task is to interact with the database
**/
include 'Dbh.class.php';

class Model extends Dbh {

    protected function fetchAdminData() {

        $sql = "SELECT * FROM user";

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
        $sql = "SELECT * FROM admin_credentials WHERE Admin_email =? AND Admin_Password=? ";

        try {
            $stmt = $this->connect()->prepare($sql);
            $stmt->execute([$admin_email, $password]);

            $results = $stmt->FetchAll();
            $rowCount = $stmt->rowCount();

            if($rowCount > 1) {
                $ans = [$rowCount, $results];
                return $ans ?? 'TWO OR MORE ADMINS WITH SAME CREDENTIALS';
            }
            else if($rowCount = 0) {
                return null;
            }
            else {
                return $results ?? null;
            }
        }
        catch(Exception $e) {
            echo "Database action was not successfull".$e->message();
        }
        
    }

    protected function fetchForms() {
        $query = "SELECT * FROM form WHERE Form_version=1";

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
        $query = "SELECT * FROM `form` WHERE `F_id`= ? ";

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

}



// $obj = new Model();
// $results = $obj->validateAdminLogin('prateek.manta@sakec.ac.in','1234567');
// var_dump($results);