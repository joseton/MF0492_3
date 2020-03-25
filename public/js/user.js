$(document).ready(function() {

  // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
  $("#cambioAregistro").click(function() {
    $("#regForm").toggle();
    $("#logForm").toggle();
  });
  $("#cambioAlogin").click(function() {
    $("#logForm").toggle();
    $("#regForm").toggle();
  });


  $("#regForm").submit(function(event) {
      event.preventDefault();
    // metodo ajax
    $.ajax({
      // configuracion datos de envio
      type: 'POST',
      url: 'auth/register',
      dataType: 'json',
      data: $("#regForm").serialize(),
      // contro de acciones de envio y respuesta
      success: function(dataResp) {
        console.log(dataResp);
        console.log("bien en Ajax")
        $(".dataResp2").html(dataResp);
      },
      beforeSend: function() {
        $(".dataResp2").html(' <i class="fas fa-spinner fa-pulse"></i> Registrando...');
      },
      error: function() {
        $(".dataResp2").html('Error en la comunicación con el servidor');
      }
    });
    // event.preventDefault();


  });

  $("#logForm").submit(function(event) {
  event.preventDefault();
    // metodo ajax

    $.ajax({
      // configuracion datos de envio
      type: 'POST',
      url: 'auth/login',
      dataType: 'json',
      data: $("#logForm").serialize(),
      // contro de acciones de envio y respuesta
      success: function(dataResp) {

        $(".dataResp2").html(dataResp);
      },
      beforeSend: function() {
        $(".dataResp2").html(' <i class="fas fa-spinner fa-pulse"></i>');
      },
      error: function() {
        $(".dataResp2").html('Error en la comunicación con el servidor');
      }
    });
    // event.preventDefault();


  });


  // Final TODO Challenge 5


});
