<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.
class Menu{
    public $nombre=array();
    public $url=array();

    function agregar_item($m, $u){
        $this->nombre[]=$m;
        $this->url[]=$u;
    }

    function imprimir_horizontal(){
        for ($i=0; $i < count($this->nombre) ; $i++) {
            echo '<a href="' . $this->url[$i] . '">' . $this->nombre[$i] .'</a>   |  ';
        }
    }

    function imprimir_vertical(){
        echo "<br><ul>";
        for ($i=0; $i < count($this->nombre) ; $i++) {
            echo '<li style="list-style-type: none;"><a href="' . $this->url[$i] . '">' . $this->nombre[$i] .'</a> </li>';
        }
        echo "</ul>";
    }

}

$menu1 = new Menu();
$menu1->agregar_item("Google", "http://www.google.es");
$menu1->agregar_item("Yahoo", "https://es.yahoo.com");
$menu1->agregar_item("DuckDuckGo", "https://duckduckgo.com/");
$menu1->imprimir_horizontal();

$menu1->imprimir_vertical();


// Final TODO Challenge 3
