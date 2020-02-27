<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.

class Empleado {
    // Atributos
    private $nombre;
    private $sueldo;


    // Métodos
    public function Inicializar($n, $s){
        $this->nombre = $n;
        $this->sueldo = $s;

        }


    public function Imprimir(){
        echo 'Hola '.$this->nombre." . " ;
        if ($this->sueldo > 3000){
            echo "Debe de pagar impuestos.";
        }
    }
}
// Creamos primer objeto y sus llamadas
$empleado1 = new Empleado();

$empleado1->Inicializar("Jose Luis",2500);
$empleado1->Imprimir();

// Creamos segundo objeto y sus llamadas
$empleado2 = new Empleado();
$empleado2->Inicializar("Armand",3500);
$empleado2->Imprimir();


// Final TODO Challenge 3
