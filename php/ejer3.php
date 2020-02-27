<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad.
// Definir como métodos uno que cargue los datos personales (iniciallizar atributos)
// y otro que los imprima. Plantear una segunda clase Empleado que herede de la clase Persona.
// Añadir un atributo sueldo y los métodos de cargar el sueldo e imprimir su sueldo.
// Definir un objeto de la clase Persona y llamar a sus métodos. También crear un objeto de la clase Empleado y llamar a sus métodos.

class Persona{
   protected $nombre;
   protected $edad;
   // creamos constructor para inicializar los atributos
       public function datos($n, $e){
           $this->nombre = $n;
           $this->edad = $e;
         }
         // metodos propios
    public function imprimir(){
        echo $this->nombre .  $this->edad ;
    }
}
class Empleado extends Persona{
    public $sueldo;

    public function cargarsueldo($s){
        $this->sueldo =$s ;
    }
    public function imprimirsueldo(){
        echo "el sueldo es". $this->sueldo ;
    }
}




$Persona= new Persona;
$Persona-> datos( "David" , 58);
$Persona->imprimir();

$Empleado= new Empleado;
$Empleado-> datos( "Luis" , 28);
$Empleado->cargarsueldo(250000);
$Empleado->imprimirsueldo();
// Final TODO Challenge 3
