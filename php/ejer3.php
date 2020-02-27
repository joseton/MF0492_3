<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad. Definir como métodos uno que cargue los datos personales (iniciallizar atributos) y otro que los imprima. Plantear una segunda clase Empleado que herede de la clase Persona. Añadir un atributo sueldo y los métodos de cargar el sueldo e imprimir su sueldo. Definir un objeto de la clase Persona y llamar a sus métodos. También crear un objeto de la clase Empleado y llamar a sus métodos.

class Persona{

    public $nombre;
    public $edad;

    public function datospersonales($no, $ed){
        $this->nombre=$no;
        $this->edad=$ed;
    }

    public function imprimedatos(){
        echo "El nombre es,".$this->nombre." y su edad es, $this->edad"."</br>"."</br>";

    }
}


class Empleado extends Persona{

    public $sueldo;

    public function cargarelsueldo($su){
        $this->sueldo=$su;

    }

    public function imprimirsusueldo(){
        echo " y su sueldo es".$this->sueldo;

    }
}

$Pers = new Persona;
$Pers->datospersonales("Juan", 30);
$Pers->imprimedatos();

$Empl = new Empleado;
$Empl->datospersonales("Marcos", 50);
$Empl->imprimedatos();
$Empl->cargarelsueldo(11000);
$Empl->imprimirsusueldo();

// Final TODO Challenge 3
