$( document ).ready(function() {

  // TODO Challenge 5: Añadir el código PHP que se indica en el ejercicio del Challenge 5
  $(".toggle").click(function(){
    $("#regForm").toggle();
    $("#logForm").toggle();
  });

  $("#regForm").submit(function(event) {
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: 'auth/register',
      dataType: 'json',
      data: $("#regForm").serialize(),
      // control de acciones en el envio y respuesta del server
      success: function(dataResp){
        $(".resultsr").html(dataResp);
      },
      beforeSend: function(){
        $(".resultsr").html('...espera un momento...');
      },
      error: function(){
        $(".resultsr").html('Error en el registro');
      }
    });

  });
  $("#logForm").submit(function(event) {
    event.preventDefault();
    $.ajax({
      type: 'POST',
      url: 'auth/login',
      dataType: 'json',
      data: $("#logForm").serialize(),
      // control de acciones en el envio y respuesta del server
      success: function(dataResp){
        $(".resultsl").html(dataResp);
      },
      beforeSend: function(){
        $(".resultsl").html('...espera un momento...');
      },
      error: function(){
        $(".resultsl").html('Error en el login');
      }
    });

  });
  // Final TODO Challenge 5
});
