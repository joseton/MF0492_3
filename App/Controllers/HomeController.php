<?php
namespace App\Controllers;
// use: va unido a los namespaces. Funciona como un require, include...
use Core\Controller;
use Core\View;
use App\Models\HomeModel;

class HomeController extends Controller{

    public function indexAction(){
        // Controller::renderView('Auth.html', [] ,true);
        View::renderTwig('Auth.html');
    }

}
