<?php
// Carga del sistema de Autoloading
// autoload.php: Carga a través del composer todas las clases necesarias de 'requires' ó 'includes' para poder instanciar desde otro archivo
// pendiente
// require dirname(__DIR__) . '/vendor/autoload.php';

// Activación del reporte de todos los errores y mensajes informativos
error_reporting(E_ALL);
// pendiente
// Error and Exceptions Handling

// Se define la constante 'CONFIG_DIR'
// Contiene la ruta hacia la carpeta de archivos de configuración
define('CONFIG_DIR', dirname(__DIR__) . '/Core/Config');
// CHECK
// echo CONFIG_DIR;

// Se prepara una entrada en "$_GLOBALS['config']" para almacenar la configuración general de la app
$_GLOBALS['config'] = array();
// opendir: crea un recurso que accede a la carpeta que apunta por medio de CONFIG_DIR
$dh = opendir(CONFIG_DIR);
// lee el contenido de los archivos "JSON" dentro de "CONFIG_DIR" mientras el recurso ó la lectura NO devuelva "FALSE"
while (FALSE !== ($file = readdir($dh))) {
    // para evitar los archivos ocultos './../'
    if($file != '.' && $file != '..'){
        // CHECK
        // echo $file;
        $file_name = pathinfo(CONFIG_DIR . $file . PATHINFO_FILENAME);

        $file_ext = pathinfo(CONFIG_DIR . $file . PATHINFO_EXTENSION);



        $config_key = preg_replace("/[^\w]/","",$file_name);
        var_dump($file_name);
        var_dump($file_ext);
    }
}
