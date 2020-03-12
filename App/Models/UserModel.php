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

        $sql = "insert into users values (:id, :email, :pass, :repeatpass)";

        $stmt = $this->db->prepare($sql);

        $id = null;
        $email = $params['email'];
        $pass = $params['pass'];
        $repeatpass = $params['repeatpass'];

        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);
        $stmt->bindParam(':repeatpass', $repeatpass);

        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }



    // Final TODO Challenge 5

}
