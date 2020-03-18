<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller{

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    public function indexAction($params){
        // var_dump($params); Auth
        if(isset($_SESSION['email'])){View::renderTwig('Home/home.html');
        }else{View::renderTwig('User/auth.html');}
    }


    public function registerAction($params){
        // Test
        // var_dump($params);
        if(isset($_POST)){

            sleep(1);

            $email = $params['email'];
            $pass = $params['pass'];
            $pass2 = $params['pass2'];
            // validando sólo Email
            $email = htmlspecialchars($email);
            $email = stripslashes($email);
            $email = trim($email);

            // Validando la estructura del password
            $uppercase = preg_match('@[A-Z]@', $pass);
            $lowercase = preg_match('@[a-z]@', $pass);
            $number    = preg_match('@[0-9]@', $pass);
            $specialChars = preg_match('@[^\w]@', $pass);

            if(empty($email)){
                echo json_encode('El email esta vacío');
            }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                echo json_encode('El email no es correcto');
            }else if($pass != $pass2){
                echo json_encode('La contraseña no coincide');
            }else{

                $model = new UserModel;

                $result = $model->checkEmail($params);
                if($result == 0){
                    echo json_encode('El email introducido ya existe');
                }else{
                $result = $model->registrar($params);
                if($result == 1){
                    echo json_encode('Se ha registrado correctamente');
                }else{
                    echo json_encode('Error en el registro');
                }
                }
        // View::renderTwig('User/auth.html', array('mensaje'=>$message));
        }
    }
}

    public function loginAction($params){
        // Test
        // var_dump($params);
        if(isset($_POST)){

            sleep(1);

            $email = $params['email3'];
            $pass = $params['pass3'];
            // val sólo Email
            $email = htmlspecialchars($email);
            $email = stripslashes($email);
            $email = trim($email);

            if(empty($email)){
                echo json_encode('El email esta vacío');
            }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                echo json_encode('El email no es correcto');
            }else{

                $model = new UserModel;
                $result = $model->login($params);
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
        }else{View::renderTwig('auth');}


        // Final TODO Challenge 5

    }

    public function cerrarSesionAction(){
        session_destroy();
        View::renderTwig('User/auth.html');
    }
}
