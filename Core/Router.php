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
        // (array)$this->routes : convierte el atributo en array
        $routesArray = (array)$this->routes;
        // CHECK
        // var_dump($routesArray);

        // elimina toda el texto de la url precedido de '/'
        $url = ltrim($url, '/');
        // Nos quedamos con el texto después de '/'
        $url = substr($url, strpos($url, '/') + 1);

        return $routesArray[$url]->action;

    // Final TODO Challenge 4

    }

}

// #Challenge4: Desarrollar el método 'getAction' en el 'Router' que d…



/*
- Este método se llama desde el 'FrontController', recoge la URL del request  y comprueba la acción (método) asignada en 'routes.json.
- Si no existe acción (null) en 'routes.json', carga por defecto el método 'index' del controlador 'HomeController'.

- 'HomeController':
    - Añadir un método 'challenge4' que contiene un 'echo' con el siguiente texto: "Soy el Home Controller con acción (challenge4)"

- 'routes.json':
    - Añadir la ruta "home/challenge4". que cargará el controlador 'HomeController' y la acción 'challenge4'

- COMPROBAR con 'CHECK' la carga de los 'echo' en el 'FrontController'*/
