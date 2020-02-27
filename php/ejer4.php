<?php
// TODO Challenge 3: Añadir el código PHP que se indica en el ejercicio del Challenge 3

// Confeccionar una clase Menu.
// Permitir añadir como atributos el nombre del enlace y la url.
// Mostrar el menú en forma horizontal o vertical según que método llamemos.

class Menu {
    // Atributos
    private $nomenlace = [];
    private $url = [];


    // constructor
    public function Introducir($n, $u){

        array_push($this->nomenlace, $n);
        array_push($this->url, $u);
    }

    // Métodos
    public function MenuVertical(){
        // foreach ($this->nomenlance as $value1) {
        //     foreach ($this->url as $value2) {
        //         echo '<a href='.$value2.'>'.$value1.'</a><br>';
        $j = count($this->nomenlace);
        for ($i=0; $i < $j ; $i++) {
            echo '<a href='.$this->url[$i].'>'.$this->nomenlace[$i].'</a><br>';
        }

            }

    public function MenuHorizontal(){
        // foreach ($this->nomenlance as $value1) {
        //     foreach ($this->url as $value2) {
        //         echo '<a href='.$value2.'>'.$value1.'</a><br>';
        $j = count($this->nomenlace);
        for ($i=0; $i < $j ; $i++) {
            echo '<a href='.$this->url[$i].'>'.$this->nomenlace[$i].' </a>';
        }

            }

    }


$menu1 = new Menu();

$menu1->Introducir("Pepito","http://google.es");
$menu1->Introducir("Juanito","http://google.es");
$menu1->Introducir("Menganito","http://google.es");
$menu1->Introducir("Chunguito","http://google.es");
$menu1->MenuVertical();
$menu1->MenuHorizontal();


// Final TODO Challenge 3
