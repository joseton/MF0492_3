

$( document ).ready(function() {
//
//     // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
//
        $("#toLogin").click(function(){
            $("#loginForm").toggle();
            $("#registerForm").toggle();
        });
        $("#toRegister").click(function(){
            $("#registerForm").toggle();
            $("#loginForm").toggle();
        });

        $("#registerForm").submit(function(event) {
        // método AJAX de jQuery
            $.ajax({
            // config. de datos de envío
                type: 'POST',
                url: 'auth/register',
                dataType: 'json',
                data: $("#registerForm").serialize(),
                // control de acciones en el envio y respuesta del server
                success: function(response){
                    console.log(response);
                    console.log("Success en Ajax");
                    $(".resultado").html(response);
                },
                beforeSend: function(){
                    $(".resultado").html('<i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>');
                },
                error: function(){
                    $(".resultado").html('Error en la comunicación con el servidor');
                }
            });
            event.preventDefault();
        });

        $("#loginForm").submit(function(event) {
        // método AJAX de jQuery
            $.ajax({
            // config. de datos de envío
                type: 'POST',
                url: 'auth/login',
                dataType: 'json',
                data: $("#loginForm").serialize(),
                // control de acciones en el envio y respuesta del server
                success: function(response){
                    console.log(response);
                    console.log("Success en Ajax");
                    $(".resultado").html(response);
                },
                beforeSend: function(){
                    $(".resultado").html('<i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>');
                },
                error: function(){
                    $(".resultado").html('Error en la comunicación con el servidor');
                }
            });
            event.preventDefault();
        });


//     // Final TODO Challenge 5
//
//
//     // $("#regForm").submit(function( event ) {
//     //     var pass = $('#pass').val();
//     //     var pass2 = $('#pass2').val();
//     //     if(pass != pass2){
//     //         event.preventDefault();
//     //         $('.results').html('Las contraseñas no coinciden!');
//     //     }
//     // });
});
