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


    public function indexAction(){
    View::renderTwig('User/Auth.html');
}


public function registerAction($params){
    sleep(1);
    $email = $params['email'];
    $pass = $params['pass'];
    $pass2 = $params['pass2'];

    $email = htmlspecialchars($email);
    $email = stripslashes($email);
    $email = trim($email);

    if(empty($email)){
        $message = 'El email esta vacío';
        echo json_encode($message);

    }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        $message = 'El email no es correcto';
        echo json_encode($message);

    }else if (empty($pass)){
        $message = 'La contraseña esta vacía';
        echo json_encode($message);

    }else if (empty($pass2)){
        $message = 'La validación de contraseña esta vacía';
        echo json_encode($message);

    }else if ($pass!=$pass2){
        $message = 'Las contraseñas no coinciden';
        echo json_encode($message);
        
    }else{
        $model = new UserModel;
        $result = $model->registrar($params);

        switch ($result) {
            case 0:
                $message = 'El email ya está registrado';
                echo json_encode($message);
                break;
            case 1:
                $message = "Registro ok";
                echo json_encode($message);
                break;
            case 2:
                $message = "Error en el registro";
                echo json_encode($message);
                break;
        }
    }
}


public function loginAction($params){
    sleep(1);
    $email = $params['email'];
    $pass = $params['pass'];

    $email = htmlspecialchars($email);
    $email = stripslashes($email);
    $email = trim($email);

    if(empty($email)){
        $message = 'El email esta vacío';
        echo json_encode($message);
    }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
        $message = 'El email no es correcto';
        echo json_encode($message);
    }else if(empty($pass)){
        $message = 'La contraseña esta vacía';
        echo json_encode($message);
    }else{
        $model = new UserModel;
        $result = $model->login($params);

        if($result){
            $message = "login ok";
            echo json_encode($message);
        }else{
            $message = "login error";
            echo json_encode($message);
        }
    }
}

}
