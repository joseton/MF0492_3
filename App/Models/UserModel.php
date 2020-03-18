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

    public function checkEmail($params){

        //Consultamos si existe el email
        $sql = "select * from users where email=:email";

        //Preparamos la query
        $stmt = $this->db->prepare($sql);

        //Los camuflamos con el bindParam
        $stmt->bindParam(':email', $email);

        //Recojemos los imputs del formulario y los guardamos
        $email = $params['email'];

        //Ejecutamos la sentencia
        $stmt->execute();
        $rows = $stmt->rowCount(); //Almacenamos el número de registros obtenidos

        //Si el resultado de la query devuelve un registro devolvemos 0
        if($rows == 1){return 0;}
        else{return 9;}
    }

    public function registrar($params){

        //Consultamos si existe el email
        $sql = "insert into users values (:id, :email, :pass)";

        //Preparamos la query
        $stmt = $this->db->prepare($sql);

        //Los camuflamos con el bindParam
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);

        //Recojemos los imputs del formulario y los guardamos
        $id = null;
        $email = $params['email'];
        $pass = $params['pass'];

        //Si se ha ejecutado la query del registro correctamente devolvemos 1, si no, 2
        if($stmt->execute()){
            return 1;
        }else{
            return 2;
        }
    }


    public function login($params){

        //Recojemos los imputs del formulario y los guardamos
        $email = $params['email3'];
        $pass = $params['pass3'];

        //Realizamos la query
        $sql = "select * from users where email=:email and pass=:pass";

        //Preparamos, ejecutamos la query y vemos si hay registros en la salida
        $stmt = $this->db->prepare($sql);

        //Los camuflamos con el bindParam
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);

        //Ejecutamos la sentencia
        $stmt->execute();
        $rows = $stmt->rowCount(); //Almacenamos el número de registros obtenidos

        //Comprobamos si existe registro o no y devolvemos valor
        if($rows == 1){
            return true;
        }else{
            return false;
        }
    }

    // Final TODO Challenge 5

}
