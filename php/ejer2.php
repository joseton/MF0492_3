<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo. El constructor recibe como parámetros el nombre y el sueldo, en caso de no pasar el valor del sueldo inicializarlo con el valor 1000.
// Confeccionar otro método que imprima el nombre y el sueldo.
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle el sueldo y llamar a sus métodos.

class Empleado {
    // Atributos
    private $nombre;
    private $sueldo;

    // Constructor
    public function __construct($n, $s=3500){
        $this->nombre=$n;
        $this->sueldo=$s;
    }

    // Método
    public function Imprimir(){
        echo 'Hola '.$this->nombre." , su sueldo es ".$this->sueldo." Euros.<br>";
    }
}

// Creamos objeto Empleado 1
$empleado1 = new Empleado("Jose Luis",2000);
$empleado1->Imprimir();

// Creamos objeto Empleado 1
$empleado2 = new Empleado("Armand");
$empleado2->Imprimir();




// Final TODO Challenge 3
