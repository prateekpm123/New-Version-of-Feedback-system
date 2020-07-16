<?php 

include "helper/Log.class.php";


class Dbh {

    private $host = "localhost";
    private $user = "root";
    private $pwd = "";
    private $dbName = "new_feedback_system";

    protected function connect() {
        $dsn = 'mysql:host=' . $this->host . ';dbname=' . $this->dbName;
        $pdo = new PDO($dsn, $this->user, $this->pwd);
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        return $pdo;

        $Log = new Log();
        $Log->Write('test.txt','Connection established to '.$dbName.' database');
    }

}
