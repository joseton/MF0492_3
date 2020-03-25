<?php
namespace App\Models;

use Core\Model;
use PDO;

class UserModel extends Model
{
    private $db;

    public function __construct()
    {
        $this->db = Model::getInstanceDB();
    }

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    public function checkEmail($params)
    {
        // pasamos a la variable $sql la consulta de si existe el email
        $sql = "select * from users where email=:email";
        // pasamos a   $stmt la preparacion de  la query
        $stmt = $this->db->prepare($sql);
        // Vincula el parámetro al nombre de variable
        $stmt->bindParam(':email', $email);
        // recogmos las entradas del formulario y las registramos en $email
        $email = $params['emailReg'];

        // ejecutamos la sentencia
        $stmt->execute();
        // alamcenamos el numero de registros obtenidos
        $rows = $stmt->rowCount();
        // si el resultado de la query devueve  un registro devolvemos 0
        if ($rows == 1) {
            return 0;
        } else {
            return 2;
        }
    }

    public function register($params)
    {
        // insertamos en la variable $sql los valores del registro
        $sql = "insert into users values (:id, :email, :pass)";
        // preparamos la query
        $stmt = $this->db->prepare($sql);
        // recogemos los inputs del formulario y los guardamos en variables
        $id=null;
        $email=$params['emailReg'];
        $pass= $params['passReg'];

        // Vincula el parámetro al nombre de variable
        $stmt->bindParam(':id', $id);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);
        // si se ha ejecutado la consulta del resitro bien dara 1 sino 2
        if ($stmt->execute()) {
            return 1;
        } else {
            return 2;
        }
    }

    public function login($params)
    {
        // se ha ce una consulta  si los emails y los pass son correctos
        $sql = "select * from users where email = :email and pass = :pass";
        // preparamos la query y lo introducimos en $stmt
        $stmt = $this->db->prepare($sql);
        // recogemos los inputs del formulario y los guardamos en variables
        $email = $params['emailLogin'];
        $pass = $params['passLogin'];
        // Vincula el parámetro al nombre de variable
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':pass', $pass);
        // ejecutamos la sentencia
        $stmt->execute();
        // alamcenamos el numero de registros obtenidos
        if($stmt->rowCount() == 1){
        // comprobamos si ha registro devolvemos true o false

            return true;
        } else {
            return false;
        }

}








    // Final TODO Challenge 5
