$( document ).ready(function() {

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
    $(".click_aqui").click(function(){
      $("#regForm").toggle();
      $("#logForm").toggle();
    });

    $("#regForm").submit(function(event) {

        $.ajax({
            type: 'POST',
            url: ' auth/register',
            dataType: 'json',
            data: $("#regForm").serialize(),
            // control de acciones en el envio y respuesta del server
            success: function(dataResp){
                $(".results").html(dataResp);
            },
            beforeSend: function(){
                $(".results").html('Registrando...');
            },
            error: function(){
                $(".results").html('Error en la comunicación con el servidor');
            }
        });
        event.preventDefault();
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
