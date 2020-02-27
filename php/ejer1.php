<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.

class Empleado{
   //atributos
   private $nombre;
   private $sueldo;


public function inicializar($n,$s){
    $this->nombre=$n;
    $this->sueldo=$s;
    echo "hola ". $this->nombre. " tu sueldo es ". $this->sueldo . "<br>";
}
public function imprimir(){
    if ($this->sueldo >3000){
        echo " has de pagar a hacienda " . "<br>";
    }else {
        echo " no has de pgar a hacienda";
    }

}
}
$Empleado1=new Empleado;
$Empleado1->inicializar("Jose",5000);
$Empleado1->imprimir();

$Empleado2=new Empleado;
$Empleado2->inicializar("JAVIER",100);
$Empleado2->imprimir();




// Final TODO Challenge 3
