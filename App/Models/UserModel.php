<?php
namespace App\Models;

use Core\Model;
use PDO;

class UserModel extends Model{

    private $db;

    public function __construct(){
        $this->db = Model::getInstanceDB();
    }

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    public function registrar($params){

        $sql = "insert into users values (:id, :email, :pass)";

        $stmt = $this->db->prepare($sql);

        $id = null;
        $email = $params['email'];
        $pass = $params['pass'];

        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);

        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }


    public function login($params){

        $sql = "select * from users where email=:email and pass=:pass";

        $stmt = $this->db->prepare($sql);

        $email = $params['email'];
        $pass = $params['pass'];

        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);

        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }

    // Final TODO Challenge 5



}
