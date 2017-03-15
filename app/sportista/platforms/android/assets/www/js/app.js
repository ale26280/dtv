// --------------------------------------------------------------
// 
// --------------------------------------------------------------


var rutaServidor = 'http://desarrollo.koodstudio.com:99/';
var test = true;//true; si es true no valida
var db = window.openDatabase("registros", "1.0", "Dtv", 200000);
var totalLocales;
var preguntas;
var timer;

// --------------------------------------------------------------
// 
// --------------------------------------------------------------



var app = {
    // Application Constructor
    inicia: function() {

      $(".button-collapse").sideNav();
      comprobaciones.inicia();


    },


    registro: function(accion){

          registros.comprueba();

    },

    config : function(){
            paneles = $('.panelapp');
            paneles.hide();
            $('#config').delay(300).show()//.fadeIn('slow');
            config.inicia();

    },




    landing : function(){

        clearInterval(timer);
        timer = null;
        usuario.navega('landing')
        $('#landing-play').off('click')
        $('#landing-play').on('click',function(){
        app.videoPromo();//correcto

        //atajo par aprobar juegos
        //trivia.inicia()
        //app.registro();
        //app.placaPromo()
        //usuario.navega('trivia_puntos')



        })

    },



    videoPromo : function(){
        usuario.navega('video_promo')
        //muestra video
        //al terminar envia a juega
        // setTimeout(function(){ app.registro(); }, 1500);
        videocontroller.reproduce();
    },

    videoRespuesta : function(v){

        if(v=='a'){
        usuario.navega('video_buen_resultado');
        }else{
        usuario.navega('video_mal_resultado');
        }

        videocontroller.respuesta(v);

        //en el evento end de los videos manda a placa promo


    },

    placaPromo : function(){

        usuario.navega('placa_promo')
        localStorage.tocoplaca = 0;
        $('#placa_promo').off('click')
        $('#placa_promo').on('click',function(){
        localStorage.tocoplaca = 1;
        app.landing();
        })

                    setTimeout(function(){
                    if(localStorage.tocoplaca==0){
                        usuario.navega('landing') //vuelve a inciar
                        }
                    },10000)



    },

    dashboardGame : function(){

        usuario.navega('dashboardGame')
        if(localStorage.trivia ==1){
        //$('.trivia-game').fadeIn(); grilla del dashboard
        trivia.inicia()
        }

    }



};




// --------------------------------------------------------------
//
// --------------------------------------------------------------

var comprobaciones = {

    inicia : function(){
        //terminos y condiciones  si no estan ok los descarga
        terminos.comprueba();
        //usuario.reset();
        usuario.compruebaDb();
        datos.comprueba();
        usuario.comprueba();

        $(".menuconf").on('click',function(){
                datos.consulta()
                if(connect.check()==true){
                servidor.consulta()
                $('#estadoInternet').html('Conectado')

                }else{
                $('#estadoInternet').html('Sin conexión')
                $('#cantidadServidorS').html('-')
                }

        })


    },

    configuracion : function(){


    //juegos activos revisa cuales estan activos
    //setea juegos activos


    //descarga terminos
    //comprueba videos

    if(connect.check()==true){
    config.imprimeConf('Comprobando configuración...')

    ruta = rutaServidor+'svc/generico/configuracion/1';

            var t = $.getJSON(ruta, function(resp){
                    if(resp.data[0].value!=""){


                        //stea jeugos activos
                        localStorage.memo_test = resp.data[0]['memo_test']
                        localStorage.memo_test_act = resp.data[0]['memo_test_act']

                        localStorage.que_fue = resp.data[0]['que_fue']
                        localStorage.que_fue_act = resp.data[0]['que_fue_act']

                        localStorage.que_es = resp.data[0]['que_es']
                        localStorage.que_es_act = resp.data[0]['que_es_act']


                        localStorage.trivia = resp.data[0]['trivia']
                        localStorage.trivia_act = resp.data[0]['trivia_act']

                        //setea videos
                        localStorage.video_promo = resp.data[0]['video_promo'];
                        localStorage.video_promo_act = resp.data[0]['video_promo_act'];

                        localStorage.video_buen_resultado = resp.data[0]['video_buen_resultado'];
                        localStorage.video_buen_resultado_act = resp.data[0]['video_buen_resultado_act'];

                        localStorage.video_mal_resultado = resp.data[0]['video_mal_resultado'];
                        localStorage.video_mal_resultado_act = resp.data[0]['video_mal_resultado_act'];


                    }
                    }).then( successCallback, errorCallback );
                    //.then( config.imprimeConf('Configuración actualizada...'), config.imprimeConf('Ocurrió un error al obtener configuración...') );

                    function successCallback(){
                    config.imprimeConf('Configuración obtenida...')
                    config.comprueba();
                    localStorage.configuracion_descargado = 1;
                    }

                    function errorCallback(){
                    config.imprimeConf('Ocurrió un error al obtener configuración...')
                    }




    }else{

    config.imprimeConf('Sin conexión...')

    }






    },


    usuario : function(){

    usuario.ingresaDb()
    //actualiza la app
    config.actualizaApp()


    }

}



// --------------------------------------------------------------
//
// --------------------------------------------------------------



var registros = {

    comprueba : function(){

                usuario.navega('crearegistro')
                $("#form_crea_registro")[0].reset()
                $("#form_crea_registro").off('submit')
                $("#btncrear_registro" ).prop( "disabled", false );
                //$('#registrocheck').removeClass('fa-check-square-o')
                $('#form_crea_registro').on('submit',function(e){

                    e.preventDefault();


                    $("#btncrear_registro" ).prop( "disabled", true );

                                correcto = true;
                                $('#form_crea_registro .validate').each(function(){
                                if($(this).val()=='')
                                {

                                    correcto = false;

                                }
                                })




                                if(correcto==true){

                                  if( !$('#registrocheck').hasClass('fa-check-square-o') ){
                                  alert('Debe aceptar los términos y condiciones.')
                                  $( "#btncrear_registro" ).prop( "disabled", false );
                                  return false;
                                  }



                                 datos.ingresa();



                                }else{
                                alert('Todos los campos son requeridos')
                                $("#btncrear_registro" ).prop( "disabled", false );

                                }




                })



    }


}




// --------------------------------------------------------------
//
// --------------------------------------------------------------



