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

        public function registroAction($params){
            // sleep — Retrasar la ejecución
            sleep(3);
                    $email = $params['reg_email'];
                    $pass = $params['reg_pass'];
                    $repeatpass = $params['reg_r_pass'];

                        
                    // val sólo Email_______________________________________________
                    // htmlspecialchars — Convierte caracteres especiales en entidades HTML
                    $email = htmlspecialchars($email);
                    // stripslashes — Quita las barras de un string con comillas escapadas
                    $email = stripslashes($email);
                    // trim — Elimina espacio en blanco (u otro tipo de caracteres) del inicio y el final de la cadena
                    $email = trim($email);

                    // empty  — Determina si una variable está vacía
                    if(empty($email)){
                        $message = 'El email esta vacío';
                        echo json_encode ($message);



                    // filter_var — Filtra una variable con el filtro que se indique
                    // FILTER_VALIDATE_EMAIL - Valida una dirección de correo electrónico.
                    }else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                        $message = 'El email no es correcto';
                        echo json_encode ($message);

                    }else{

                        $model = new UserModel;
                        $result = $model->registrar($params);


                        if($result){
                            echo json_encode ('Registro ok');
                        }else{
                            $message = 'Error en el registro';
                            echo json_encode ($message);

                        }
                    }
                }



        }
        //
        // public function loginAction($params){
        //     echo "string login action";
        //
        //
        // }



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
