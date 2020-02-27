<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.

class Menu{

  private $nombre_enlace = array();
  private $url = array();

  public function cargar_menu($e, $u){
      $this->nombre_enlace[] = $e;
      $this->url[] = $u;
  }
  public function horizontal(){
      echo "MENU HORIZONTAL:" . "<br>" . "<br>";
      for ($i=0; $i < count($this->nombre_enlace); $i++) {
          echo '<a href="'.$this->nombre_enlace[$i].'">'.$this->url[$i].'</a>';
          echo ' | ';
      }
  }
  public function vertical(){
      echo "MENU VERTICAL:" . "<br>" . "<br>";
      for ($i=0; $i < count($this->nombre_enlace); $i++) {
          echo '<a href="'.$this->nombre_enlace[$i].'">'.$this->url[$i].'</a>';
          echo '<br>';
      }
  }

}
// Cargamos los enlaces y url's
$menu = new Menu;
$menu->cargar_menu("http://google.es", "Google");
$menu->cargar_menu("https://serveiocupacio.gencat.cat/es/soc/centres-dinnovacio-i-formacio-ocupacional-cifo/barcelona-la-violeta/", "CIFO");
$menu->cargar_menu("https://cibernarium.barcelonactiva.cat/", "Cibernarium");
//Mostrar el menu horizontal
$menu->horizontal();
//Mostrar el menu vertical
// $menu->vertical();


// Final TODO Challenge 3
