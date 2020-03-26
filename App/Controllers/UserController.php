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
    sleep (1);
    // if(isset($params['register'])){
    $email = $params['email'];
    $pass = $params['pass'];
    $pass2 = $params['pass2'];

    $email = htmlspecialchars($email);
    $email = stripslashes($email);
    $email = trim($email);

    if(empty($email)){
      $message = '[!] No has ingresado un email';
      echo json_encode($message);
    }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
      $message = '[!] El email no es correcto';
      echo json_encode($message);
    }else if(empty($pass)){
      echo json_encode('[!] No has ingresado una contraseña');
    }else if(empty($pass2)){
      echo json_encode('[!] Debes repetir la contraseña');
    }else if($pass != $pass2){
      echo json_encode('[!] Las contraseñas no coinciden');
    }else{
      $registro = new UserModel;
      $result = $registro->registro($params);
      if($result == 1){
        echo json_encode('El registro se ha completado correctamente');
      }else{
        echo json_encode('[!] Error en el registro');
      }
    }
    // }

  }

  public function loginAction($params){
    sleep (1);
    $email_log = $params['email_log'];
    $pass_log = $params['pass_log'];

    $email_log = htmlspecialchars($email_log);
    $email_log = stripslashes($email_log);
    $email_log = trim($email_log);

    if(empty($email_log)){
      $message = '[!] No has ingresado un email';
      echo json_encode($message);
    }else if(!filter_var($email_log, FILTER_VALIDATE_EMAIL)){
      $message = '[!] El email no es correcto';
      echo json_encode($message);
    }else if(empty($pass_log)){
      echo json_encode('[!] No has ingresado una contraseña');
    }else{
      $login = new UserModel;
      $result = $login->login($params);

      switch ($result) {
        case '0':
        echo json_encode('[!] Error en el login');
        break;
        case '1':
        echo json_encode('Login ok');
        break;
        case '2':
        echo json_encode('[!] Error en el email o la contraseña ingresados');
        break;
        default:
        echo json_encode('[!] Error en la base de datos');
        break;
      }
    }
  }
  // Final TODO Challenge 5
}
