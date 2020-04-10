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
    public function register($params){
      $sql = "insert into users values (:id, :email, :pass)";
      $stmt = $this->db->prepare($sql);
      $id = null;
      $email = $params['emailr'];
      $pass = $params['passr'];
      $stmt->bindParam(':id', $id);
      $stmt->bindParam(':email', $email);
      $stmt->bindParam(':pass', $pass);
      if($stmt->execute()){
        return 1;
      }else{
        return 2;
      }
    }

    public function login($params){
      $sql = "select * from users where email = :email and pass = :pass";
      $stmt = $this->db->prepare($sql);
      $email = $params['emaill'];
      $pass = $params['passl'];
      $stmt->bindParam(':email', $email);
      $stmt->bindParam(':pass', $pass);

      $stmt->execute();
      if($stmt->rowCount() == 1){
        return true;
      }else{
        return false;
      }
    }

    public function checkEmail($params){
        $sql = "select * from users where email=:email";
        $stmt = $this->db->prepare($sql);
        $stmt->bindParam(':email', $email);
        $email = $params['emailr'];

        $stmt->execute();
        $rows = $stmt->rowCount();

        if($rows == 1){return 0;}
        else{return 2;}
    }
  }
