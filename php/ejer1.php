<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.
class Empleado{
    private $nombre;
    private $sueldo;

    public function inicializar($n,$s){
        $this->nombre = $n;
        $this->sueldo = $s;
    }

    public function contribuyente(){
        echo "Nombre: ".$this->nombre."<br>";
        if ($this->sueldo > 3000) {
            echo "Debe pagar impuestos.<br><br>";
        } else {
            echo "NO Debe pagar impuestos.<br><br>";
        }
    }
}

$emp1 = new Empleado();
$emp1->inicializar("Víctor",1600);
$emp1->contribuyente();
$emp2 = new Empleado();
$emp2->inicializar("Martín",3200);
$emp2->contribuyente();
// Final TODO Challenge 3