var usuario = {

        comprueba: function() {

            localStorage.tmpexiste = 0;
            console.log('comprueba usuario local');
            console.log('antes tmp '+localStorage.tmpexiste)
            usuario.consulta();

            setTimeout(function(){
            console.log('despues tmp '+localStorage.tmpexiste)
                        if(localStorage.tmpexiste == 1){
                        app.landing();
                        }else{
                        usuario.login();
                        }
            },500)


        },



        login : function(){


            usuario.navega('login')
            $('#form_login')[0].reset();
            $('#form_login').off('submit')
            //app.registro();
            $('#form_login').on('submit',function(e){

                $('#usrlogin').prop( "disabled", true );
                e.preventDefault();
                user = $('#usuario').val();
                pass = $('#password').val();
                if(user=="" || pass==""){
                    $('#usrlogin').prop( "disabled", false );
                    alert('Debe ingresar un correo y password para usar la app.')

                }else{
                    //alert(user)
                    $('#usrlogin').prop( "disabled", true );
                    usuario.ingresaLocal(user)
                }

            })





            $('.btncrearusuario').on('touchstart',function(e){
                 e.preventDefault();
                 usuario.creausuario()


            })



            $('.btnrecuperar').on('touchstart',function(e){
                 e.preventDefault();
                 usuario.rpass();
            })


        },

        ingresaLocal : function(usuario){

            //comprueba conexion
            if(connect.check()==true){

            ruta = rutaServidor+'loginuser';
            //extras.debugms('ruta -> '+ruta);
            $.post(ruta,{user:usuario,pass:$('#password').val()},function(data){

                if(data['respuesta']=='Activo'){
                    //comprueba usuarios contra servidor si ya se logueo mantiene la seccion
                    localStorage.usuario = usuario; //guarda el usuario en local storage
                    $('#vistausuario').html(usuario)
                    $('.menuconf').fadeIn()
                    //comprueba local
                    comprobaciones.usuario();

                }else{

                    alert(data['respuesta'])
                    $('#usrlogin').prop( "disabled", false );

                }


            }).fail(function(){

                console.log('error');

            })



            }else{
                alert('Debe conectarse a internet.')
            }




        },

        reset : function(){
            localStorage.removeItem("usuario");
        },

        creausuario : function(){

            $("#form_crea_usuario")[0].reset()
            usuario.navega('creausuario');

            $( "#btncrear" ).prop( "disabled", false );

            $('#form_crea_usuario').on('submit',function(e){
                   $( "#btncrear" ).prop( "disabled", true );

                if(connect.check()==false){ alert('Revise su conexión a internet'); return false; }


                e.preventDefault();
                correcto = true;
                $('#form_crea_usuario .validate').each(function(){
                if($(this).val()=='')
                {
                    correcto = false;

                }
                })

                if(correcto==true){
                //valida pass iguales
                if( $('#password_u').val() != $('#repassword_u').val() ){
                    alert('Las contraseñas deben ser iguales ')
                    $( "#btncrear" ).prop( "disabled", false );
                    return false;
                }

                if( !$('#usercheck').hasClass('fa-check-square-o') ){
                    alert('Debe aceptar los términos y condiciones.')
                    $( "#btncrear" ).prop( "disabled", false );
                    return false;
                }
                //valida terminos y condiciones

                if(extras.validarEmail( $('#correo_u').val() ) == false){
                alert('Ingrese un correo válido.')
                $( "#btncrear" ).prop( "disabled", false );
                return false;

                }


                    ruta = rutaServidor+'creausuario';
                    dat = $(this).serialize();
                    //console.log(dat)
                    $.post(ruta,dat,function(data){
                        console.log(data)

                        if(data['respuesta']=='Ok'){
                            usuario.navega('respuestaregistro')
                            setTimeout( function(){ usuario.navega('login') } , 6000);
                        }else{

                            alert(data['respuesta'])

                        }


                    }).fail(function(){

                        console.log('error');

                    })




                }else{
                    alert('Todos los campos son requeridos')
                }

            })





        },


        rpass : function(){

            $("#form_pass")[0].reset()
            $('#form_pass').off('submit')
            usuario.navega('recuperapass');
            $( "#rpassbtn" ).prop( "disabled", false );

            $('#form_pass').on('submit',function(e){
                e.preventDefault();
                $( "#rpassbtn" ).prop( "disabled", true );
                if(connect.check()==false){ alert('Revise su conexión a internet'); return false; }

                correcto = true;
                $('#form_pass .validate').each(function(){
                if($(this).val()=='')
                {
                    correcto = false;

                }
                })

                if(correcto==true){


                if(extras.validarEmail( $('#correorecupera').val() ) == false){
                alert('Ingrese un correo válido.')
                return false;

                }


                    ruta = rutaServidor+'recuperarcorreo/';

                    dat = $(this).serialize();
                    $.get(ruta,dat,function(data){
                        //console.log(data)

                        if(data['respuesta']=='Ok'){
                            alert('Se ha enviado un correo para restablecer la contraseña.')
                            setTimeout( function(){ usuario.navega('login') } , 3000);
                        }else{

                            alert(data['respuesta'])

                        }


                    }).fail(function(){

                        console.log('error');

                    })




                }else{
                    alert('Todos los campos son requeridos')
                }

            })



        },

        navega : function(pag){
            console.log(pag)
            if(pag=='landing'){
            $('.coverCenterBottom').removeClass('fondojuego');
            $('.menuconf').fadeIn()

            }else{
            $('.menuconf').hide()
            }


            if(pag=='crearegistro'){
                        if($(window).width()>768){
                        $('#logointerior').fadeIn()
                        }
                        }else{
                        $('#logointerior').hide()
                        }

            if(pag=='crearegistro'||pag=='trivia'){
            $('.coverCenterBottom').addClass('fondojuego');
            }


            $('.panelapp').fadeOut('fast',function(){
                setTimeout( function(){ $('#'+pag).fadeIn(600); } ,500)
            });



        },



        compruebaDb : function(){
             console.log('Compobando tabla usuarios')
             db.transaction(usuario.existedb , usuario.error , usuario.ok('La tabla usuario existe ok') );

        },

        existedb : function(tx){
            //tx.executeSql('DROP TABLE IF EXISTS USUARIO');
            tx.executeSql('CREATE TABLE IF NOT EXISTS USUARIO (id , usuario , actualizacion ,created_at , updated_at )');
        },

        error : function(tx, err) {

                console.log(' Error al procesar SQL: ')
                console.log(tx);
        },

        ok : function(txt){
                console.log(txt)
        },

        ingresaDb : function(){
                    //alert('ingresa')
                    db.transaction(usuario.ingresaRegistro, usuario.error ,  usuario.ok('Usuario ingresado') );

        },

        ingresaRegistro : function(tx){


                   timestamp =  $.now();
                   columnas = 'id , usuario , actualizacion , created_at , updated_at';
                   valores  = timestamp+',"'+localStorage.usuario+'",0,'+timestamp+','+timestamp;
                   query = 'INSERT INTO USUARIO ('+columnas+') VALUES ('+valores+')';

                   tx.executeSql(query);

                   //console.log(query)

        },

        consulta : function(){

                db.transaction(usuario.consultaRegistros, usuario.error , usuario.ok('consultado usuario: ok') );

        },

        consultaRegistros : function(tx){

                tx.executeSql('SELECT * FROM USUARIO', [], usuario.querySuccess, usuario.error);

            },

        querySuccess : function(tx, results){

                    var len = results.rows.length;
                    // display alert with number of rows inserted into the db
                    console.log('usuarios totales: ' + len);

                        /* display each item in the recordset in its own alert*/
                        if (len > 0) {
                            for (var i=0;i<len;i++) {
                                console.log('id: ' + results.rows.item(i).id + ' usuario: ' + results.rows.item(i).usuario);
                            }
                        }

                        if(len==1){
                        localStorage.tmpexiste = 1;
                        localStorage.usuario = results.rows.item(0).usuario
                        $('#vistausuario').html(results.rows.item(0).usuario)

                        }


        },

        logout : function(){
            db.transaction(usuario.logoutuser, usuario.error , ok );
            $('.button-collapse').sideNav('hide');
            $('#vistausuario').html('')
            usuario.login()

            function ok(){
            console.log('Logout ok')
            usuario.compruebaDb()
            }

        },

        logoutuser : function(tx){
        tx.executeSql('DROP TABLE IF EXISTS USUARIO');
        }


}



