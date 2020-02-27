<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad. Definir como métodos uno que cargue los datos personales (iniciallizar atributos) y otro que los imprima. Plantear una segunda clase Empleado que herede de la clase Persona. Añadir un atributo sueldo y los métodos de cargar el sueldo e imprimir su sueldo. Definir un objeto de la clase Persona y llamar a sus métodos. También crear un objeto de la clase Empleado y llamar a sus métodos.
class Persona{
    protected $nombre;
    protected $edad;

    public function inicializar($n,$e){
        $this->nombre = $n;
        $this->edad = $e;
    }

    public function mostrarDatos(){
        echo "Nombre: ".$this->nombre."<br>";
        echo "Edad: ".$this->edad."<br>";
    }
}

class Empleado extends Persona{

    private $sueldo;

    public function cargarSueldo($s){
        $this->sueldo = $s;
    }

    public function imprimirSueldo(){
        echo "Sueldo: ".$this->sueldo."<br><br>";
    }
}

$per = new Persona();
$per->inicializar("Víctor",38);
$per->mostrarDatos();
echo "<br>";
$emp = new Empleado();
$emp->inicializar("Martín", 42);
$emp->cargarSueldo(3200);
$emp->mostrarDatos();
$emp->imprimirSueldo();
// Final TODO Challenge 3
