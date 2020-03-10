<?php
// datos para la conexión a la DB
require 'database.php';
// PDO
try {
    $conn = new PDO("mysql:host=$server;dbname=$dbname",$username,$password);
    // set the PDO error mode to Exception
    // setAttribute: añade este atributo a la conexión PDO y utilizamos el manejador de error para visualizar dicho error
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo 'Conexión satisfactoria<br>';

    $sql = "select * from usuarios where id = :id";
    // Recomendable para mejorar el rendimiento de la ejecución de consultas y evitar inyección de código SQL
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $id);
    // datos de usuarios
    $id = 1;
    // Si la sentencia se ha ejecutado correctamente..
    if($stmt->execute()){
        // leer el resultado
        // fetchAll(): devuelve la matriz(array) de la lectura del 'select' en index asociativo y numerico
        // $result = $stmt->fetchAll();
        // var_dump($result);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        // var_dump($result);
        foreach ($result as $key => $value) {
            echo $key . " = " . $value . "<br>";
        }

    }else{ //sino..
        die('La consulta a la DB NO se ha ejecutado correctamente');
    }

} catch (PDOException $err) {
    echo 'Conexión fallida: ' . $err->getMessage();
    $conn = null; //cerrando la conexión
}