// --------------------------------------------------------------
//
// --------------------------------------------------------------



var origen = {

    comprueba: function() {
        //localStorage.origenDatos = 'pitrela';
        //origen.reset();
        extras.debugms('comprueba origen');
        if(localStorage.origenDatos!=undefined){
          extras.debugms('origen -> '+localStorage.origenDatos);
        }
        return localStorage.origenDatos != undefined ? true : false;
    },

    placa : function(){

        placa = $('#origen');
        placa.show()//.fadeIn();

        $('.btnorigen').on('touchstart',function(e){
            e.preventDefault();
            usuario = $('#usuario').val();
            if(usuario==''){
                alert('Debe ingresar un origen para usar la app.')
            }else{
                origen.ingresa( usuario )
            }
        })

    },

    ingresa : function(usuario){
        //alert(usuario)
        localStorage.origenDatos = usuario; //guarda el usuario en local storage
        localStorage.origenMicrotime = $.now()+device.uuid; //micro + uuid
        placa = $('#origen');
        placa.hide()//fadeOut(); //apaga la placa
        $('#usuario').val('') //limpia input
        app.inicia(); //reinicia la app

    },

    reset : function(){
        localStorage.removeItem("origenDatos");
    },
}


// --------------------------------------------------------------
//
// --------------------------------------------------------------



var extras = {

    validarEmail : function( email ) {
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    return !expr.test(email) ?  false : true ;
    },

    maxlength : function(elemento){

        str = elemento.val();
        max_chars = elemento.attr('maxlength');
        if(str.length > max_chars) {
        elemento.val( str.substr(0, max_chars) );
        }
    },

    debugms : function(txt){
        var f = new Date();
        // f.getDate() + ":" + (f.getMonth() +1) + ":" + f.getFullYear()+' - '+
        fecha =f.getHours()+':'+f.getMinutes()+':'+f.getSeconds()+': ';
        $('#salida').append('<br>'+fecha+txt);
        $('#salida').scrollTop = $('#salida').scrollHeight;
    },

    debugactivo : function(v){
        salida = $('#salida,#salidatoggle');
        v == 'activo' ? salida.show() : salida.hide();
        extras.debugtoggle(v)

    },

    debugtoggle : function(v){

        if(v=='activo'){
            salida = $('#salida,#salidatoggle');
            $('#salidatoggle').on('touchstart',function(){
                if( salida.hasClass('salidaactiva') ){
                    salida.removeClass('salidaactiva');
                    //$(this).css('top','100%');
                }else{
                    salida.addClass('salidaactiva');
                    //$(this).css('top','50%');
                }
            });

            $('.panelapp').on('touchstart',function(){
                salida.removeClass('salidaactiva');

            });

        }
    },

    preloadOn : function(){
        $('#preload').show()//.fadeIn();
    },

    preloadOff : function(){
        $('#preload').hide()//.fadeOut();
    },
}


// --------------------------------------------------------------
//
// --------------------------------------------------------------



var datos = {

    comprueba : function(){
         console.log('Compobando tabla registros')
         db.transaction(datos.existedb , datos.error , datos.ok('La tabla registros existe ok') );
         datos.consulta();
    },

    existedb : function(tx){
        //tx.executeSql('DROP TABLE IF EXISTS REGISTROS');
        tx.executeSql('CREATE TABLE IF NOT EXISTS REGISTROS (id_registro_device , nombre , apellido , correo , dni , telefono , residencia ,provincia , localidad , proveedor_cable , proveedor_cable_tipo , proveedor_internet , recibe_info , usuario ,  puntos , tiempo , juego  , created_at , updated_at )');
    },

    error : function(tx, err) {

            console.log('Error al procesar l SQL: ')
            console.log(err);
    },

    ok : function(txt){
            console.log(txt)
    },

    ingresa : function(){
            //alert('ingresa')
            db.transaction(datos.ingresaRegistro, datos.error , datos.ingresalocalok );

    },

    ingresaRegistro : function(tx){
       //limpia local storage id registropara actualizar despues del juego
       localStorage.id_registro_game = '';
       inputs = $('#form_crea_registro').serializeArray();
       timestamp =  $.now();
       columnas = 'id_registro_device,';

       //localStorage.idregistrotrivia = timestamp;
       valores  = timestamp+',';
        for(i=0;i< inputs.length;i++){
            columnas = columnas + inputs[i].name + ',';
            valores = valores + '"'+inputs[i].value + '",';
            //extras.debugms(inputs[i].name +' '+inputs[i].value)
        }

        columnas =  columnas +  'usuario ,  puntos , tiempo , juego  , created_at , updated_at';


        valores  = valores + '"'+localStorage.usuario+'",0,0,0,'+timestamp+','+timestamp;
        //console.log(columnas)
        //console.log(valores)

       query = 'INSERT INTO REGISTROS ('+columnas+') VALUES ('+valores+')';

       tx.executeSql(query);
       localStorage.id_registro_game = timestamp
       //alert(localStorage.id_registro_game)



    },

    ingresalocalok : function(){
        datos.ok('ingreso el registro. ok.')
        app.dashboardGame();
    },

    consulta : function(){
        db.transaction(datos.consultaRegistros, datos.error , datos.ok('consultado: ok') );
       //datos.update();
    },

    consultaRegistros : function(tx){
        tx.executeSql('SELECT * FROM REGISTROS', [], datos.querySuccess, datos.error);

    },

    querySuccess : function(tx, results){

            var len = results.rows.length;
            // display alert with number of rows inserted into the db
            console.log('registros totales: ' + len);
            totalLocales = len;
            $('#cantidadDbLocales').html(totalLocales)
            localStorage.totalLocales = totalLocales
                /* display each item in the recordset in its own alert
                if (len > 0) {
                    for (var i=0;i<len;i++) {
                        extras.debugms('id: ' + results.rows.item(i).id + ' nombre: ' + results.rows.item(i).nombre);
                    }
                }
                */

    },

    update : function(){

        db.transaction(datos.actualizalocal, datos.error , datos.ok('actualizó correctamente') );

    },

    actualizalocal : function(tx){//id,valores para time y qrespuestas

        qcorrectas = localStorage.correctas;
        idregistro = localStorage.idregistrotrivia;
        //tiempoTrivia = localStorage.crono.length == 5 ? '00:'+localStorage.crono : localStorage.crono;
        tiempoTrivia = localStorage.tiempoTrivia.length  == 5 ? '00:'+localStorage.tiempoTrivia : localStorage.tiempoTrivia;

        tx.executeSql('UPDATE REGISTROS SET tiempo="'+tiempoTrivia+'" , qrespuestas="'+qcorrectas+'" where id = '+idregistro, [],  datos.successUpdate, datos.error);


    },

    successUpdate : function(tx,result){

            extras.debugms("regitro actualizado");

    },

    actualizaServidor : function(){

        db.transaction(datos.queryServidor, datos.error , datos.ok('Registros enviados: ok') );

    },

    queryServidor : function(tx){

        tx.executeSql('SELECT * FROM REGISTROS', [], datos.enviaServidor, datos.error);
    },

    enviaServidor : function(tx, results){

            var len = results.rows.length;

            //console.log(results.rows)
            //console.log(JSON.stringify(results.rows))
            ruta = rutaServidor+'svc/app/ingresa';
            $.post(ruta,{reg : JSON.stringify(results.rows) },function(data){
            console.log(data)
            }).then( successCallback, errorCallback );

            function successCallback(){
            servidor.consulta();
            $('#actualizaServidor').html('Actualizado');
            setTimeout(function(){
            $('#actualizaServidor').html('Actualizar registros');
            $("#actualizaServidor" ).prop( "disabled", false );
            },2000)


            }

            function errorCallback(){

            }



    },

    elimina : function(id){

    },

    truncaTabla : function(){
        db.transaction(datos.trunca , datos.error , datos.ok('La tabla registros se vació') );

    } ,

    trunca : function(tx){
        tx.executeSql('DROP TABLE IF EXISTS REGISTROS');
        console.log('tabla registros truncada');
        datos.comprueba();
        datos.consulta();

    },

    updateSubio : function(id){
        localStorage.idSubio = id;
        db.transaction(datos.actualizaSubio, datos.updateSubioError , datos.ok('actualizó correctamente') );
        //alert()
    },

    actualizaSubio : function(tx){
        //alert(localStorage.idSubio)
        idregistroAc = localStorage.idSubio;
        tx.executeSql('UPDATE REGISTROS SET subio="1" where id = '+idregistroAc, [],  datos.successSubio, datos.error);
    },

    updateSubioError : function(error){
        alert(error.code);
    },

    successSubio : function(){
        //alert('actualizó subio id '+localStorage.idSubio)
        localStorage.idSubio = '';
    },

    actualizaServidorFotos : function(){
        //fuerza la carga de todas las fotos nuevamente
        $('#actualizaServidorFotos').html('Actualizando...')
        db.transaction(datos.queryServidorFotos, datos.error , datos.ok('enviadas las fotos al servidor: ok') );

    },

    queryServidorFotos : function(tx){

        tx.executeSql('SELECT * FROM REGISTROS', [], datos.enviaServidorFotos, datos.error);
    },

    enviaServidorFotos : function(tx, results){

        var len = results.rows.length;
            //len = 1 //fuerza a uno para test
            if (len > 0) {
                for (var i=0;i<len;i++) {

                    if(results.rows.item(i).imagen!=''){
                        foto.sube(results.rows.item(i).imagen,results.rows.item(i).id)
                    }

                    if((len-1)==i){

                    extras.debugms('fin de la actualización');
                    setTimeout(function(){
                        $('#actualizaServidorFotos').html('Actualizdo')
                    },2000)


                }

                }
            }

    }


}




