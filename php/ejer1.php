<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.

class Empleado{

  public $nombre;
  private $sueldo;

  public function inicializar($n,$s){
    $this->nombre = $n;
    $this->sueldo = $s;
  }

  public function este_es_su_sueldo($sou){
    $this->sueldo = $sou;
  }

  public function imponible(){
    if($this->sueldo>3000){
      echo $this->nombre.", tienes que pagar impuesto por ser tu sueldo superior a 3.000 euros <br>";
    }else{
      echo $this->nombre.", no tienes que pagar impuesto por ser tu sueldo inferior a 3.000 euros <br>";
    };
  }
};
$pers1 = new Empleado;
$pers1->nombre = "Alberto";
$pers1-> este_es_su_sueldo(1500);
$pers1-> imponible();

$pers2 = new Empleado;
$pers2->nombre = "Rosa";
$pers2-> este_es_su_sueldo(3500);
$pers2-> imponible();




// Final TODO Challenge 3
