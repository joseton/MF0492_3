<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller{

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
public function indexAction() {
    View::renderTwig('User/auth.html');
}

    // Final TODO Challenge 5
    /*
- Controlador "UserController":
        - Acción "index": Carga la vista "Auth.html" con los dos formularios
    de login y registro.
    
        - Acción "register": Recibe los datos del formulario de registro,
    los valida y envía al modelo para el registro en la DB. Devuelve los
    mensajes de confirmación a la vista "Auth.html".


        - Acción "login": Recibe los datos del formulario de login, los
    valida y envía al modelo para su comprobación en la DB. Devuelve los
    mensajes de confirmación a la vista "Auth.html".

    - Modelo "UserModel":
        - Acción "register": Recibe los datos de la acción "register" del
    controlador y los inserta en una tabla de "users" de la DB. Devuelve un
    "true" o "false" dependiendo del éxito de la inserción.
        - Acción "login": Recibe los datos de la acción "login" del
    controlador y los comprueba en la tabla de "users" de la DB. Devuelve un
    "true" o "false" dependiendo del éxito de la comprobación.

    - JS:
        - "public/js/user.js": NO VALIDAR LOS FORMULARIOS (sólo en backend).
    Añadir las dos funciones que envian mediante "Ajax" (JS ó JQuery) los
    datos de cada formulario mediante el método "post" cargando el
    controlador pertinente. Estas funciones reciben la respuesta (mensaje)
    del controlador y lo insertan en un "div" debajo del formulario. Los
    datos se transmiten en formato JSON.

    - CSS:
        - "public/css/forms.css": Maquetar los formularios. Añadir el efecto
    (toggle) para cambiar las vista de cada formulario.

    - routes.json:
        - "auth": Carga de la vista "Auth.html"
        - "auth/register": Registro
        - "auth/login": Login*/



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
