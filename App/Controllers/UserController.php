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
        View::renderTwig('User/auth.html');
    }

    public function registerAction($params){
        // Test
        // var_dump($params);
        sleep(2);

        $email = $params['email'];
        $pass = $params['pass'];
        // val sólo Email
        $email = htmlspecialchars($email);
        $email = stripslashes($email);
        $email = trim($email);

        if(empty($email)){
            echo json_encode('El email esta vacío');
        }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $message = 'El email no es correcto';
        }else{

            $model = new UserModel;
            $result = $model->registrar($params);
            //TEST
            // var_dump($params);
            if($result){
                echo json_encode('Registro OK');
            }else{
                echo json_encode('Error en el registro');
            }

        }
        // View::renderTwig('User/auth.html', array('mensaje'=>$message));
    }


    public function loginAction($params){
        // Test
        // var_dump($params);
        sleep(1);

        $email = $params['email'];
        $pass = $params['pass'];
        // val sólo Email
        $email = htmlspecialchars($email);
        $email = stripslashes($email);
        $email = trim($email);

        if(empty($email)){
            echo json_encode('El email esta vacío');
        }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
            $message = 'El email no es correcto';
        }else{

            $model = new UserModel;
            $result = $model->login($params);
            //TEST
            // var_dump($params);
            if($result){
                echo json_encode('Has entrado');
            }else{
                echo json_encode('Usuario o contraseña incorrecta');
            }

        }
        // View::renderTwig('User/auth.html', array('mensaje'=>$message));
    }





    // Final TODO Challenge 5



}
