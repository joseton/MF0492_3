<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.

// Confeccionar una clase Persona que tenga como atributos el nombre y la edad.


class Menu{
    public $link=array();
    public $url=array();


    function agregar_item($l, $u){
        $this->link[]=$l;
        $this->url[]=$u;
    }

    function imprimir_horizontal(){
        for ($i=0; $i < count($this->link) ; $i++) {
            echo '<a href="' . $this->url[$i] . '">' . $this->link[$i] .'</a>   /  ';
        }

    }

    function imprimir_vertical(){
            echo "<br><br>";
        for ($i=0; $i < count($this->link) ; $i++) {
            echo '<a href="' . $this->url[$i] . '">' . $this->link[$i] .'</a> <br>';
        }

    }
}

$menu1 = new Menu();
$menu1->agregar_item("w3 w3schools", "https://www.w3schools.com/");
$menu1->agregar_item("mozilla", "https://developer.mozilla.org/en-US/");
$menu1->imprimir_horizontal();

$menu1->imprimir_vertical();

// Final TODO Challenge 3
