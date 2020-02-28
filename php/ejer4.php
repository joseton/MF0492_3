<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del
//Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.
class Menu{
  private $enlaces = array();
  private $titulos = array();
  // métodos
  public function cargarOpcion($en, $tit){
      $this->enlaces[] = $en;
      $this->titulos[] = $tit;
  }
  public function mostrar_hor(){
      for ($i=0; $i < count($this->enlaces); $i++) {
          echo '<a href="'.$this->enlaces[$i].'">'.$this->titulos[$i].'</a>';
          echo '-';
      }
  }

  public function mostrar_ver(){
      for ($i=0; $i < count($this->enlaces); $i++) {
          echo '<a href="'.$this->enlaces[$i].'">'.$this->titulos[$i].'</a>';
          echo '<br>';
      }
  }
  // public function pintar_horizontal(){
  //
  // }
  // public function pintar_vertical(){
  //
  // }
}
$menu1 = new Menu;
$menu1->cargarOpcion("http://google.es", "Google");
$menu1->cargarOpcion("http://google.es", "Google1");
$menu1->cargarOpcion("http://google.es", "Google2");
$menu1->cargarOpcion("http://google.es", "Google3");
$menu1->mostrar_hor();
echo "<br><br><br>";
$menu1->mostrar_ver();





// Final TODO Challenge 3
