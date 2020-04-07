<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;
use Core\Security;

class UserController extends Controller{

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    public function indexAction($params){
        if(isset($_SESSION['email'])){View::renderTwig('Body/main_menu.html');
        }else if(isset($_COOKIE["user_cookie"])){
            echo 'user coockie detectado';
            session_start();
            // asignamos valor de usuario (cookie) a la sesion
            // reiniciamos SESION
            $_SESSION["email"] = json_decode($_COOKIE["user_cookie"]);
            View::renderTwig('Body/main_menu.html');
        }else{View::renderTwig('Home/index.html');}
    }


    //REGISTRO
    public function signupAction($params){
        // Test
        // var_dump($params);
        if(isset($_POST)){

            sleep(1);

            $email = Security::secure_input($params['email']);
            $pass = Security::secure_input($params['pass']);
            $pass2 = Security::secure_input($params['pass2']);


            if(empty($email)){
                echo json_encode('El email esta vacío');
            }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                echo json_encode('El email no es correcto');
            }else if($pass != $pass2){
                echo json_encode('La contraseña no coincide');
            }else{

                $pass = Security::en_de_cryptIt($pass, 'en');

                $model = new UserModel;

                $result = $model->signup($email, $pass);
                if($result == 0){
                    echo json_encode('El email introducido ya existe');
                }else if($result == 1){
                        $subject = 'Your Vocabulary - New registration';
                        $body = 'The user '.$email.' has been registered.';
                        $emailadmin = 'esteve84@gmail.com';
                        Security::email($emailadmin, $subject, $body);
                        echo json_encode('Se ha registrado correctamente');
                    }else{
                        echo json_encode('Error en el registro');
                    }
                }
                // View::renderTwig('User/auth.html', array('mensaje'=>$message));
            }
        }


    //LOGIN
    public function loginAction($params){
        // Test
        // var_dump($params);
        if(isset($_POST)){

            $email = Security::secure_input($params['email3']);
            $pass = Security::secure_input($params['pwd3']);



            if(empty($email)){
                echo json_encode('El email esta vacío');
            }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                echo json_encode('El email no es correcto');
            }else{

                $pass = Security::en_de_cryptIt($pass, 'en');

                $model = new UserModel;
                $result = $model->login($email, $pass);
                //TEST
                // var_dump($params);
                if($result){
                    $_SESSION['email']=$email;
                    echo json_encode('ok');
                }else{
                    echo json_encode('Usuario o contraseña incorrecta');
                }
            }
            // View::renderTwig('User/auth.html', array('mensaje'=>$message));
        }else{View::renderTwig('Home/home.html');}


        // Final TODO Challenge 5

    }


    //Acción de crear un tema nuevo
    public function createTopicAction($params){

        sleep(1);

        if(isset($_POST)){

            $newTopic = Security::secure_input($params['newTopic']);

            if(empty($newTopic)){
                echo json_encode('El texto esta vacío');
            }else{
                $model = new UserModel;

                $result = $model->createTopic($params);
                if($result == 0){
                    echo json_encode('El tema introducido ya existe');
                }else if($result == 1){
                    echo json_encode('Se ha guardado correctamente');
                }else{
                    echo json_encode('Error en el registro');
                }
                //}
                // View::renderTwig('User/auth.html', array('mensaje'=>$message));
            }
        }
    }


    //Función que te recoge la información de tus temas
    public function selectTemaAction(){

        $model = new UserModel;
        $result = $model->selectTema();

        echo json_encode($result);

        // echo View::renderTwig('Body/topicList.html', array('List'=>$result));
        // echo View::renderTwig('Body/main_menu.html', array('Dato'=>$dato));
    }


    //Acción al presionar el botón Eliminar Tema
    public function deleteTopicAction($params){

        sleep(1);

        $model = new UserModel;

        $result = $model->deleteTopic($params['id']);
        if($result){
            echo json_encode('Tema eliminado');
        }else{
            echo json_encode('No se ha podido eliminar');
        }
        // View::renderTwig('User/auth.html', array('mensaje'=>$message));
    }


    //Acción al presionar el botón Actualizar Tema
    public function updateTopicAction($params){

        if(isset($_POST)){
            // var_dump($params);
            sleep(1);
            // validando el newTopic
            $changeTopic = Security::secure_input($params['changeTopic']);
            $oldTopic = Security::secure_input($params['oldTopic']);

                $model = new UserModel;
                $result = $model->updateTopic($changeTopic, $oldTopic);
                if($result == 0){
                    echo json_encode('El tema introducido ya existe');
                }else if($result == 1){
                    echo json_encode('Se ha actualizado correctamente');
                }else{
                    echo json_encode('Error al actualizar');
                }
                //}
                // View::renderTwig('User/auth.html
        }
    }



    public function cerrarSesionAction(){
        session_destroy();
        View::renderTwig('Home/home.html');
    }
}
