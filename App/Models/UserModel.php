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
  // - Acción "register": Recibe los datos de la acción "register" del
  // controlador y los inserta en una tabla de "users" de la DB. Devuelve un
  // "true" o "false" dependiendo del éxito de la inserción.
  //     - Acción "login": Recibe los datos de la acción "login" del
  // controlador y los comprueba en la tabla de "users" de la DB. Devuelve un
  // "true" o "false" dependiendo del éxito de la comprobación.

  public function registro($params){
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
      return 0;
    }
  }

  public function login($params){
    $sql = "select * from users where email= :email and pass= :pass";

    $stmt = $this->db->prepare($sql);

    $email = $params['email_log'];
    $pass = $params['pass_log'];

    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':pass', $pass);

    if(!$stmt->execute()){
      return 0;
    }else{
      $rows = $stmt->rowCount();
      if($rows == 0){
        return 2;
      }else{
        return 1;
      }
    }
  }


  // Final TODO Challenge 5
}
