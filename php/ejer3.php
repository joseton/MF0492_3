<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del
//Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad.
// Definir como métodos uno que cargue los datos personales
// (iniciallizar atributos) y otro que los imprima. Plantear una segunda clase
// Empleado que herede de la clase Persona. Añadir un atributo sueldo
//y los métodos de cargar el sueldo e imprimir su sueldo.
// Definir un objeto de la clase Persona y llamar a sus métodos.
// También crear un objeto de la clase Empleado y llamar a sus métodos.
class persona{
  protected $nombre;
  protected $edad;

//  public function __construct($n,$e){
    public function inicializar($n,$e){
    $this->nombre=$n;
    $this->edad=$e;
  }
  public function imprimir(){

    echo "el nombre del empleado es :".$this->nombre."<br>";
    echo "su edad es ".$this->edad;

    }

}
class empleado extends persona{
    public $sueldo;
    public $pers;
    public function cargar($n,$e,$s){
      $this->pers=new persona;
      $this->pers->inicializar($n,$e);
      $this->sueldo=$s;
    }
    public function imprimir(){
      echo "el nombre es ".$this->pers->nombre."<br>";
      echo "su edad es ".$this->pers->edad."<br>";
      echo "su sueldo es ".$this->sueldo."<br>";
    }
 }
$pers2 = new persona("mar",22);
$pers2->imprimir();
//cuando se crea un empleado directamente crea internamente un nuevo objeto
//de la classe persona
$worker1=new empleado;
$worker1->cargar("manoir",38,3000);
 $worker1->imprimir();
// Final TODO Challenge 3
