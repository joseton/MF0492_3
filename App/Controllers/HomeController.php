<?php

namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;

class HomeController extends Controller{

    public function indexAction(){
        View::renderTwig('Home/home.html');
    }

}
