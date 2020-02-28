<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo. El constructor recibe como parámetros el nombre y el sueldo, en caso de no pasar el valor del sueldo inicializarlo con el valor 1000.
// Confeccionar otro método que imprima el nombre y el sueldo.
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle el sueldo y llamar a sus métodos.

class Empleado {
  private $nombre;
  private $sueldo;

  public function __construct($nom,$sue)
  {
    $this->nombre=$nom;
    $this->sueldo=$sue;
  }
  public function imprimir()
  {
if ($this->nombre="Marta"){
    echo $this->nombre;
    echo '- tiene un sueldo de -';
    echo $this->sueldo;
    echo '<br>';
    $this->sinsueldo();
    echo '<br>';
}
  }
  public function sinsueldo(){
  if  ($this->nombre="Andres"){
    echo $this->nombre;
}
  }
}
$empleado1=new Empleado('Marta',1000);
$empleado1=new Empleado('Andres',1000);
$empleado1->imprimir();
// $empleado1->sinsueldo();


// $empleado2->imprimir();


?>


// Final TODO Challenge 3
