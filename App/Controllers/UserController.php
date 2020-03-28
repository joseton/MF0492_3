<?php
namespace App\Controllers;

// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\UserModel;

class UserController extends Controller
{

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    public function indexAction($params)
    {
        // TEST
        // var_dump($params);
        if (isset($_SESSION['email'])) {
            View::renderTwig('Home/home.html');
        } else {
            View::renderTwig('User/auth.html');
        }
    }



    public function registerAction($params)
    {
        // TEST
        // var_dump($params);
        if (isset($_POST)) {
            sleep(1);




            $email = $params['emailReg'];
            $pass = $params['passReg'];
            $pass2 =$params['pass2Reg'];

            $email = htmlspecialchars($email);
            $email = stripslashes($email);
            $email = trim($email);

            if (empty($email)) {
                echo json_encode('El campo email esta vacio');
            } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                echo json_encode('el formato de email no es correcto');
            } elseif (empty($pass)) {
                echo json_encode('el campo contraseña esta vacio');
            } elseif (empty($pass2)) {
                echo json_encode('el campo repetir la contraseña esta vacio');
            } elseif (($pass !=$pass2)) {
                echo json_encode('las contraseñasno coinciden');
            } else {
                $model =new UserModel;
                $result = $model->checkEmail($params);
                if ($result == 0) {
                    echo json_encode('El email introducido ya  existe');
                } else {
                    $result = $model->register($params);
                    if ($result == 1) {
                        echo json_encode('El email se ha registrado satisfactoriamente');
                    } else {
                        echo json_encode('Error en el registro');
                    }
                }
            }
        }
    }

    public function loginAction($params)
    {
        if (isset($_POST)) {
            sleep(1);

            $email = $params['emailLogin'];
            $pass = $params['passLogin'];
            $email = htmlspecialchars($email);
            $email = stripslashes($email);
            $email = trim($email);


            if (empty($email)) {
                echo json_encode('El campo email esta vacio');
            } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                echo json_encode('el  email no es correcto');
            } else {
                $model =new UserModel;
                $result = $model->login($params);
                if ($result) {
                    $_SESSION['emailLogin']= $email;
                    echo json_encode('el login es correcto');
                } else {
                    echo json_encode('Error en el Login');
                }
            }
        }
    }
}



    // Final TODO Challenge 5
