<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.


class Menu {
  private $enlaces=array();
  private $url=array();
  public function cargarOpcion($en,$ur)
  {
    $this->enlaces[]=$en;
    $this->url[]=$ur;
  }
  public function mostrarHorizontal()
  {
    for($f=0;$f<count($this->enlaces);$f++)
    {
      echo '<a href="'.$this->enlaces[$f].'">'.$this->url[$f].'</a>';
      echo "-";
    }
  }
  public function mostrarVertical()
  {
    for($f=0;$f<count($this->enlaces);$f++)
    {
      echo '<a href="'.$this->enlaces[$f].'">'.$this->url[$f].'</a>';
      echo "<br>";
    }
  }
}

$menu1=new Menu();
$menu1->cargarOpcion('http://www.google.com','Google');
$menu1->cargarOpcion('http://www.yahoo.com','Yhahoo');
$menu1->cargarOpcion('http://www.msn.com','MSN');
$menu1->mostrarVertical();
$menu1->mostrarHorizontal();







// Final TODO Challenge 3
