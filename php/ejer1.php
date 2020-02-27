<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar
// impuestos (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.

class Empleado{

  private $nombre;
  public $sueldo;

  public function inicializar($n,$s){
    $this->nombre = $n;
    $this->sueldo = $s;
    // echo $this->nombre . " ". $this->sueldo . "<br>"; // echo para probar esta función
  }

  public function imprimir(){
    if ($this->sueldo > 3000) {
      echo $this->nombre . " : Dado que tu sueldo supera los 3.000 €, debes pagar impuestos." . "<br>";
    }else{
      echo $this->nombre . " : No debes pagar impuestos." . "<br>";
    }

  }
}
//Objeto 1
$Empleado1 = new Empleado;
$Empleado1->inicializar("Bruna",3100); //probando método inicializar
$Empleado1->imprimir(); //probando método 2

//Objeto 2
$Empleado2 = new Empleado;
$Empleado2->inicializar("Javier",2500); //probando método inicializar
$Empleado2->imprimir(); //probando método 2

// Final TODO Challenge 3
