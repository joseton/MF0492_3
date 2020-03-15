
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
                $(".results").html('<i class="fas fa-spinner"></i>' + "<br>" + "Registrando......");
            },
            error: function(){
                $(".results").html('*Error en la comunicación con el servidor');

            }
        });


        // $.ajax({
        //     // config. de datos de envío LOGIN
        //     type: 'POST',
        //     url: 'auth/login',
        //     dataType: 'json',
        //     data: $("#login").serialize(),
        //     // control de acciones en el envio y respuesta del server
        //     success: function(){
        //         $(".results").html();
        //     },
        //     beforeSend: function(){
        //         $(".results").html('<i class="fas fa-spinner"></i>' + "<br>" + "Cargando......");
        //     },
        //     error: function(){
        //         $(".results").html('*Error en la comunicación con el servidor');
        //     }
        // });


    });
});
    // Final TODO Challenge 5


    //
    // $("#registre").submit(function( event ) {
    //     var pass = $('#reg_pass').val();
    //     var pass2 = $('#reg_r_pass').val();
    //     if(reg_pass != reg_r_pass){
    //         event.preventDefault();
    //     }
