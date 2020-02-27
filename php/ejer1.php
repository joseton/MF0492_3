<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.

class Empleado{
    // atributos
    public $nombre;
    public $sueldo;

// Definir un método inicializar que lleguen como dato el nombre y sueldo.

public function inicializar($n,$s) {

    $this->nombre = $n;
    $this->sueldo = $s;

}

// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)

public function imprimir(){
    if ($this->sueldo > 3000) {
        echo "Debido a su retribución debera pagar impuestos";
        // code...
    }
    else{
        echo "No debe pagar impuestos";
    }
}

}
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.

$empleado1 = new Empleado();
$empleado1 -> inicializar("Bernat",3500);
$empleado1 -> imprimir();
/*
$empleado2 = new empleado("Juan",2350);
$empleado2 ->inicializar();
$empleado2 -> imprimir();*/


// Final TODO Challenge 3
