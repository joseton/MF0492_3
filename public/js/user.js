$( document ).ready(function() {

  // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
  // Añadir las dos funciones que envian mediante "Ajax" (JS ó JQuery) los
  // datos de cada formulario mediante el método "post" cargando el
  // controlador pertinente. Estas funciones reciben la respuesta (mensaje)
  // del controlador y lo insertan en un "div" debajo del formulario. Los
  // datos se transmiten en formato JSON.
  $(".click_aqui").click(function(){
    $("#regForm").toggle();
    $("#logForm").toggle();
  });

  $("#regForm").submit(function(event) {
    event.preventDefault();
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
        $(".results").html('Comprobando datos...');
      },
      error: function(){
        $(".results").html('[!] Error en la comunicación con el servidor');
      }
    });

  });

  $("#logForm").submit(function(event) {
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: ' auth/login',
      dataType: 'json',
      data: $("#logForm").serialize(),
      // control de acciones en el envio y respuesta del server
      success: function(dataResp){
        $(".results").html(dataResp);
      },
      beforeSend: function(){
        $(".results").html('Comprobando datos...');
      },
      error: function(){
        $(".results").html('[!] Error en la comunicación con el servidor');
      }
    });

  });

  // Final TODO Challenge 5

});
