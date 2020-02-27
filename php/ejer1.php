<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
<?php
class Empleado{
    // atributos
    private $nombre;
    private $sueldo;

// Definir un método inicializar que lleguen como dato el nombre y sueldo.

public function incializar($n,$s) {

    $this->nombre = $n;
    $this->sueldo = $s;

}

// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)

public function imprimir(){
    if ($this->$sueldo => 3000) {
        echo "Debido a su retribución debera pagar impuestos"
        // code...
    }
}

// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.

$empleado1 = new empleado;
$empleado1 ->inicializar("Bernat", 3500)


// Final TODO Challenge 3
