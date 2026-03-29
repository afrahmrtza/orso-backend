<?php
namespace App\Models;

use PDO;

class Db {
    private $host = 'localhost';
    private $user = 'root';
    private $pass = '';
    private $dbname = 'orso_db'; // Sesuaikan dengan nama database kamu

    public function connect() {
        $conn_str = "mysql:host=$this->host;dbname=$this->dbname";
        $dbConn = new PDO($conn_str, $this->user, $this->pass);
        $dbConn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $dbConn;
    }
}