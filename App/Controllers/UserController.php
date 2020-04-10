<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller{

  // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

  public function indexAction($params){
    if(isset($_SESSION['email'])){View::renderTwig('Home/home.html');
    }else{View::renderTwig('User/auth.html');}
  }

  public function registerAction($params){
    if(isset($_POST)){
      sleep(1);
      $email = $params['emailr'];
      $pass = $params['passr'];
      $pass2 = $params['passr2'];
      $email = htmlspecialchars($email);
      $email = stripslashes($email);
      $email = trim($email);

      if(empty($email)){
        echo json_encode('El email esta vacío');
      }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        echo json_encode('El email no es correcto');
      }else if($pass==""){
        echo json_encode('Debes introducir una contraseña');
      }else if($pass != $pass2){
        echo json_encode('Las contraseñas no coinciden');
      }else{
        $model = new UserModel();
        $result = $model->checkEmail($params);
        if($result == 0){
          echo json_encode('El email introducido ya existe');
        }else{
          $result = $model->register($params);
          if($result == 1){
            echo json_encode('Registro ok');
          }else{
            echo json_encode('Error en el registro');
          }
        }
      }
    }
  }

  public function loginAction($params){
    if(isset($_POST)){
      sleep(1);

      $email = $params['emaill'];
      $pass = $params['passl'];
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
        if($result){
          $_SESSION['emaill']=$email;
          echo json_encode('Login ok');
        }else{
          echo json_encode('Error en el login');
        }
      }
    }
  }
}
// Final TODO Challenge 5
