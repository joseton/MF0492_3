<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad. Definir como métodos uno que cargue los datos personales (iniciallizar atributos) y otro que los imprima. Plantear una segunda clase Empleado que herede de la clase Persona. Añadir un atributo sueldo y los métodos de cargar el sueldo e imprimir su sueldo. Definir un objeto de la clase Persona y llamar a sus métodos. También crear un objeto de la clase Empleado y llamar a sus métodos.

class Persona{
    public $nombre;
    public $edad;

    public function datos_pers($n, $e){
        $this->nombre = $n;
        $this->edad = $e;
    }

    public function imprimir(){
        echo $this->nombre . " tiene " . $this->edad . " años.<br>";
    }
}

class Empleado extends Persona{
    public $sueldo;

    public function cargar_sueldo($s){
        $this->sueldo = $s;
    }

    public function imprimir_sueldo(){
        echo "El sueldo es de " . $this->sueldo;
    }
}



$persona1 = new Persona;
$persona1->datos_pers("Luis", 25);
$persona1->imprimir();

$empleado1 = new Empleado;
$empleado1->datos_pers("Virginia", 27);
$empleado1->cargar_sueldo(15000);
$empleado1->imprimir();
$empleado1->imprimir_sueldo();
// Final TODO Challenge 3
