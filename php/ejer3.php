<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad.

class Persona{
    // atributos
    public $nombre;
    protected $edad;

    //Definir como métodos uno que cargue los datos personales (iniciallizar atributos) y otro que los imprima.

    public function inicializar($n,$e) {

        $this->nombre = $n;
        $this->edad = $e;

    }

    public function imprimir(){

        echo "El nombre del Empleado es: ".$this->nombre."<br>";
        echo "Su edad es de: ".$this->edad."<br>";

    }
}

//Plantear una segunda clase Empleado que herede de la clase Persona. Añadir un atributo sueldo y los métodos de cargar el sueldo e imprimir su sueldo.

class Empleado extends Persona{

    public $sueldo;

    public function cargar($s){

        $this->sueldo = $s;

    }


    public function visualizar(){
        echo "Nombre ".$this->nombre."<br>";
        echo "Edad ".$this->edad."<br>";
        echo "Sueldo ".$this->sueldo."<br>";
    }

}

//Definir un objeto de la clase Persona y llamar a sus métodos. También crear un objeto de la clase Empleado y llamar a sus métodos.



$persona1 = new Persona;
$persona1->inicializar("Jose",28);
$persona1->imprimir();

$empleado1 = new Empleado;
$empleado1->inicializar("JoseLuis",48);
$empleado1->cargar(2550);
$empleado1->visualizar();






// Final TODO Challenge 3