// --------------------------------------------------------------
//
// --------------------------------------------------------------



var trivia = {


    comprueba : function(){

    localStorage.triviaok = false;
    storet = cordova.file.dataDirectory;
    fileNamet = "trivia.json";
    window.resolveLocalFileSystemURL(storet + fileNamet, function(){
                console.log('existe trivia '+storet + fileNamet)
                config.imprimeConf('La trivia existe...')
                localStorage.trivia_descargado = 1;
                localStorage.triviaok = true;

                }, function(){
                console.log('no existe descarga')
                config.imprimeConf('La trivia no existe la descarga...')
                trivia.descarga()
                });






    },


    descarga : function(){

            var fileTransfer = new FileTransfer();

            fileTransfer.onprogress = function(progressEvent) {
             var percent =  progressEvent.loaded / progressEvent.total * 100;
             percent = Math.round(percent)+'%';
             //$('#descargaVideo').find('div').html(percent);
             //console.log(percent)
             config.imprimeConf('Descargando trivia... ')
            };


            var assetURL = encodeURI(rutaServidor+"storage/trivia/trivia.json");
            var storet = cordova.file.dataDirectory;//cordova.file.dataDirectory;
            var fileNamet = "trivia.json";

            console.log(storet + fileNamet)

            fileTransfer.download(assetURL, storet + fileNamet,
            function(entry) {

                   console.log('trivia descargada')
                   config.imprimeConf('Trivia descargada...')
                   localStorage.trivia_descargado = 1;
                   localStorage.triviaok = true;
            },
            function(err) {
                console.log(err);
                //console.dir(err);
            });


    },



    inicia : function(){
        $('#trivia_contenedor').hide();
        $('#trivia_juega').fadeIn();
        usuario.navega('trivia')
        storet = cordova.file.dataDirectory;
        fileNamet = "trivia.json";
        a ='';
        $.get(storet+fileNamet,function(data){

        }).complete(function(data){
        console.log(data['responseText'])
        a = jQuery.parseJSON(data['responseText']);
        a.sort(function (a, b) {return Math.random() - 0.5;});
                console.log('------')
                console.log(a)
                console.log('------')
                var preguntas = a.slice(0, 5);
                console.log(preguntas)
                localStorage.trivia_preguntas = JSON.stringify(preguntas);



        }).then(ok,error);


        function ok(){
        //$('#trivia_juega').off('click')
        //$('#trivia_juega').on('click',function(){
        setTimeout(function(){
                        $('#trivia_juega').fadeOut();
                        localStorage.trivia_preguntas_indice = 0;
                        localStorage.trivia_preguntas_puntos = 0;

                        localStorage.tiempolimite = 15; //en segundos
                        localStorage.componente = 'trivia'
                        reloj.inicia();

                        trivia.juega();
                        trivia.selecciona();
                        },2500)
                        //  alert()
          //              })


        }

        function error(){
        console.log('Trivia error')
        }


     },

    juega : function(){
        $('.seleccion').removeClass('selactiva')
        localStorage.toques = 0
        $('#trivia_contenedor').fadeIn();
        console.log('preguntas locales ')
        var p = JSON.parse(localStorage.getItem("trivia_preguntas"));
        //console.log(p[0].pregunta)
        if(localStorage.trivia_preguntas_indice<=4){
        $('#trivia_pregunta').html( p[localStorage.trivia_preguntas_indice].pregunta  ).attr('data-correcta',p[localStorage.trivia_preguntas_indice].correcta )
        $('#trivia_r1').html( p[localStorage.trivia_preguntas_indice].res_1  )
        $('#trivia_r2').html( p[localStorage.trivia_preguntas_indice].res_2  )
        $('#trivia_r3').html( p[localStorage.trivia_preguntas_indice].res_3  )
        }
    },

    selecciona : function(){
        $('.seleccion').off('click')

        $('.seleccion').on('click',function(){

            localStorage.toques = eval(localStorage.toques)+1

            if($(this).hasClass('selactiva')){
            return false;
            }
            console.log('antes'+localStorage.toques)
            if(localStorage.toques>1){
            return false;
            }

            console.log(localStorage.toques)

            $(this).addClass('selactiva')
            indice = eval(localStorage.getItem("trivia_preguntas_indice"))


            localStorage.trivia_preguntas_indice = indice+1;
            correcta = $('#trivia_pregunta').attr('data-correcta')

            if(correcta==$(this).attr('data-indice')){
            //suma un punto
            ptmp = eval(localStorage.getItem("trivia_preguntas_puntos"));
            localStorage.trivia_preguntas_puntos = ptmp+1;
            //alert(localStorage.getItem("trivia_preguntas_puntos"))
            }

            if(indice==4){
                           setTimeout(function(){
                           trivia.puntos()
                           return false;
                            },500)
                        }
            setTimeout(function(){
                trivia.juega()

            },500)





        })

    },


    puntos : function(){

            //actualiza el registro
            trivia.update()

            //muestra puntos
            //alert('muestra puntos')
            $('.puntos_total_imprime').html(localStorage.trivia_preguntas_puntos)
            usuario.navega('trivia_puntos')
            //constinua a video A > 3  sino video B
            if(localStorage.trivia_preguntas_puntos>3){
            video_res = 'a';
            }else{
            video_res = 'b';
            }

            setTimeout(function(){
            app.videoRespuesta(video_res)
            //app.landing()
            },5000)

            /*
            $('#trivia_juega').fadeIn()
            app.dashboardGame();
            */
    },


    update : function(){

            db.transaction(trivia.actualizalocal, datos.error , ok );


            function ok(){
                datos.ok('Regiatrio trivia ctualizó correctamente')



            }

    },

     actualizalocal : function(tx){//id,valores para time y qrespuestas

            puntos = localStorage.trivia_preguntas_puntos;
            idregistro = localStorage.id_registro_game;
            //tiempoTrivia = localStorage.crono.length == 5 ? '00:'+localStorage.crono : localStorage.crono;
            //tiempoTrivia = localStorage.tiempoTrivia.length  == 5 ? '00:'+localStorage.tiempoTrivia : localStorage.tiempoTrivia;
            tiempoTrivia = localStorage.crono
            juego = 'trivia';
            updated_at = $.now();
            tx.executeSql('UPDATE REGISTROS SET tiempo="'+tiempoTrivia+'" , puntos="'+puntos+'" , juego="'+juego+'" , updated_at="'+updated_at+'" where id_registro_device = '+idregistro, [],  datos.successUpdate, datos.error);
               //para y reinicia el reloj
               reloj.reiniciar()

     },

     successUpdate : function(tx,result){

                console.log("regitro actualizado");

      },



}

