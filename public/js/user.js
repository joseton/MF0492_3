$(document).ready(function() {

    $("#fr").click(function() {
        $("#formAcceso").toggle();
        $("#formRegistro").toggle();
        $(".mensajePantalla").html("");
        $("#formAcceso").trigger("reset");
        $("#formRegistro").trigger("reset");
    })

    $("#fa").click(function() {
        $("#formRegistro").toggle();
        $("#formAcceso").toggle();
        $(".mensajePantalla").html("");
        $("#formAcceso").trigger("reset");
        $("#formRegistro").trigger("reset");
    })


    $("#formRegistro").submit(function(event) {
        event.preventDefault();
        $.ajax({
            // config. de datos de envío
            type: 'post',
            url: 'auth/register',
            dataType: 'json',
            data: $("#formRegistro").serialize(),
            // control de acciones en el envio y respuesta del server
            success: function(respuesta) {
                $(".mensajePantalla").html(respuesta);
            },
            beforeSend: function() {
                $(".mensajePantalla").html('Esperando.........');
            },
            error: function() {
                $(".mensajePantalla").html('Error en la comunicación con el servidor');
            }
        });
    });

    $("#formAcceso").submit(function(event) {
        event.preventDefault();
        $.ajax({
            // config. de datos de envío
            type: 'post',
            url: 'auth/login',
            dataType: 'json',
            data: $("#formAcceso").serialize(),
            // control de acciones en el envio y respuesta del server
            success: function(respuesta) {
                $(".mensajePantalla").html(respuesta);
            },
            beforeSend: function() {
                $(".mensajePantalla").html('Esperando.........');
            },
            error: function() {
                $(".mensajePantalla").html('Error en la comunicación con el servidor');
            }
        });
    });
});
