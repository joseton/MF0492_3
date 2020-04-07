

$( document ).ready(function() {


        $("#signupModal").submit(function(event) {
        // método AJAX de jQuery
            $.ajax({
            // config. de datos de envío
                type: 'POST',
                url: 'home/signup',
                dataType: 'json',
                data: $("#signupModal").serialize(),
                // control de acciones en el envio y respuesta del server
                success: function(response){
                    console.log(response);
                    console.log("Success en Ajax");
                    $(".resultado").html(response);
                },
                beforeSend: function(){
                    $(".resultado").html('<i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>');
                    $(".resultado").html("Registrando...");
                },
                error: function(){
                    $(".resultado").html('Error en la comunicación con el servidor');
                }
            });
            event.preventDefault();
        });

        $("#loginModal").submit(function(event) {
        // método AJAX de jQuery
            $.ajax({
            // config. de datos de envío
                type: 'POST',
                url: 'home/login',
                dataType: 'json',
                data: $("#loginModal").serialize(),
                // control de acciones en el envio y respuesta del server
                success: function(response){
                    if(response == 'ok'){
                    window.open("home", "_self");
                    }else{$(".resultado").html(response);}
                },
                beforeSend: function(){
                    // $(".resultado").html('<i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>');
                    $(".resultado").html('Validando...');
                },
                error: function(){
                    $(".resultado").html('Error en la comunicación con el servidor');
                }
            });
            event.preventDefault();
        });


            //Ajax que recoge la información de los temas y los pinta en Select Tema
            $.ajax({
            // config. de datos de envío
                type: 'POST',
                url: 'main_menu/selectTema',
                dataType: 'json',
                // data: $("#loginModal").serialize(),
                // control de acciones en el envio y respuesta del server
                success: function(response){
                    // var len = response.length;
                    for (var i = 0; i < response.length; i++) {
                        var name = response[i].name;
                        $('#topicList').append('<div class="caja2"><a href="#" id="'+name+'">'+name+'</a></div>');
                    }
                },
            });

            //Ajax que recoge la información de los temas y los pinta en Edit Tema
            $.ajax({
            // config. de datos de envío
                type: 'POST',
                url: 'main_menu/selectTema',
                dataType: 'json',
                // data: $("#loginModal").serialize(),
                // control de acciones en el envio y respuesta del server
                success: function(response){
                    // var len = response.length;
                    for (var i = 0; i < response.length; i++) {
                        var name = response[i].name;
                        $('#editList').append('<div class="caja2"><a href="#modal_edit_topic" rel="modal:open" id="'+name+'" onclick="idTopic(event)">'+name+'</a></div>');
                    }
                },
            });


            //Guardamos newTopic
            $("#createTopic").submit(function(event) {
            // método AJAX de jQuery
                $.ajax({
                // config. de datos de envío
                    type: 'POST',
                    url: 'main_menu/createTopic',
                    dataType: 'json',
                    data: $("#createTopic").serialize(),
                    // control de acciones en el envio y respuesta del server
                    success: function(response){
                        console.log("Success en Ajax");
                        $(".resultado").html(response);
                        if (response == 'Se ha guardado correctamente'){
                            setTimeout(location.reload.bind(location), 1500);
                        }else{}
                    },
                    beforeSend: function(){
                        // $(".resultado").html('<i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>');
                        $(".resultado").html('Validando...');
                    },
                    error: function(response){
                        console.log(response);
                        $(".resultado").html('Error en la comunicación con el servidor');
                    }
                });
                event.preventDefault();
            });


            //Acción al presionar el botón eliminar Tema
            $("#editTopic").on('click', '#Eliminar', function(event){
                // window.open("main_menu/deleteTopic", "_self");
                $.ajax({
                // config. de datos de envío
                    type: 'POST',
                    url: 'main_menu/deleteTopic',
                    dataType: 'json',
                    data: {id:$('#topic').html()},
                    // control de acciones en el envio y respuesta del server
                    success: function(response){
                        console.log("Success en Ajax");
                        $(".resultado").html(response);
                        // setTimeout(location.reload.bind(location), 1500);
                    },
                    beforeSend: function(){
                        // $(".resultado").html('<i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>');
                        $(".resultado").html('Eliminando...');
                    },
                    error: function(response){
                        console.log(response);
                        $(".resultado").html('Error en la comunicación con el servidor3');
                    }
                });
            });


            //Cuando clickas en editar topic , pasas al modal de edición
            $("#editTopic").on('click', '#Editar', function(event) {
                var valor = $("#topic").text();
                $("input[name=changeTopic]").val(valor);
                $("input[name=oldTopic]").val(valor);
            });


            // Acción al presionar el botón Actualizar Tema
            $("#updateTopic").submit(function(event) {
            // método AJAX de jQuery
                $.ajax({
                // config. de datos de envío
                    type: 'POST',
                    url: 'main_menu/updateTopic',
                    dataType: 'json',
                    data: $("#updateTopic").serialize(),
                    // control de acciones en el envio y respuesta del server
                    success: function(response){
                        console.log("Success en Ajax");
                        $(".resultado").html(response);
                        if (response == 'Se ha actualizado correctamente'){
                            setTimeout(location.reload.bind(location), 1500);
                        }else{}
                    },
                    beforeSend: function(){
                        // $(".resultado").html('<i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i>');
                        $(".resultado").html('Actualizando...');
                    },
                    error: function(response){
                        console.log(response);
                        $(".resultado").html('Error en la comunicación con el servidor4');
                    }
                });
                event.preventDefault();
            });

});

//Elimina los divs ateriores e introduce el Topic seleccionado
function idTopic(event) {
    $('#topic').remove();
    $('#editTopic').append("<div class='caja2' id='topic'>"+event.target.id+"</div>");

}

// Recoge el id seleccionado en editar y lo muestra para editar o eliminar.
// function idTopic(event) {
//     document.getElementById("editTopic").innerHTML += "<div class='caja2' id='topic'>"+event.target.id+"</div>";
// }