// --------------------------------------------------------------
//
// --------------------------------------------------------------

var marcha=0; //control del temporizador
var cro=0; //estado inicial del cronómetro.
var elcrono;

var reloj = {

    inicia : function(){
        console.log('inicia el cron hasta segundo '+localStorage.tiempolimite)
        $('#relojTest').fadeIn();
        //alert('empieza reloj')
        localStorage.crono = "00:00:00"; //visor a cero
        reloj.empezar();

    },

    empezar : function(){

      emp=new Date() //fecha inicial (en el momento de pulsar)
      elcrono=setInterval(reloj.tiempo,10); //función del temporizador.
      localStorage.marcha=1 //indicamos que se ha puesto en marcha.
        $('#progress').attr('max',localStorage.tiempolimite)
    },

    reiniciar : function(){

    if (localStorage.marcha==1) {  //si el cronómetro está en marcha:
         clearInterval(elcrono); //parar el crono
         elcrono = '';
         localStorage.marcha=0;  //indicar que está parado
         }
             //en cualquier caso volvemos a los valores iniciales
     cro=0; //tiempo transcurrido a cero
     localStorage.crono = "00:00:00"; //visor a cero
        localStorage.tiempolimite = 0; //en segundos
        localStorage.componente = '' //limpia componente
        $('#relojTest').fadeOut();
        console.log('reloj parado y reiniciado')

    },

    tiempo : function(){

    if(localStorage.marcha==1){

    actual=new Date(); //fecha a cada instante
        //tiempo del crono (cro) = fecha instante (actual) - fecha inicial (emp)
     cro=actual-emp; //milisegundos transcurridos.
     cr=new Date(); //pasamos el num. de milisegundos a objeto fecha.
     cr.setTime(cro);
        //obtener los distintos formatos de la fecha:
     cs=cr.getMilliseconds(); //milisegundos
     cs=cs/10; //paso a centésimas de segundo.
     cs=Math.round(cs); //redondear las centésimas
     sg=cr.getSeconds(); //segundos
     mn=cr.getMinutes(); //minutos
    // ho=cr.getHours()-1; //horas
        //poner siempre 2 cifras en los números


          //valida

          if(sg==localStorage.tiempolimite){
                    if(localStorage.componente=='trivia'){
                                             trivia.puntos();
                                        }

                   localStorage.marcha = 0;
                    $('#relojTest').fadeOut();
                    console.log('Se acabo el tiempo');



                     $('#relojTest').fadeOut();


                  }



     if (cs<10) {cs="0"+cs;}
     sgv = sg;
     if (sg<10) {

        sg="0"+sg;
     }
     if(mn>0){
        if(mn==3){
        /*
        localStorage.marcha = 0;
        alert('Tiempo limite');
        app.formulario('muestra')
        */
         }
     if (mn<10) {mn="0"+mn;}
     }else{
        mn = '';
     }







    //llevar resultado al visor.

     localStorage.crono = mn+sg+":"+cs;
     $('#progress').attr('value',sgv)
     //$('#relojTest').html(localStorage.crono)

    }

    }
}



// --------------------------------------------------------------
//
// --------------------------------------------------------------


var connect = {

    inicia : function(){

        connect.check();

    },

    check : function(){

            var networkState = navigator.connection.type;

            var states = {};
            states[Connection.UNKNOWN]  = 'Unknown connection';
            states[Connection.ETHERNET] = 'Ethernet connection';
            states[Connection.WIFI]     = 'WiFi connection';
            states[Connection.CELL_2G]  = 'Cell 2G connection';
            states[Connection.CELL_3G]  = 'Cell 3G connection';
            states[Connection.CELL_4G]  = 'Cell 4G connection';
            states[Connection.CELL]     = 'Cell generic connection';
            states[Connection.NONE]     = 'No network connection';

            $('#estadoRed').html(states[networkState])
            console.log('conexion -> '+states[networkState]);
            conectado = states[networkState] == 'No network connection' ? false : true;

            return conectado;

    },

}




// --------------------------------------------------------------
//
// --------------------------------------------------------------


