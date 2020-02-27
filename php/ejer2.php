<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo. El constructor recibe como parámetros el nombre y el sueldo, en caso de no pasar el valor del sueldo inicializarlo con el valor 1000.
// Confeccionar otro método que imprima el nombre y el sueldo.
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle el sueldo y llamar a sus métodos.
class Empleado{
    private $nombre;
    private $sueldo;

    public function __construct($n,$s=1000){
        $this->nombre = $n;
        $this->sueldo = $s;
    }

    public function datosEmpleado(){
        echo "Nombre: ".$this->nombre."<br>";
        echo "Sueldo: ".$this->sueldo."<br><br>";
    }
}

$emp1 = new Empleado("Víctor");
$emp1->datosEmpleado();
$emp2 = new Empleado("Martín",3200);
$emp2->datosEmpleado();
// Final TODO Challenge 3
