<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad. Definir como métodos uno que cargue los datos personales (iniciallizar atributos) y otro que los imprima. Plantear una segunda clase Empleado que herede de la clase Persona. Añadir un atributo sueldo y los métodos de cargar el sueldo e imprimir su sueldo. Definir un objeto de la clase Persona y llamar a sus métodos. También crear un objeto de la clase Empleado y llamar a sus métodos.

class Persona{

  public $nombre;
  public $edad;

  public function inicializar($n,$e){
    $this-> nombre = $n;
    $this-> edad = $e;
  }

  public function imprimir(){
    echo "<br>Nombre: ".$this-> nombre;
    echo "<br>Edad: ".$this-> edad;
  }
}

class Empleado extends Persona{

  public $sueldo;

  public function cargar($s){
    $this-> sueldo = $s;
  }

  public function impr_sueldo(){
    echo "<br>Salario: ".$this-> sueldo." euros";
  }

}

$Pers1 = new Persona;
$Pers1 -> nombre = "Rigoberto";
$Pers1 -> edad = 30;
$Pers1 -> imprimir();

echo "<br>---------------<br>";

$Pers2 = new Empleado;
$Pers2 -> nombre = "Filomena";
$Pers2 -> edad = 22;
$Pers2 -> sueldo = 30000;
$Pers2 -> imprimir();
$Pers2 -> impr_sueldo();

// Final TODO Challenge 3
