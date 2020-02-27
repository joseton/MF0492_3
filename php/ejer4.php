<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.
class Menu{
    private $titulos = array();
    private $links = array();

    public function cargarOpcion($t, $l){
        $this->titulos[] = $t;
        $this->links[] = $l;
    }

    public function horizontal(){
        for ($i=0; $i < count($this->links); $i++) {
            if ($i != 0){
                echo ' - ';
            }
            echo '<a href="'.$this->links[$i].'">'.$this->titulos[$i].'</a>';
        }
    }

    public function verticall(){
        echo '<ul style="list-style-type: none">';
        for ($i=0; $i < count($this->links); $i++) {
            echo '<li><a href="'.$this->links[$i].'">'.$this->titulos[$i].'</a></li>';
        }
        echo '</ul>';
    }

    public function verticalt(){
        echo '<table>';
        for ($i=0; $i < count($this->links); $i++) {
            echo '<tr><td><a href="'.$this->links[$i].'">'.$this->titulos[$i].'</a></td></tr>';
        }
        echo '</table>';
    }
}

$menu = new Menu;
$menu->cargarOpcion("Google", "http://google.es");
$menu->cargarOpcion("Facebook", "http://facebook.com");
$menu->cargarOpcion("Stack Overflow", "https://stackoverflow.com/");
$menu->cargarOpcion("Infojobs", "http://infojobs.net");
$menu->horizontal();
// no sé si ho prefereixes com ul o com taula, així que...
$menu->verticall();
$menu->verticalt();
// Final TODO Challenge 3
