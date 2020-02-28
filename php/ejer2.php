<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// El constructor recibe como parámetros el nombre y el sueldo,
// en caso de no pasar el valor del sueldo inicializarlo con el valor 1000.
// Confeccionar otro método que imprima el nombre y el sueldo.
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle
//el sueldo y llamar a sus métodos.
class empleado{
  public $nombre;
  public $sueldo;

  public function __construct($n,$s=1000){

    $this->nombre=$n;
    $this->sueldo=$s;
  }
  public function imprimir(){

    echo "el nombre del empleado es :".$this->nombre."<br>";
    echo "su sueldo es ".$this->sueldo;

    }

}

$emp1=new empleado("mateo");
$emp2=new empleado("marta",2000);

$emp1->imprimir();
$emp2->imprimir();


// Final TODO Challenge 3
