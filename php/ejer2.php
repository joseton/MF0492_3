<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo. El constructor recibe como parámetros el nombre y el sueldo, en caso de no pasar el valor del sueldo inicializarlo con el valor 1000.
// Confeccionar otro método que imprima el nombre y el sueldo.
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle el sueldo y llamar a sus métodos.

class Empleado{
    public $nombre;
    public $sueldo;

    function __construct($n, $s=1000){
        $this->nombre = $n;
        $this->sueldo = $s;
    }

    public function imprimir_datos(){
        echo "<br>Nombre: " . $this->nombre . " / Sueldo: " .$this->sueldo;
    }

}

$empleado1 = new Empleado("Andrea", 5000);
$empleado1->imprimir_datos();

$empleado2 = new Empleado("Ainhoa");
$empleado2->imprimir_datos();

// Final TODO Challenge 3
