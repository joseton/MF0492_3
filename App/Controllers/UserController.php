<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller{

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

//     - Controlador "UserController":
        //     - Acción "index": Carga la vista "Auth.html" con los dos formularios
        // de login y registro.


        public function indexAction(){
            View::renderTwig('User/Auth.html');

        }

        public function registerAction($params){
            View::renderTwig('User/Auth.html');

        }

        public function loginAction($params){
            View::renderTwig('User/Auth.html');


        }



    // Final TODO Challenge 5

    // public function indexAction($params){
    //
    //     if(isset($params['registrar'])){
    //         $email = $params['email'];
    //         $pass = $params['pass'];
    //         // val sólo Email
    //         $email = htmlspecialchars($email);
    //         $email = stripslashes($email);
    //         $email = trim($email);
    //
    //         if(empty($email)){
    //             $message = 'El email esta vacío';
    //         }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
    //             $message = 'El email no es correcto';
    //         }else{
    //
    //             $model = new UserModel;
    //             $result = $model->registrar($params);
    //             if($result){
    //                 $message = 'Registro ok';
    //             }else{
    //                 $message = 'Error en el registro';
    //             }
    //
    //         }
    //         View::renderTwig('User/register.html', array('mensaje'=>$message));
    //
    //     }else{
    //         View::renderTwig('User/register.html');
    //     }
    // }

}
