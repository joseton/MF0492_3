<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad. Definir como métodos uno que cargue los datos personales (iniciallizar atributos) y otro que los imprima. Plantear una segunda clase Empleado que herede de la clase Persona. Añadir un atributo sueldo y los métodos de cargar el sueldo e imprimir su sueldo. Definir un objeto de la clase Persona y llamar a sus métodos. También crear un objeto de la clase Empleado y llamar a sus métodos.

class Persona {
    // Atributos
    protected $nombre;
    protected $edad;


    // Métodos
    public function Cargar($n, $e){
        $this->nombre = $n;
        $this->edad = $e;
    }

    public function ImprimirDatos(){
        echo $this->nombre.", ".$this->edad." años. <br>";
    }

}

class Empleado extends Persona{
    //atributos
    private $sueldo;


    //métodos
    public function CargarSueldo($s){
        $this->sueldo = $s;
    }

    public function ImprimirSueldo(){
        echo $this->nombre.", ".$this->edad." años . Tiene un sueldo de ".$this->sueldo." Euros";
    }

}

//Creamos objeto persona y llamamos a sus métodos
$persona1 = new Persona();

$persona1->Cargar("Jose Luis",36);
$persona1->ImprimirDatos();


//Creamos objeto Empleado y llamamos métodos padre y suyo
$empleado1 = new Empleado();
$empleado1->Cargar("Jose Luis",36);
$empleado1->CargarSueldo(3500);
$empleado1->ImprimirSueldo();



// Final TODO Challenge 3
