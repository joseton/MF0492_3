<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo.
// Definir un método inicializar que lleguen como dato el nombre y sueldo.
// Plantear un segundo método que imprima el nombre y un mensaje si debe o no pagar impuestos (si el sueldo supera a 3000 paga impuestos)
// Crear luego dos objetos del la clase Empleado y llamar a sus métodos.

class Empleado {

            public $nombre;
            public $sueldo;


            public function inicializar($no, $su){
                $this->nombre=$no;
                $this->sueldo=$su;
            }


            public function debepagar_ono(){
                if ($this->sueldo > 3000){
                    echo $this->nombre.", sí tienes que pagar impuestos";
                } else {
                    echo $this->nombre. ", no tienes que pagar impuestos😎";
                }

            }

}


$Empl = new Empleado;
$Empl->inicializar("Juan", 1500);
$Empl->debepagar_ono();

// Final TODO Challenge 3
