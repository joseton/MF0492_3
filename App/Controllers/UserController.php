<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller{


    public function indexAction(){
        View::renderTwig('User/Auth.html');
    }


    public function registerAction($params){
        sleep(1);
        // echo json_encode("hola");
        $email = $params['usuario'];
        $pass = $params['pass'];
        // val sólo Email
        $email = htmlspecialchars($email);
        $email = stripslashes($email);
        $email = trim($email);

        if(empty($email)){
            $message = 'El email esta vacío';
            echo json_encode($message);
        }
        // else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        //     $message = 'El email no es correcto';
        //     echo json_encode($message);
        // }else{
        //
        //     $model = new UserModel;
        //     $result = $model->registrar($params);
        //     if($result){
        //         $message = 'Registro ok';
        //     }else{
        //         $message = 'Error en el registro';
        //     }
        //
        // }




    }


    public function longinAction($params){

    }


}
