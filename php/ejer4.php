<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.

class Menu {
  private $link=array();
  private $marcas=array();
  public function cargarOpcion($li,$mar)
  {
    $this->link[]=$li;
    $this->marcas[]=$mar;
  }
  private function mostrarHorizontal()
  {
    for($f=0;$f<count($this->link);$f++)
    {
      echo '<a href="'.$this->link[$f].'">'.$this->marcas[$f].'</a>';
      echo "-";
    }
  }
  private function mostrarVertical()
  {
    for($f=0;$f<count($this->link);$f++)
    {
      echo '<a href="'.$this->link[$f].'">'.$this->marcas[$f].'</a>';
      echo "<br>";
    }
  }

  public function mostrar($posicion)
  {
    if ($posicion=="horizontal")
      $this->mostrarHorizontal();
    if ($posicion=="vertical")
      $this->mostrarVertical();
  }
}

$menu1=new Menu();
$menu1->cargarOpcion('https://www.seat.es/','SEAT');
$menu1->cargarOpcion('https://www.renault.es/','RENAULT');
$menu1->cargarOpcion('https://www.audi.es/es/web/es.html','AUDI');
$menu1->mostrar("horizontal");
echo '<br>';
$menu2=new Menu();
$menu2->cargarOpcion('https://www.yamaha-motor.eu/es/es/','YAMAHA');
$menu2->cargarOpcion('https://www.honda.es/','HONDA');
$menu2->cargarOpcion('http://www.suzuki.es/','SUZUKI');
$menu2->mostrar("vertical");
?>



// Final TODO Challenge 3
