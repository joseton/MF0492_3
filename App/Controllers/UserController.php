<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller{

  // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

  public function indexAction($params){
    View::renderTwig('User/auth.html');
  }
  public function registerAction($params){
    $emailr = $params['emailr'];
    $passr = $params['passr'];
    $passr2 = $params['passr2'];
    $emailr = htmlspecialchars($emailr);
    $emailr = stripslashes($emailr);
    $emailr = trim($emailr);
    if(empty($emailr)){
      $message = 'El email esta vacío';
    }else if(!filter_var($emailr, FILTER_VALIDATE_EMAIL)){
      $message = 'El email no es correcto';
    }else if($passr != $passr2){
      $message = 'Las contraseñas no coinciden';
    }else{
      $model = new UserModel;
      $result = $model->registrar($params);
      if($result){
        echo json_encode('Registro ok');
      }else{
        echo json_encode('Error en el registro');
      }
    }
  }
  public function loginAction($params){
    $emaill = $params['emaill'];
    $passl = $params['passl'];
    $emaill = htmlspecialchars($emaill);
    $emaill = stripslashes($emaill);
    $emaill = trim($emaill);

  if(empty($emaill)){
    $message = 'El email esta vacío';
  }else if(!filter_var($emaill, FILTER_VALIDATE_EMAIL)){
    $message = 'El email no es correcto';
  }else{
    $model = new UserModel;
    $result = $model->entrar($params);
    if($result){
      echo json_encode('Login ok');
    }else{
      echo json_encode('Error en el login');
    }
  }
  }
}
// Final TODO Challenge 5
