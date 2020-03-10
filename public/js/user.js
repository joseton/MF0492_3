$( document ).ready(function() {
    $("#regForm").submit(function( event ) {
        var pass = $('#pass').val();
        var pass2 = $('#pass2').val();
        if(pass != pass2){
            event.preventDefault();
            $('.results').html('Las contraseñas no coinciden!');
        }
    });
});
