// TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
$(document).ready(function() {

    $( ".toggle" ).click(function() {
        $("#logForm").toggle();
        $("#regForm").toggle();
    });





    $("#regForm").submit(function(event) {
        event.preventDefault();
        // método AJAX de jQuery
        $.ajax({
            // config. de datos de envío
            type: 'POST',
            url: 'auth/register',
            dataType: 'json',
            data: $("#regForm").serialize(),
            // control de acciones en el envio y respuesta del server
            success: function(res){
                $(".results").html(res);
            },
            beforeSend: function(){
                $(".results").html('registrando....');
            },
            error: function(){
                $(".results").html('Error en la comunicación con el servidor');
            }
        });

        $("logForm").submit(function(event) {
            event.preventDefault();
            // método AJAX de jQuery
            $.ajax({
                // config. de datos de envío
                type: 'POST',
                url: 'auth/login',
                dataType: 'json',
                data: $("#logForm").serialize(),
                // control de acciones en el envio y respuesta del server
                success: function(res){
                    $(".results").html(res);
                },
                beforeSend: function(){
                    $(".results").html('procesando');
                },
                error: function(){
                    $(".results").html('LogIn Error');
                }
            });
        });

});

});

/*
$(."toggle").click()
$(#regForm).toggle()*/



        // Final TODO Challenge 5


        // $("#regForm").submit(function( event ) {
        //     var pass = $('#pass').val();
        //     var pass2 = $('#pass2').val();
        //     if(pass != pass2){
        //         event.preventDefault();
        //         $('.results').html('Las contraseñas no coinciden!');
        //     }
        // });
