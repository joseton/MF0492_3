<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio
// del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre
//y un mensaje si debe o no pagar impuestos
// (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.
class empleado{
  public $nombre;
  public $sueldo;

  public function inicializar($n,$s){

    $this->nombre=$n;
    $this->sueldo=$s;
  }
  public function imprimir(){

    echo "el nombre del empleado es :".$this->nombre."<br>";
    if($this->sueldo < 3000){
        echo "y no le toca pagar impuestos";

    }
    else{

      echo "y le toca pagar impuestos";

    }
  }
}

$empleado1=new empleado;
$empleado1->inicializar("lara",2000);
$empleado1->imprimir();
$empleado2->new empleado();
$empleado2->inicializar("rafa",3550);
$empleado2->imprimir();
// Final TODO Challenge 3
