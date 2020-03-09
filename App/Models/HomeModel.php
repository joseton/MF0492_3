<?php

namespace App\Models;

use PDO;
use Core\Model;

class HomeModel extends Model{
    private $db;
    public function __construct(){
        $this->db = Model::getInstanceDB();
    }
}
