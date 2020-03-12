
$( document ).ready(function() {

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    $("#registrespan").click(function(){
      $("#login").toggle();
      $("#registre").toggle();

    });

    $("#loginspan").click(function(){
        $("#registre").toggle();
        $("#login").toggle();
    });



    $("#registre").submit(function(event){
        event.preventDefault();

        $.ajax({
            // config. de datos de envío
            type: 'post',
            url: 'auth/register',
            dataType: 'json',
            data: $("#registre").serialize(),
            // control de acciones en el envio y respuesta del server
            success: function(res){
                $(".results").html(res);
            },
            beforeSend: function(){
                $(".results").html('<i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>' + "<br>" + "Registrando...");
            },
            error: function(){
                $(".results").html('*Error en la comunicación con el servidor');
            }
        });

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
