<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad.
// Definir como métodos uno que cargue los datos personales (iniciallizar atributos)
// y otro que los imprima. Plantear una segunda clase Empleado que herede
// de la clase Persona. Añadir un atributo sueldo y los métodos de cargar el sueldo
// e imprimir su sueldo. Definir un objeto de la clase Persona y llamar a sus métodos.
// También crear un objeto de la clase Empleado y llamar a sus métodos.

class Persona{
    protected $nombre;
    protected $edad;

    public function inicializar($n, $e){
        $this->nombre = $n;
        $this->edad = $e;
    }

    public function imprimir(){
        echo "Nombre: " . $this->nombre . "<br>" . "Edad: " . $this->edad . "<br>";
    }
}
// Subclase "Empleado" que hereda de la superclase "Persona"
class Empleado extends Persona{
    public $sueldo;

    public function cargar($n, $s){ // incluyo un valor para el parámetro "nombre" definido en
      //la clase padre (Persona), para probar que la clase hija (Empleado)
      // puede utilizar el parámetro a pesar de estar protegido
        $this->nombre = $n;
        $this->sueldo = $s;
    }

    public function imprimir(){
        echo "El sueldo del empleado " . $this->nombre . " es: " . $this->sueldo . " €";
    }
}

// Creamos objetos y llamamos a sus métodos
$persona = new Persona;
$persona->inicializar("Javier", 35);
$persona->imprimir();

$empleado = new Empleado;
$empleado->cargar("Javier",3000);
$empleado->imprimir();


// Final TODO Challenge 3
