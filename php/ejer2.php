<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Empleado, definir como atributos su nombre y sueldo. El constructor recibe como parámetros el nombre y el sueldo,
// en caso de no pasar el valor del sueldo inicializarlo con el valor 1000.
// Confeccionar otro método que imprima el nombre y el sueldo.
// Crear luego dos objetos del la clase Empleado, a uno de ellos no enviarle el sueldo y llamar a sus métodos.


class Empleado{
   //atributos
   private $nombre;
   private $sueldo;

   public function __construct($nom, $suel=1000){
       $this ->nombre =$nom;
       $this ->sueldo =$suel;

   }
   public function imprimir(){

       echo "hola ". $this->nombre. " tu sueldo es ". $this->sueldo . "<br>";
   }


   }

   $Empleado1=new Empleado ("David");
   $Empleado1->imprimir();

   $Empleado2=new Empleado("JAVIER",100);
   $Empleado2->imprimir();




// Final TODO Challenge 3
