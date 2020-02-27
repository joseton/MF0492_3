<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.

class Menu {

    private $nombreenlace = array();
    private $enlaces = array();



    public function cargarOpcion($en,$nom)
    {
        $this->enlaces[]=$en;
        $this->nombreenlace[]=$nom;
    }


    public function mostrarHorizontal()
    {
        for($i=0;  $i<count($this->enlaces);  $i++)
        {
            echo '<a href="'.$this->enlaces[$i].'">'.$this->nombreenlace[$i].'</a>';
            echo "-";
        }
    }


    public function mostrarVertical()
    {
        for($j=0;  $j<count($this->enlaces);  $j++)
        {
            echo '<a href="'.$this->enlaces[$j].'">'.$this->nombreenlace[$j].'</a>';
            echo "<br>";
        }
    }
}

$menu1=new Menu();

$menu1->cargarOpcion('http://www.google.es','Google');
$menu1->cargarOpcion('http://www.yahoo.es','Yahoo');
$menu1->cargarOpcion('http://www.outlook.com','Outlook');


$menu1->mostrarVertical();
echo "<br>"."<br>";
$menu1->mostrarHorizontal();

// Final TODO Challenge 3
