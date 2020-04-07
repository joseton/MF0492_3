<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\HomeModel;

class HomeController extends Controller{

    public function indexAction(){
        if(isset($_SESSION['email'])){View::renderTwig('Body/main_menu.html');
        }else{View::renderTwig('Home/home.html');}
    }


}
