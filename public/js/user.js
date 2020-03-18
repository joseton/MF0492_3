
$( document ).ready(function() {

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    $("#registrespan").click(function(){
      $("#login").toggle();
      $("#registre").toggle();
      $(".results").html("");
      $("#login").trigger("reset");
      $("#registre").trigger("reset");

    });

    $("#loginspan").click(function(){
        $("#registre").toggle();
        $("#login").toggle();
        $(".results").html("");
        $("#registre").trigger("reset");
        $("#login").trigger("reset");
    });


    $("#registre").submit(function(event){
        event.preventDefault();

        $.ajax({
            // config. de datos de envío REGISTRO
            type: 'POST',
            url: 'auth/register',
            dataType: 'json',
            data: $("#registre").serialize(),
            // control de acciones en el envio y respuesta del server
            success: function(res){
                $(".results").html(res);
            },
            beforeSend: function(){
                $(".resultsreg").html("<i class='fas fa-spinner'></i>"+"<br>"+"Registrando......");
            },
            error: function(){
                $(".resultsreg").html('*Error en la comunicación con el servidor');

            }
        });


        $.ajax({
            // config. de datos de envío LOGIN
            type: 'POST',
            url: 'auth/login',
            dataType: 'json',
            data: $("#login").serialize(),
            // control de acciones en el envio y respuesta del server
            success: function(resp){
                $(".results").html(resp);
            },
            beforeSend: function(){
                $(".resultslog").html('<i class="fas fa-spinner"></i>' + "<br>" + "Logeándose......");
            },
            error: function(){
                $(".resultslog").html('*Error en la comunicación con el servidor');
            }
        });


    });
});
    // Final TODO Challenge 5
