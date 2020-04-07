
let name = ["cat","dog","bird","dolphin"];
let translation = ["gato","perro","pájaro","delfín"];

function nextWord(){

    i = Math.floor(Math.random()*name.length);
    document.getElementById("cardText").innerHTML = name[i];

}

function translateWord(){


    document.getElementById("cardText").innerHTML = translation[i];

}




// jQuery
// espera la carga de todo el DOM (elementos) de la página
$( document ).ready(function() {
    // selector con function
    $("#cardText").click(function() {
        $("#cardText").html();
    });

});
