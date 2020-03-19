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


    // REGISTRO___________________________________________________________________

    public function registrar($params){

       $email = $params['email'];
       $sql = "select * from users where email=:email";
       $stmt = $this->db->prepare($sql);
       $stmt->bindParam(':email', $email);
       $stmt->execute();
       $num_reg = $stmt->rowCount();

       if($num_reg === 0){

           $sql = "insert into users values (:id, :email, :pass)";

           $stmt = $this->db->prepare($sql);

           $id = null;
           $email = $params['email'];
           $pass = $params['pass'];

           $stmt->bindParam(':id', $id);
           $stmt->bindParam(':email', $email);
           $stmt->bindParam(':pass', $pass);

           if($stmt->execute()){
               return 1;
           }else{
               return 2;
           }
       }else {
           return 0;
       }

    }
    // LOGIN___________________________________________________________________
    public function login($params){

             $sql = "select * from users where email=:email and pass=:pass";

             $stmt = $this->db->prepare($sql);

             $email = $params['email'];
             $pass = $params['pass'];

             $stmt->bindParam(':email', $email);
             $stmt->bindParam(':pass', $pass);

             $stmt->execute();
             $num_reg = $stmt->rowCount();

             if($num_reg == 1){
                 return true;
             }else{
                 return false;
             }
    }


    // Final TODO Challenge 5

}