var config = {

    inicia : function(){

        connect.inicia();
        config.registrosLocales();
        //config.origen();
        config.registrosServidor();

        $('#actualizaServidor').html('Actualizar');

    },

    registrosLocales : function(){
        datos.consulta();

    },

    registrosServidor : function(){
        console.log('consultando servidor');
        servidor.consulta();

    },

    actualizaApp : function(){
            $('.salidaDescargas').html('');
            if(connect.check()==false){
            alert('Debe estar conectado a internet')
            return false;
            }

            $('.button-collapse').sideNav('hide');
            usuario.navega('descargaContenidos')



            config.imprimeConf('Comprobando el sistema por favor espere...')

            //para estado de actuyalizacion

            localStorage.configuracion_descargado = 0;
            localStorage.trivia_descargado = 0;
            localStorage.video_promo_descargado = 0;
            localStorage.video_buen_resultado_descargado = 0;
            localStorage.video_mal_resultado_descargado = 0;

            comprobaciones.configuracion();

            config.estadoCheck();


    },

    imprimeConf : function(txt){

    sal = $('.salidaDescargas');
    sal.append(txt)
    sal.append('<br>')


    },

    comprueba : function(){
                 console.log('Compobando tabla config')
                 db.transaction(config.existedb , datos.error , actualizaConfigLocal );

                 function actualizaConfigLocal(){

                 datos.ok('La tabla config existe ok')
                 config.imprimeConf('Actualizando configuración...')
                 config.actualizaConf()
                 }

        },

    existedb : function(tx){
                //tx.executeSql('DROP TABLE IF EXISTS CONFIG'); //comentar
                tx.executeSql('CREATE TABLE IF NOT EXISTS CONFIG (memo_test , que_fue , que_es , trivia , trivia_act , video_promo , video_promo_act , video_buen_resultado , video_buen_resultado_act , video_mal_resultado , video_mal_resultado_act , memo_test_act ,  que_fue_act , que_es_act  )');
    },

    actualizaConf : function(){
            db.transaction(existeConfig ,error , ok );

            function existeConfig(tx){
            tx.executeSql('SELECT * FROM CONFIG', [], okC, error);

            }

            function ok(){

            }

            function okC(tx, results){

                 var len = results.rows.length;
                 config.imprimeConf('Cofig tiene '+ len)

                 //silen = 0 cera sino edita
                 if(len==0){
                 config.creaConfigLocal()
                 }else{
                 config.actualizaConfigLocal()
                 }


             }


            function error(){
                config.imprimeConf('Error al obtener configuración local...')
            }

    },


    creaConfigLocal : function(){

        db.transaction(ingresaRegistro, error ,  ok );



                 function ingresaRegistro(tx){



                           columnas = 'memo_test , que_fue , que_es , trivia , trivia_act , video_promo , video_promo_act , video_buen_resultado , video_buen_resultado_act , video_mal_resultado , video_mal_resultado_act , memo_test_act ,  que_fue_act , que_es_act';
                           valores  = '"'+localStorage.memo_test+'",'+
                                      '"'+localStorage.que_fue+'",'+
                                      '"'+localStorage.que_es+'",'+
                                      '"'+localStorage.trivia+'",'+
                                      '"'+localStorage.trivia_act+'",'+
                                      '"'+localStorage.video_promo+'",'+
                                      '"'+localStorage.video_promo_act+'",'+
                                      '"'+localStorage.video_buen_resultado+'",'+
                                      '"'+localStorage.video_buen_resultado_act+'",'+
                                      '"'+localStorage.video_mal_resultado+'",'+
                                      '"'+localStorage.video_mal_resultado_act+'",'+
                                      '"'+localStorage.memo_test_act+'",'+
                                      '"'+localStorage.que_fue_act+'",'+
                                      '"'+localStorage.que_es_act+'"';



                           query = 'INSERT INTO CONFIG ('+columnas+') VALUES ('+valores+')';

                           tx.executeSql(query);

                           //console.log(query)

                }

                function ok(){
                    config.imprimeConf('Configuración local creada')

                    //validaciones  solo para trivia despues agregar el resto de lso jeugos
                     if(localStorage.trivia==1){
                        compruebaFiles.servidor('trivia',localStorage.trivia_act)
                        }

                        compruebaFiles.servidor('video_promo',localStorage.video_promo_act)
                        compruebaFiles.servidor('video_buen_resultado',localStorage.video_buen_resultado_act)
                        compruebaFiles.servidor('video_mal_resultado',localStorage.video_mal_resultado_act)

                }


                function error(){

                console.log('Error al crear la configuracion local')

                }



    },


    actualizaConfigLocal : function(){

        db.transaction(actualizaRegistro, error ,  ok );



                 function actualizaRegistro(tx){

                            //rowid 1

                           //columnas = 'memo_test , que_fue , que_es , trivia , trivia_act , video_promo , video_promo_act , video_buen_resultado , video_buen_resultado_act , video_mal_resultado , video_mal_resultado_act , memo_test_act ,  que_fue_act , que_es_act';
                           valores  = 'memo_test="'+localStorage.memo_test+'",'+
                                      'que_fue="'+localStorage.que_fue+'",'+
                                      'que_es="'+localStorage.que_es+'",'+
                                      'trivia="'+localStorage.trivia+'",'+
                                      'trivia_act="'+localStorage.trivia_act+'",'+
                                      'video_promo="'+localStorage.video_promo+'",'+
                                      'video_promo_act="'+localStorage.video_promo_act+'",'+
                                      'video_buen_resultado="'+localStorage.video_buen_resultado+'",'+
                                      'video_buen_resultado_act="'+localStorage.video_buen_resultado_act+'",'+
                                      'video_mal_resultado="'+localStorage.video_mal_resultado+'",'+
                                      'video_mal_resultado_act="'+localStorage.video_mal_resultado_act+'",'+
                                      'memo_test_act="'+localStorage.memo_test_act+'",'+
                                      'que_fue_act="'+localStorage.que_fue_act+'",'+
                                      'que_es_act="'+localStorage.que_es_act+'"';




                           idregistro = 1;
                           //console.log('UPDATE CONFIG SET '+valores+' where rowid = '+idregistro);
                           tx.executeSql('UPDATE CONFIG SET '+valores+' where rowid = '+idregistro, [],  successUpdate, error);

                            function successUpdate(){
                            config.imprimeConf('Configuracion local actualizada...')
                            }

                            function error(tx,err){
                                    console.log('Error al actualizar la configuración local update')
                                    console.log(err)
                            }

                           //console.log(query)

                }

                function ok(){
                    config.imprimeConf('Configuración local comprobando...')

                    //validaciones  solo para trivia despues agregar el resto de lso jeugos
                     if(localStorage.trivia==1){
                        compruebaFiles.servidor('trivia',localStorage.trivia_act)
                        }

                        compruebaFiles.servidor('video_promo',localStorage.video_promo_act)
                        compruebaFiles.servidor('video_buen_resultado',localStorage.video_buen_resultado_act)
                        compruebaFiles.servidor('video_mal_resultado',localStorage.video_mal_resultado_act)





                            }


                 function error(){
                    console.log('Error al actualizar la configuración local')
                  }

    },


    actualizaRegistroServidor : function(){


        if(connect.check()!=true){
            alert('Debe estar conectado a internet');
            return false;

        }

        console.log('En servidor '+localStorage.totalServidor)
        console.log('En db local '+localStorage.totalLocales)


        if(localStorage.totalServidor==localStorage.totalLocales){
            alert('El servidor está actualizado');
            return false;
        }

        //alert('el servidor no está actualizado')
        $('#actualizaServidor').html('Actualizando...');
        $("#actualizaServidor" ).prop( "disabled", true );
        datos.actualizaServidor();

    },

    borrarLocales : function(){
        config.borrarLocalesOk()
        //utiliza el pass del acceso restringido
        /*
        navigator.notification.prompt(
        "Ingrese password", // message
        config.borrarLocalesOk, // callback to invoke
        'Datos', // title
        ['Aceptar', 'Cancelar'], // buttonLabels
        '' // defaultText
        );
        */

    },

    borrarLocalesOk : function(result){


        // if (result.input1 == 'exidor') {


        navigator.notification.confirm(
            'Los registros no se puden recuperar. Desea continuar?', // message
            config.borrarLocalesConfirma, // callback to invoke with index of button pressed
            'Confirma', // title
            ['Cancelar', 'Continuar'] // buttonLabels
        );

       // } else {

       // alert('Password incorrecto.')

        //}


    },

    borrarLocalesConfirma : function(buttonIndex){

             //2 es aceptar
            if (buttonIndex == 2) {
                //alert('ahora si borra')
                datos.truncaTabla();
                //origen.reset();
                alert('La app ha sido reiniciada correctamente.')
                //navigator.app.exitApp();
                //window.location.reload()
            };

    },

    activaDebug : function(ele){
        estado = $('#activaDebug').html();
        estado == 'Activar' ? extras.debugactivo('activo') : extras.debugactivo('');
        estado == 'Activar' ? $('#activaDebug').html('Desactivar') : $('#activaDebug').html('Activar');



    },

    validaciones : function(){
        config.validacionesToggle();
        //usa el pass del acceso restringido
        /*
        navigator.notification.prompt(
        "Ingrese password", // message
        config.validacionesToggle, // callback to invoke
        'Activa / Desactiva - Validaciones', // title
        ['Aceptar', 'Cancelar'], // buttonLabels
        '' // defaultText
        );
        */
    },

    validacionesToggle : function(result){
       //if (result.input1 == 'exidor') {

            test = test==false ? true : false;
            texto = test==false ? 'Activadas' : 'Desactivadas'
            $('#activaValidaciones').html( texto )

         //} else {

       // alert('Password incorrecto.')

        //}

    },

    muestraUtilidades : function(){
        if($('#activaUtilidades').html()=='Cerrar'){
            $('#restringido').fadeOut();
            $('#activaUtilidades').html('Acceder');
            return false;
        }

        navigator.notification.prompt(
        "Ingrese password", // message
        config.activaUtilidades, // callback to invoke
        'Acceso restringido', // title
        ['Aceptar', 'Cancelar'], // buttonLabels
        '' // defaultText
        );
    },

    activaUtilidades : function(result){
        if (result.input1 == 'exidor') {
        $('#activaUtilidades').html('Cerrar');
        $('#restringido').fadeIn();
        }else {

        alert('Password incorrecto.')

        }
    },


    estadoActualizacion: function(){

        /*
        if(localStorage.configuracion_descargado==0){
        console.log(''+localStorage.configuracion_descargado)
        return false;
        }
        */
        console.log('comprobando')
        console.log('trivia '+localStorage.configuracion_descargado)
        console.log('video_promo '+localStorage.video_promo_descargado)
        console.log('video_buen_resultado_descargado '+localStorage.video_buen_resultado_descargado)
        console.log('video_mal_resultado_descargado '+localStorage.video_mal_resultado_descargado)

        if(localStorage.trivia_descargado==0){
        return false;
        }

        if(localStorage.video_promo_descargado==0){
            return false;
        }

        if(localStorage.video_buen_resultado_descargado==0){
            return false;
         }

         if(localStorage.video_mal_resultado_descargado==0){
            return false;
         }
     clearInterval(timer);
     timer = null;
     config.imprimeConf('Actualización terminada');
     setTimeout(function(){
     app.landing()
     $('#usrlogin').prop( "disabled", false );
     },2000)
     return false;


    },


    estadoCheck :function(){

        timer = setInterval("config.estadoActualizacion()", 500);;
    }

}




