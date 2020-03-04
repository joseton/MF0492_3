<?php

namespace Core;

class Router{

    protected $routes;
    /*
    * Constructor:
    * llama al método de buildRoutes() cada vez que se crea un objeto Router
    */
    function __construct(){
        $this->buildRoutes();
    }
    /*
    * buildRoutes(): recoge las rutas de 'routes.json'
    */
    public function buildRoutes(){
        $content = file_get_contents(dirname(__DIR__) . '/Core/Config/routes.json');
        $this->routes = json_decode($content);
        // CHECK
        // var_dump($this->routes);
    }
    /*
    * getController(): Devuelve el controlador encargado de atender la URL
    */
    public function getController($url){
        // (array)$this->routes : convierte el atributo en array
        $routesArray = (array)$this->routes;
        // CHECK
        // var_dump($routesArray);

        // elimina toda el texto de la url precedido de '/'
        $url = ltrim($url, '/');
        // Nos quedamos con el texto después de '/'
        $url = substr($url, strpos($url, '/') + 1);
        // CHECK
        // echo $url;

        // Comprueba si la 'key' del array existe: La ruta configurada en 'routes.json', con la solicitada por el usuario URL
        if(array_key_exists($url, $routesArray)){
            // Se crea una variable donde guardamos el 'string' del controlador con otro 'string' (Controller) delante
            $result = '\\App\Controllers\\' . $routesArray[$url]->controller;

            // CHECK
            // echo $result;
            // Se crea instancia del controlador pertinente y se devuelve al FrontController
            $reflector = new \ReflectionClass($result);
            return $reflector->newInstance();

        }else{
            echo 'Error 404. Ruta no encontrada';
        }
    }
    // TODO Challenge 4: Añadir el código PHP que se indica en el ejercicio del Challenge 4

    public function getAction($url){
      //echo $url;

      //controller es un indice de un array tambien $routesArray[$url]['controller']
      $routesArray = (array)$this->routes;
      $url = ltrim($url, '/');
      $url = substr($url, strpos($url, '/') + 1);
      //$result =  $routesArray[$url]->action;
      //var_dump($result);
      if(array_key_exists($url, $routesArray)){
          // Se crea una variable donde guardamos el 'string' del controlador con otro 'string' (Controller) delante
            $action=$routesArray[$url]->action;
          //  echo $action;
          if( $action == "") {
              //el caso por defecto
              $action = 'index';
            }

          //echo $result;
            return $action;
            $llamada=new HomeController;
            $llamada->$action();
      }else{
          echo 'Error 404. Ruta no encontrada';
      }
    }

    // Final TODO Challenge 4

}
