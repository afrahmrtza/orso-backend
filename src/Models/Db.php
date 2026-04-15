<?php
namespace App\Models;

use PDO;

class Db {
    private $host = 'db';
    private $user = 'root';
    private $pass = 'root';
    private $dbname = 'orso_db';

    public function connect() {
        $conn_str = "mysql:host=$this->host;dbname=$this->dbname";
        $dbConn = new PDO($conn_str, $this->user, $this->pass);
        $dbConn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $dbConn;
    }
}