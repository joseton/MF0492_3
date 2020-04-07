<?php
namespace App\Models;

use Core\Model;
use PDO;

class UserModel extends Model{

    private $db;

    public function __construct(){
        $this->db = Model::getInstanceDB();
    }


    public function signup($email, $pass){

        //Consultamos si existe el email
        $sql = "select * from user where user_email=:user_email";

        //Preparamos la query
        $stmt = $this->db->prepare($sql);

        //Los camuflamos con el bindParam
        $stmt->bindParam(':user_email', $email);

        //Ejecutamos la sentencia
        $stmt->execute();
        $rows = $stmt->rowCount(); //Almacenamos el número de registros obtenidos

        //Si el resultado de la query devuelve un registro devolvemos 0
        if($rows == 1){return 0;}
        else{
            //Consultamos si existe el email
            $sql = "insert into user values (:user_email, :nickname, :pwd)";

            //Preparamos la query
            $stmt = $this->db->prepare($sql);

            //Los camuflamos con el bindParam
            $stmt->bindParam(':user_email', $email);
            $stmt->bindParam(':pwd', $pass);
            $stmt->bindParam(':nickname', $nickname);


            //Recojemos los imputs del formulario y los guardamos
            $nickname = null;

            //Si se ha ejecutado la query del registro correctamente devolvemos 1, si no, 2
            if($stmt->execute()){
                return 1;
            }else{
                return 2;
            }
        }
    }


    public function login($email, $pass){

        //Realizamos la query
        $sql = "select * from user where user_email=:user_email and pwd=:pwd";

        //Preparamos, ejecutamos la query y vemos si hay registros en la salida
        $stmt = $this->db->prepare($sql);

        //Los camuflamos con el bindParam
        $stmt->bindParam(':user_email', $email);
        $stmt->bindParam(':pwd', $pass);

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

    public function selectTema(){

        //Consultamos si existe el email
        $sql = "select * from topic where user_email=:user_email";

        //Preparamos la query
        $stmt = $this->db->prepare($sql);
        //Los camuflamos con el bindParam
        $stmt->bindParam(':user_email', $_SESSION['email']);
        //Ejecutamos la sentencia
        $stmt->execute();
        // $result = $stmt->fetch(PDO::FETCH_ASSOC);
        $result = $stmt->fetchAll();

        //Devolvemos la variable array $results con todos los valores obtenidos
        return $result;
    }


    public function createTopic($params){


        $name = $params['newTopic'];

        $sql = "select * from topic where name=:name and user_email=:user_email";

        //Preparamos la query
        $stmt = $this->db->prepare($sql);
        //Los camuflamos con el bindParam
        $stmt->bindParam(':user_email', $_SESSION['email']);
        $stmt->bindParam(':name', $name);
        //Ejecutamos la sentencia
        $stmt->execute();
        $rows = $stmt->rowCount(); //Almacenamos el número de registros obtenidos

        //Si el resultado de la query devuelve un registro devolvemos 0
        if($rows == 1){return 0;}
        else{

            //Consultamos si existe el email
            $sql = "insert into topic values (:id_topic, :name, :user_email)";

            //Preparamos la query
            $stmt = $this->db->prepare($sql);

            //Los camuflamos con el bindParam
            $stmt->bindParam(':id_topic', $id_topic);
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':user_email', $_SESSION['email']);

            //Si se ha ejecutado la query del registro correctamente devolvemos 1, si no, 2
            if($stmt->execute()){
                return 1;
            }else{
                return 2;
            }
        }
    }


    public function editTopic($params){

        $name = $params['editTopic'];

        $sql = "select * from topic where name=:name and user_email=:user_email";

        //Preparamos la query
        $stmt = $this->db->prepare($sql);
        //Los camuflamos con el bindParam
        $stmt->bindParam(':user_email', $_SESSION['email']);
        $stmt->bindParam(':name', $name);
        //Ejecutamos la sentencia
        $stmt->execute();
        $rows = $stmt->rowCount(); //Almacenamos el número de registros obtenidos

        //Si el resultado de la query devuelve un registro devolvemos 0
        if($rows == 1){return 0;}
        else{

            //Consultamos si existe el email
            $sql = "insert into topic values (:id_topic, :name, :user_email)";

            //Preparamos la query
            $stmt = $this->db->prepare($sql);

            //Los camuflamos con el bindParam
            $stmt->bindParam(':id_topic', $id_topic);
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':user_email', $_SESSION['email']);

            //Si se ha ejecutado la query del registro correctamente devolvemos 1, si no, 2
            if($stmt->execute()){
                return 1;
            }else{
                return 2;
            }
        }
    }


    public function deleteTopic($id){

        //Borramos el tema
        $sql = "delete from topic where name = :name and user_email = :user_email";

        //Preparamos la query
        $stmt = $this->db->prepare($sql);

        //Los camuflamos con el bindParam
        $stmt->bindParam(':name', $id);
        $stmt->bindParam(':user_email', $_SESSION['email']);

        //Si se ha ejecutado la query del registro correctamente devolvemos 1, si no, 2
        if($stmt->execute()){
            return true;
        }else{
            return false;
        }
    }


    public function updateTopic($changeTopic, $oldTopic){

        $sql = "select * from topic where name=:name and user_email=:user_email";

        //Preparamos la query
        $stmt = $this->db->prepare($sql);
        //Los camuflamos con el bindParam
        $stmt->bindParam(':user_email', $_SESSION['email']);
        $stmt->bindParam(':name', $changeTopic);
        //Ejecutamos la sentencia
        $stmt->execute();
        $rows = $stmt->rowCount(); //Almacenamos el número de registros obtenidos
        // $id_topic = $stmt->fetch(PDO::FETCH_ASSOC);

        //Si el resultado de la query devuelve un registro devolvemos 0
        if($rows == 1){return 0;}
        else{
            //Averiguamos el id_topic del name antiguo
            $sql = "select id_topic from topic where name=:name and user_email=:user_email";

            //Preparamos la query
            $stmt = $this->db->prepare($sql);

            //Los camuflamos con el bindParam
            $stmt->bindParam(':name', $oldTopic);
            $stmt->bindParam(':user_email', $_SESSION['email']);

            $stmt->execute();
            $rows1 = $stmt->rowCount(); //Almacenamos el número de registros obtenidos
            $id_topi = $stmt->fetch(PDO::FETCH_ASSOC);
            $id_topic = (int)$id_topi['id_topic'];


            var_dump($id_topic);

            if($rows1 == 1){
                //Actualizamos el tema
                $sql = "update topic set name=:new_name where user_email=:user_email and id_topic=:id_topic";

                //Preparamos la query
                $stmt = $this->db->prepare($sql);

                //Los camuflamos con el bindParam
                // $stmt->bindParam(':id_topic', $id_topic);
                $stmt->bindParam(':new_name', $changeTopic);
                $stmt->bindParam(':id_topic', $id_topic);
                $stmt->bindParam(':user_email', $_SESSION['email']);

                $stmt->execute();

                return 1;
            }else{return 2;}

        }
    }
}
