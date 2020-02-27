<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo. El constructor recibe como parámetros el nombre y el sueldo, en caso de no pasar el valor del sueldo inicializarlo con el valor 1000.
// Confeccionar otro método que imprima el nombre y el sueldo.
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle el sueldo y llamar a sus métodos.

class Empleado {

        public $nombre;
        public $sueldo;


        public function __construct($no, $su=1000){
            $this->nombre=$no;
            $this->sueldo=$su;

        }

        public function imprime(){
            echo "El Sr./Sra. ".$this->nombre. " tiene un sueldo de ". $this->sueldo. "</br>";

        }

}

$Empl = new Empleado("Jesus");
$Empl->imprime();


$Empl2 = new Empleado("David", 1000000);
$Empl2->imprime();




// Final TODO Challenge 3
