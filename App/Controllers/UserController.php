<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use App\Models\UserModel;

class UserController extends Controller{

    public function indexAction($params){

        if(isset($params['registrar'])){
            $email = $params['email'];
            $pass = $params['pass'];
            // val sólo Email
            $email = htmlspecialchars($email);
            $email = stripslashes($email);
            $email = trim($email);

            if(empty($email)){
                $message = 'El email esta vacío';
            }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                $message = 'El email no es correcto';
            }else{

                $model = new UserModel;
                $result = $model->registrar($params);
                if($result){
                    $message = 'Registro ok';
                }else{
                    $message = 'Error en el registro';
                }

            }
            Controller::renderView('User/register.html', array('mensaje'=>$message), true);

        }else{
            Controller::renderView('User/register.html', [], true);
        }
    }

}
