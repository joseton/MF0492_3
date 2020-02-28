<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.

class Menu{
    public $link=array();
    public $url=array();


    function agregar_item($l, $u){
        $this->link[]=$l;
        $this->url[]=$u;
    }

    function impr_horizontal(){
        for ($i=0; $i < count($this->link) ; $i++) {
            echo '<a href="' . $this->url[$i] . '">' . $this->link[$i] .'</a>   |  ';
        }

    }

    function impr_vertical(){
            echo "<br><br>";
        for ($i=0; $i < count($this->link) ; $i++) {
            echo '<a href="' . $this->url[$i] . '">' . $this->link[$i] .'</a> <br>';
        }

    }
}

$menu1 = new Menu();

$menu1->agregar_item("Exercici 1", "http://localhost/MF0492_3/php/ejer1.php");
$menu1->agregar_item("Exercici 2", "http://localhost/MF0492_3/php/ejer2.php");
$menu1->agregar_item("Exercici 3", "http://localhost/MF0492_3/php/ejer3.php");

$menu1->impr_horizontal();

$menu1->impr_vertical();




// Final TODO Challenge 3
