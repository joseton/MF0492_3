<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.

class Empleado{
    public $nombre;
    public $sueldo;

    public function datos_empleado ($n, $s){
        $this->nombre = $n;
        $this->sueldo = $s;
    }

    public function imprimir_datos(){
        if ($this->sueldo < 3000){
            echo "Empleado: " .$this->nombre . " no debe pagar impuestos.";
        }else{
            echo "Empleado: " .$this->nombre . " si debe pagar impuestos.";
        }
    }

}

$nuevo_empleado = new Empleado;
$nuevo_empleado->datos_empleado("Luis", 5000);
$nuevo_empleado->imprimir_datos();

// Final TODO Challenge 3
