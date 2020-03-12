<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller{

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
    // public function indexAction(){
    //     View:renderTwig("Auth/auth.html");
    // }
    // Final TODO Challenge 5

    public function indexAction($params){
        View::renderTwig('User/auth.html');
    }








        public function registerAction($params){
            $email = $params['email'];
            $pass = $params['pass'];
            // val sólo Email
            $email = htmlspecialchars($email);
            $email = stripslashes($email);
            $email = trim($email);

            if(empty($email)){
                $message = 'El email esta vacío';
                echo json_encode ($message);
            }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                $message = 'El email no es correcto';
                echo json_encode ($message);
            }else{

                $model = new UserModel;
                $result = $model->registrar($params);
                if($result){
                    $message = 'Registro ok';
                }else{
                    $message = 'Error en el registro';
                }

            }

    }
    // public function loginAction($params){
}
