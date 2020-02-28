<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.


class Empleado {
  private $nombre;
  private $sueldo;
  public function inicializar($nom,$sue)
  {
    $this->nombre=$nom;
    $this->sueldo=$sue;
  }
  public function pagaImpuestos()
  {
    echo $this->nombre;
    echo '---';
    if ($this->sueldo>3000)
      echo 'Debe pagar impuestos';
    else
      echo 'No paga impuestos';
    echo '<br>';
  }
}

$empleado1=new Empleado();
$empleado1->inicializar('Andres',2500);
$empleado1->pagaImpuestos();
$empleado1=new Empleado();
$empleado1->inicializar('Marta',4300);
$empleado1->pagaImpuestos();
?>


// Final TODO Challenge 3
