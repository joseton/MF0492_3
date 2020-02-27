<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo. El constructor recibe como parámetros el nombre y el sueldo, en caso de no pasar el valor del sueldo inicializarlo con el valor 1000.

class Empleado{
    // atributos
    public $nombre;
    public $sueldo;

    // creamos constructor para inicializar los atributos
    public function __construct($n,$s=1000){
        $this->nombre = $n;
        $this->sueldo = $s;

    }

// Confeccionar otro método que imprima el nombre y el sueldo.

public function imprimir(){

    echo "El nombre del Empleado es: ".$this->nombre."<br>";
    echo "El sueldo del Empleado es: ".$this->sueldo."<br>";
}
}
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle el sueldo y llamar a sus métodos.

$empleado1 = new Empleado("Bernat",3500);
$empleado1 -> imprimir();

$empleado2 = new Empleado("Joan");
$empleado2 -> imprimir();





// Final TODO Challenge 3
