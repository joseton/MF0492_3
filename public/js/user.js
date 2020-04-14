$( document ).ready(function() {

    // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5

    $(".registrespam").click(function(){
        $("#login").toggle();
        $("#registre").toggle();
        $(".results").html("");
        $("#login").trigger("reset");
        $("#registre").trigger("reset");

    });
    $(".loginspam").click(function(){
       $("#registre").toggle();
        $("#login").toggle();
        $(".results").html("");
        $("#registre").trigger("reset");
        $("#login").trigger("reset");


    });


    $("#registre").submit(function(event) {
        event.preventDefault();
       // método AJAX de jQuery
       $.ajax({
           // config. de datos de envío
           type: 'POST',
           url: 'auth/register',
           dataType: 'json',
           data: $("#registre").serialize(),
           // control de acciones en el envio y respuesta del server
           success: function(res){
               $(".results").html(res);
           },
           beforeSend: function(){
               $(".results").html('one moment please comprobando');
           },
           error: function(){
               $(".results").html('Error en la comunicación con el servidor');
           }
       });

   });

   $("#login").submit(function(event) {
        event.preventDefault();
      // método AJAX de jQuery
      $.ajax({
          // config. de datos de envío
          type: 'POST',
          url: 'auth/login',
          dataType: 'json',
          data: $("#login").serialize(),
          // control de acciones en el envio y respuesta del server
          success: function(resp){
              $(".resultslog").html(resp);
          },
          beforeSend: function(){
              $(".resultslog").html('one moment please');
          },
          error: function(){
              $(".resultslog").html('Error en la comunicación con el servidor');
          }
      });

  });
});

// $("#logform").click(function(){
//     $("#logform").toggle();
//     $("#regform").toggle();
//
// });
    // Final TODO Challenge 5


//     $("#regForm").submit(function( event ) {
//         var pass = $('#pass').val();
//         var pass2 = $('#pass2').val();
//         if(pass != pass2){
//             event.preventDefault();
//             $('.results').html('Las contraseñas no coinciden!');
//         }
//     });
// });
// $(."toggle").click()
// $(#regForm).toggle()