// --------------------------------------------------------------
//
// --------------------------------------------------------------



var servidor = {


    consulta : function(){

        ruta = rutaServidor+'svc/app/cantidad';
        //extras.debugms('ruta -> '+ruta);
        $.post(ruta,{
        usuario:localStorage.usuario
        },function(data){ ///cambio origen por unico

            //totalLocales
            totalServidor = data;
            setTimeout(function(){
            $('#cantidadServidorS').html( totalServidor );
            localStorage.totalServidor = totalServidor
            //alert('totalServidor '+totalServidor)
            },1000)


            console.log('cantidad servidor -> '+data);
        }).fail(function(){
            console.log('error servidor');
        })


    },

    estado : function(){

    }

}





// --------------------------------------------------------------
//
// --------------------------------------------------------------




var videocontroller = {

    descarga : function(elemento,video){

        //videocontroller.descargando();

        var fileTransfer = new FileTransfer();

        fileTransfer.onprogress = function(progressEvent) {
         var percent =  progressEvent.loaded / progressEvent.total * 100;
         percent = Math.round(percent)+'%';
         //console.log(porcent)
         //$('#descargaVideo').find('div').html(porcent);
        };


        var assetURL = encodeURI(rutaServidor+'storage/videos/'+video);
        var store = cordova.file.dataDirectory;
        var fileName = video;

        //alert(store + fileName)

        fileTransfer.download(assetURL, store + fileName,
        function(entry) {
           // videocontroller.actulaizaUrl();
            console.log("Success!"+video);
            config.imprimeConf('Video '+elemento+' descargado...')



            switch(elemento) {
                case 'video_promo':
                    localStorage.video_promo_descargado = 1;
                    break;
                case 'video_buen_resultado':
                    localStorage.video_buen_resultado_descargado = 1;
                    break;
                case 'video_mal_resultado':
                      localStorage.video_mal_resultado_descargado = 1;
                     break;
            }

            //videocontroller.descargaFin();

        },
        function(err) {
            alert("Error");
            console.log(err);
        });


    },

    comprueba : function(elemento,video){


        store = cordova.file.dataDirectory//cordova.file.dataDirectory;
        fileName = video;
        window.resolveLocalFileSystemURL(store + fileName, function(){
                console.log('existe video '+elemento+' '+store + fileName)
                config.imprimeConf('Existe '+elemento+'...')

                switch(elemento) {
                                case 'video_promo':
                                    localStorage.video_promo_descargado = 1;
                                    break;
                                case 'video_buen_resultado':
                                    localStorage.video_buen_resultado_descargado = 1;
                                    break;
                                case 'video_mal_resultado':
                                      localStorage.video_mal_resultado_descargado = 1;
                                     break;
                            }


                //$('#descargaVideo').hide();
                }, function(){
                console.log('no existe descarga')
                config.imprimeConf('No existe '+elemento+' lo descarga...')
                videocontroller.descarga(elemento,video)
                });

    },


    elimina : function(video){

        console.log(video)
        store = cordova.file.dataDirectory;
        fileName = video;
        window.resolveLocalFileSystemURL(store + fileName, function(fileEntry){
                       fileEntry.remove(function(){
                       console.log('borrado')
                       },function(){
                       console.log('error al borrar')
                       })
                       }, function(){
                       console.log('no existe')

                       });
    },


     reproduce : function(){

             $('#video_promo_rep').attr('src',cordova.file.dataDirectory+localStorage.video_promo).fadeIn();
             $('#video_promo_rep')[0].play();
             $('#video_promo_rep').on('ended',function(){ //ended
               app.registro();
             })

        },

      respuesta : function(tipo){

               t = tipo == 'a' ? localStorage.video_buen_resultado : localStorage.video_mal_resultado
               et = tipo =='a' ? 'video_buen_resultado' : 'video_mal_resultado'

              //alert(tipo)
             $('#'+et+'_rep').attr('src',cordova.file.dataDirectory+t).fadeIn();
                         $('#'+et+'_rep')[0].play();
                         $('#'+et+'_rep').on('ended',function(){ //ended
                           app.placaPromo();
                         })

      },

}



