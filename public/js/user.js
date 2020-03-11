$( document ).ready(function() {

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    $("#regFormspan").click(function(){
      $("#logForm").toggle();
      $("#regForm").toggle();

    });

    $("#logFormspan").click(function(){
        $("#regForm").toggle();
        $("#logForm").toggle();

    });


    // Final TODO Challenge 5


    // $("#regForm").submit(function( event ) {
    //     var pass = $('#pass').val();
    //     var pass2 = $('#pass2').val();
    //     if(pass != pass2){
    //         event.preventDefault();
    //         $('.results').html('Las contraseñas no coinciden!');
    //     }
    // });
});
