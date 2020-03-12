<?php
namespace App\Models;

use Core\Model;
use PDO;

class UserModel extends Model{

    private $db;

    public function __construct(){
        $this->db = Model::getInstanceDB();
    }


    public function registrar($params){

        // $sql = "insert into users values (:id, :email, :pass)";
        //
        // $stmt = $this->db->prepare($sql);
        //
        // $id = null;
        // $email = $params['email'];
        // $pass = $params['pass'];
        //
        // $stmt->bindParam(':id', $id);
        // $stmt->bindParam(':email', $email);
        // $stmt->bindParam(':pass', $pass);
        //
        // if($stmt->execute()){
        //     return true;
        // }else{
        //     return false;
        // }
    }

}
