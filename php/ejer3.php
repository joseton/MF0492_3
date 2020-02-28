<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad. Definir como métodos uno que cargue los datos personales (iniciallizar atributos) y otro que los imprima. Plantear una segunda clase Empleado que herede de la clase Persona. Añadir un atributo sueldo y los métodos de cargar el sueldo e imprimir su sueldo. Definir un objeto de la clase Persona y llamar a sus métodos. También crear un objeto de la clase Empleado y llamar a sus métodos.

class Persona {
  private $nombre;
  private $edad;
  public function cargarDatosPersonales($nom,$ed)
    {
      $this->nombre=$nom;
      $this->edad=$ed;
    }
    public function imprimirDatosPersonales()
    {
      echo 'Nombre:'.$this->nombre.'<br>';
      echo 'Edad:'.$this->edad.'<br>';
    }
  }

  class Empleado extends Persona{
    protected $sueldo;
    public function cargarSueldo($su)
    {
      $this->sueldo=$su;
    }
    public function imprimirSueldo()
    {
      echo 'Sueldo:'.$this->sueldo.'<br>';
    }
  }

  $persona1=new Persona();
  $persona1->cargarDatosPersonales('Benitez Lucas',28);
  echo 'Datos personales de la persona:<br>';
  $persona1->imprimirDatosPersonales();
  $empleado1=New Empleado();
  $empleado1->cargarDatosPersonales('Martinez Sara',38);
  $empleado1->cargarSueldo(3400);
  echo 'Datos personales y sueldo del empleado:<br>';
  $empleado1->imprimirDatosPersonales();
  $empleado1->imprimirSueldo();
  ?>

// Final TODO Challenge 3
