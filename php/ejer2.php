<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// El constructor recibe como parámetros el nombre y el sueldo, en caso de no pasar
// el valor del sueldo inicializarlo con el valor 1000.
// Confeccionar otro método que imprima el nombre y el sueldo.
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle el sueldo
// y llamar a sus métodos.

class Empleado{

  private $nombre;
  public $sueldo;

  public function __construct($n, $s = 1000){ // inicializo el valor de sueldo
    $this->nombre = $n;
    $this->sueldo = $s;
  }

  public function imprimir(){
    echo "EMPLEADA: " . $this->nombre . ". // SUELDO: ". $this->sueldo . " €" . "<br>";
  }
}
//Objeto 1
$Empleado1 = new Empleado("Noemí",3000);
$Empleado1->imprimir();

//Objeto 2
$Empleado2 = new Empleado("María"); // no paso valor del sueldo
$Empleado2->imprimir();

// Final TODO Challenge 3