// --------------------------------------------------------------
//
// --------------------------------------------------------------




var terminos = {

    comprueba :function(){

        if(connect.check()==true){

        ruta = rutaServidor+'svc/generico/terminos/1';

        var t=$.getJSON(ruta, function(resp){
                if(resp.data[0].value!=""){

                 //console.log(resp.data[0]['terminos_registros'])
                 localStorage.terminos_usuarios = resp.data[0]['terminos_usuarios']
                 localStorage.terminos_registros = resp.data[0]['terminos_registros']
                 }
                 });

        }




    },

    carga : function(){

        $('#terminostexto').load('terminos.html',function(){
            console.log('carga terminos')
        });


    },

    abre : function(tipo){
        texto = $('.terminostexto')
        console.log(tipo,localStorage.terminos_usuarios,localStorage.terminos_registros )
        if(tipo=='usuario'){
        texto.html( localStorage.terminos_usuarios )
        }else{
        texto.html( localStorage.terminos_registros )
        }

        $('#terminos').fadeIn();
    },

    cierra : function(){
        $('#terminos').fadeOut();
    },

    checkToggle : function(e){
        //e = $('#check');

        if(e.hasClass('fa-square-o')){
            e.removeClass('fa-square-o').addClass('fa-check-square-o')
        }else{
            e.removeClass('fa-check-square-o').addClass('fa-square-o')
        }

    }



}




// --------------------------------------------------------------
//
// --------------------------------------------------------------


var compruebaFiles ={

    servidor : function(elemento,fecha){
             config.imprimeConf( 'Consultando '+elemento+' act '+fecha )
            //comprueba elemento fecha vs servidor
            ruta = rutaServidor+'svc/generico/configuracion/1';

                        var t = $.getJSON(ruta, function(resp){


                                }).then( successCallback, errorCallback );

                                function successCallback(resp){
                                config.imprimeConf('Configuración obtenida...')
                                if(resp.data[0].value!=""){
                                    resp.data[0][elemento]

                                    //si es =  se fija si existe
                                    if(resp.data[0][elemento+'_act'] == fecha){

                                     config.imprimeConf('La fecha de '+elemento+' es igual a la fecha local')
                                     //compruebaFiles.file(elemento+'.json')

                                        switch(elemento) {
                                            case 'trivia':
                                                 trivia.comprueba()
                                                break;
                                            case 'video_promo' :
                                                videocontroller.comprueba('video_promo',localStorage.video_promo)
                                                break;
                                            case 'video_buen_resultado' :
                                                 videocontroller.comprueba('video_buen_resultado',localStorage.video_buen_resultado)
                                                 break;
                                            case 'video_mal_resultado' :
                                                 videocontroller.comprueba('video_mal_resultado',localStorage.video_mal_resultado)
                                                 break;
                                            default:
                                                return false
                                        }


                                     }else{

                                     //si es != descarga
                                     config.imprimeConf('La fecha de '+elemento+' es distinta a la fecha local descarga')

                                     }

                                }
                                }

                                function errorCallback(){
                                config.imprimeConf('Ocurrió un error al comprobar los datos...')
                                }





    },


    file : function(archivo){

           /*comprueba si existe el archico en el dispositivo

           storet = cordova.file.dataDirectory;
           fileNamet = archivo;
               window.resolveLocalFileSystemURL(storet + fileNamet, function(){
                           console.log('existe archivo '+storet + fileNamet)
                           config.imprimeConf('Existe archivo ...')
                           },d);

                function d(){

                         console.log('no existe descarga')
                         config.imprimeConf('No existe archivo lo descarga ...')
                         compruebaFiles.file(archivo)
                         return false;

                }*/

    },


    descarga : function(archivo){

            //descarga el archivo ej trivia.descarga()
            config.imprimeConf('Descargando archivo por favor espere...' + archivo)

            //actualiza config con la fehcha del elemnto

    },


    actualiza : function(elemento,fecha){

            //actualiza la configuracion

            //se dija que el archivo exista

    },


    eliminafile : function(archivo){


    }







}




function cargaautocomplete(){

     $.ajax({
            type: 'GET', // your request type
            url: "json/provincias.json",
            success: function (response) {
                var myArray = $.parseJSON(response);
                console.log(myArray)
                var dataAC = {};
                for(var i=0;i<myArray.length;i++){
                   dataAC[ myArray[i]['state'] ] =  null ;
                   //console.log(myArray[i]['state'])
                }
                console.log(dataAC)
                //debugger;
                $('input.provincia').autocomplete({
                    data: dataAC,
                    limit: 20
                });
            }
        });



        /*
        $('input.provincia').autocomplete({
          data: {"Capital Federal" : null ,"Buenos Aires" : null ,"Catamarca" : null ,"Chaco" : null ,"Chubut" : null ,"Cordoba" : null ,"Corrientes" : null ,"Entre Rios" : null ,"Formosa" : null ,"Jujuy" : null ,"La Pampa" : null ,"La Rioja" : null ,"Mendoza" : null ,"Misiones" : null ,"Neuquen" : null ,"Rio Negro" : null ,"Salta" : null ,"San Juan" : null ,"San Luis" : null ,"Santa Cruz" : null ,"Santa Fe" : null ,"Santiago del Estero" : null ,"Tierra del Fuego" : null ,"Tucuman" : null ,},
          limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
        })

        */

        $('input.localidad').on('focus',function(){
            localidades( $('input.provincia').val() );
        })



}


function localidades(provincia){
        //alert(provincia)
        $.ajax({
                    type: 'GET', // your request type
                    url: "json/localidades.json",
                    success: function (response) {
                        var myArray = $.parseJSON(response);
                        console.log(myArray)
                        var dataAC = {};
                        for(var i=0;i<myArray.length;i++){
                           if(myArray[i]['prv_nombre'] == provincia){
                           dataAC[ myArray[i]['loc_nombre'] ] =  null ;
                           }
                           //console.log(myArray[i]['state'])

                        }
                        console.log(dataAC)
                        //debugger;
                        $('input.localidad').autocomplete({
                            data: dataAC,
                            limit: 20
                        });
                    }
                });

}


document.addEventListener("deviceready", function(){

$("input").blur(function(){
    //alert("This input field has lost its focus.");
    
    return false;
});




cargaautocomplete()
app.inicia()

}, false);



