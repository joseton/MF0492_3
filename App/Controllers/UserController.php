<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller{

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
    // - Controlador "UserController":
    //     - Acción "index": Carga la vista "Auth.html" con los dos formularios
    // de login y registro.
    //     - Acción "register": Recibe los datos del formulario de registro,
    // los valida y envía al modelo para el registro en la DB. Devuelve los
    // mensajes de confirmación a la vista "Auth.html".
    //     - Acción "login": Recibe los datos del formulario de login, los
    // valida y envía al modelo para su comprobación en la DB. Devuelve los
    // mensajes de confirmación a la vista "Auth.html".

    public function indexAction(){
        View::renderTwig('User/Auth.html');
    }

    public function registerAction($params){

        if(isset($params['registrar'])){
            $email = $params['email'];
            $pass = $params['pass'];

            $email = htmlspecialchars($email);
            $email = stripslashes($email);
            $email = trim($email);

            if(empty($email)){
                $message = 'No has ingresado un email';
            }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                $message = 'El email no es correcto';
            }else{

                $model = new UserModel;
                $result = $model->registrar($params);
                if($result){
                    $message = 'El registro se ha completado correctamente';
                }else{
                    $message = 'Error en el registro';
                }

            }
            View::renderTwig('User/Auth.html', array('mensaje'=>$message));

        }else{
            View::renderTwig('User/Auth.html');
        }
    }


    // Final TODO Challenge 5
}
