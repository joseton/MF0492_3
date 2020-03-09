<?php

namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use App\Models\HomeModel;

class HomeController extends Controller{

    public function indexAction(){
        Controller::renderView('Home/home.html');
    }
    public function conexionDBAction(){
        $model = new HomeModel;
    }

}
