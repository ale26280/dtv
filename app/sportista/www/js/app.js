// --------------------------------------------------------------
// 
// --------------------------------------------------------------


var rutaServidor = 'http://desarrollo.koodstudio.com:99/';
var test = true;//true; si es true no valida
var db = window.openDatabase("registros", "1.0", "Dtv", 200000);
var totalLocales;
var preguntas;

// --------------------------------------------------------------
// 
// --------------------------------------------------------------



var app = {
    // Application Constructor
    inicia: function() {
        

      comprobaciones.inicia();


    },

    eventos : function(){
        enviando = true;
        $('#form').on('submit',function(e){
            e.preventDefault();
            if(enviando){
            enviando = false;
            app.formulario('valida');
            setTimeout(function(){
                enviando = true;
            },1000);
            }

        })

    },
    

    formulario: function(accion){

        formulario = $('#formulario');
        paneles = $('.panelapp');

        if(accion=='muestra'){
            paneles.hide();
            //setTimeout(formulario.fadeIn('slow'),1000)
            $('#form')[0].reset();
            $('#smallImage').attr('src','').hide();
            $('#check').removeClass('fa-check-square-o').addClass('fa-square-o')
            formulario.show()//.fadeIn('slow');


            }


        if(accion=='valida'){
            extras.preloadOn()

            if(!test){


            $('.valida').removeClass('error');

            if($('#nombre').val()==''){
                $('#nombre').addClass('error').focus(); 
                extras.preloadOff()
                return false;
            }else if($('#apellido').val()==''){
                $('#apellido').addClass('error').focus(); 
                extras.preloadOff()
                return false;

            }else if($('#correo').val()==''|| extras.validarEmail( $('#correo').val() ) == false){
                $('#correo').addClass('error').focus(); 
                extras.preloadOff()
                return false;

            }else if($('#dia').val()==''){
                $('#dia').addClass('error').focus(); 
                extras.preloadOff()
                return false;

            }else if($('#mes').val()==''){
                $('#mes').addClass('error').focus(); 
                extras.preloadOff()
                return false;

            }else if($('#ano').val()==''){
                $('#ano').addClass('error').focus(); 
                extras.preloadOff()
                return false;

            }else if($('#telefono').val()==''){
                $('#telefono').addClass('error').focus(); 
                extras.preloadOff()
                return false;

            }else if($('#operador').val()==''){
                $('#operador').addClass('error').focus(); 
                extras.preloadOff()
                return false;

            }else if( !$('#check').hasClass('fa-check-square-o') ){
                alert('Debe aceptar los términos y condiciones.')
                extras.preloadOff()
                return false;
            }else{
                //pasa las validaciones guarda los datos
                datos.ingresa();
            }


        }else{//fin test

                //app.trivia();
                datos.ingresa();
        }

        }//fin valida


    },

    config : function(){
            paneles = $('.panelapp');
            paneles.hide();
            $('#config').delay(300).show()//.fadeIn('slow');
            config.inicia();

    },

    video : function(){
        //$('#rep').off('ended');
        //$('#player').off('click');
        /*
        screen.unlockOrientation();
        var vid = document.getElementsByTagName('video')[0];
        vid.src = 'file:///data/data/com.kood.trivia/files/video.mp4';
        //$('#rep').css({'opacity':1});
        $('.panelapp').hide();
        $('#player,#video').show()//.fadeIn();

        $('#player').on('click',function(){ 
                $('#player').hide();
                //alert('')
                //$('#rep').css({'opacity':1});

                vid.play();   
                //app.trivia();
        })

        
        $('#rep').on('ended',function(){ //ended touchstart
            $('video')[0].webkitExitFullScreen();
            app.trivia();
        })
        */
        

    },

    login : function(){
        //pantalla de login muestra el formulario el registro y el recuperar contrase;a
        //comprueba que se hayan descargado los elemntos de los juegos activos y toda la configuracion de la app



    },

    registro : function(accion){
        //panalla de registro acciones guarda o recupera

        //muestra guarda recupera 


    },

    dashboardGame : function(){
        //revisa los juegos activos comprueba que los elementos de los juegos
        // esten cargados reinicia la variable juego y setea local el nuevo juego
        usuario.navega('dashboardGame')
         setTimeout(function(){ app.juega(); }, 1500);

    },

    videoPromo : function(){
        //muestra video 
        //al terminar envia a juega
         usuario.navega('video_promo')
         setTimeout(function(){ app.dashboardGame(); }, 1500);

    },



    juega : function(){
        
        //inicio juego depentendiendo la variable juego
        alert('juega')


    },

    terminaJuego : function(){

        setTimeout(function(){ app.formulario('muestra'); }, 500);

    }



};




// --------------------------------------------------------------
// 
// --------------------------------------------------------------

var comprobaciones = {

    inicia : function(){

        usuario.reset();
        console.log(usuario.comprueba())

        if( usuario.comprueba() == true ){

            //alert('logueado')
            app.videoPromo();

        }else{
            usuario.navega('login')
            usuario.login();

        }

    },

    actualizacionSistema : function(){

    },

    descargaJuegos : function(){

    },



}

// --------------------------------------------------------------
// 
// --------------------------------------------------------------



var usuario = {
    
    comprueba: function() {
        //localStorage.origenDatos = 'pitrela';
        //origen.reset();
        console.log('comprueba usuario local');
        if(localStorage.usuario!=undefined){
          extras.debugms('usuario -> '+localStorage.usuario);  
        }
        return localStorage.usuario != undefined ? true : false;
    },



    login : function(){


        $('#form_login').on('submit',function(e){
            e.preventDefault();
            user = $('#usuario').val();
            pass = $('#password').val();
            if(user=="" || pass==""){
                alert('Debe ingresar un correo y password para usar la app.')
            }else{
                //alert(user)
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
                //localStorage.usuario = usuario; //guarda el usuario en local storage
                //localStorage.usuarioMicrotime = $.now()+device.uuid; //micro + uuid 
                //console.log(localStorage.usuario)
                app.dashboardGame();
            }else{
                
                alert(data['respuesta'])
                
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

        usuario.navega('creausuario');

        $('#form_crea_usuario').on('submit',function(e){


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
                return false;
            }

            if( !$('#usercheck').hasClass('fa-check-square-o') ){
                alert('Debe aceptar los términos y condiciones.')
                return false;
            }
            //valida terminos y condiciones 

            if(extras.validarEmail( $('#correo_u').val() ) == false){
            alert('Ingrese un correo válido.')
            return false;

            }
                

                ruta = rutaServidor+'creausuario';
                dat = $(this).serialize();
                $.post(ruta,dat,function(data){ 
                    //console.log(data)
                    
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

        usuario.navega('recuperapass');


        $('#for_rpass').on('submit',function(e){
            e.preventDefault();

            if(connect.check()==false){ alert('Revise su conexión a internet'); return false; }

            correcto = true;
            $('#for_rpass .validate').each(function(){
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
                

                ruta = rutaServidor+'recuperarcorreo';
                dat = $(this).serialize();
                $.post(ruta,dat,function(data){ 
                    //console.log(data)
                    
                    if(data['respuesta']=='Ok'){
                        alert('Se ha enviado un correo para restablecer la contraseña.')
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

    navega : function(pag){
        console.log(pag)
        $('.panelapp').fadeOut('fast',function(){
            setTimeout( function(){ $('#'+pag).fadeIn(900); } ,50)
        });

        
       

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
         extras.debugms('Compobando tabla registros')
         db.transaction(datos.existedb , datos.error , datos.ok('La tabla registros existe ok') );
    },

    existedb : function(tx){
        //tx.executeSql('DROP TABLE IF EXISTS REGISTROS');
        tx.executeSql('CREATE TABLE IF NOT EXISTS REGISTROS (id , nombre , apellido , correo , dia , mes , ano , telefono , marca , modelo , operador , imagen , origen , qrespuestas , tiempo ,created_at , updated_at , subio , unico)');
    },

    error : function(tx, err) {
            extras.debugms(tx + " Error al procesar SQL: "+err.code);
    },

    ok : function(txt){
            extras.debugms(txt)
    },

    ingresa : function(){
            //alert('ingresa')
            db.transaction(datos.ingresaRegistro, datos.error , datos.ingresalocalok );

    },

    ingresaRegistro : function(tx){

       inputs = $('#form').serializeArray();
       timestamp =  $.now();
       columnas = 'id,';
       localStorage.idregistrotrivia = timestamp;
       valores  = timestamp+',';
        for(i=0;i< inputs.length;i++){
            columnas = columnas + inputs[i].name + ',';
            valores = valores + '"'+inputs[i].value + '",';
            //extras.debugms(inputs[i].name +' '+inputs[i].value)
        }

        columnas =  columnas +  'origen, qrespuestas , tiempo , created_at , updated_at , subio , unico';
       
        
        valores  = valores + '"'+localStorage.origenDatos+'",0,0,'+timestamp+','+timestamp+',0,"'+localStorage.origenMicrotime+'"';
         //extras.debugms(columnas)
         //extras.debugms(valores)

       query = 'INSERT INTO REGISTROS ('+columnas+') VALUES ('+valores+')';
      
       tx.executeSql(query);
       
       //extras.debugms(query)


    },

    ingresalocalok : function(){
        datos.ok('ingreso el registro. ok.')
        $('#form')[0].reset();
        $('#smallImage').attr('src','').hide();
        datos.ok('formulario reset.')
        $(window).scrollTop( 0 );
        extras.preloadOff();
        app.video();
    },

    consulta : function(){
        db.transaction(datos.consultaRegistros, datos.error , datos.ok('consultado: ok') );
       //datos.update();
    },

    consultaRegistros : function(tx){
        //tx.executeSql('SELECT * FROM DEMO where id = 1',datos.error , querySuccess );
        tx.executeSql('SELECT * FROM REGISTROS', [], datos.querySuccess, datos.error);

    },

    querySuccess : function(tx, results){

            var len = results.rows.length;
            // display alert with number of rows inserted into the db
            extras.debugms('registros totales: ' + len);
            totalLocales = len;
            $('#cantidadLocales').html(totalLocales)
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

        db.transaction(datos.queryServidor, datos.error , datos.ok('ingresado: ok') );

    },

    queryServidor : function(tx){
       
        tx.executeSql('SELECT * FROM REGISTROS', [], datos.enviaServidor, datos.error);
    },

    enviaServidor : function(tx, results){
        
            var len = results.rows.length;
            //len = 1 //fuerza a uno para test
            if (len > 0) {
                for (var i=0;i<len;i++) {
                    //extras.debugms('id: ' + results.rows.item(i).id + ' nombre: ' + results.rows.item(i).nombre);

                    //datos = data.split('|');
                    ruta = rutaServidor+'svc/app/ingresa';
                    //extras.debugms(data);
                    if(results.rows.item(i).imagen!='' && results.rows.item(i).subio == 0){
                       // foto.sube(results.rows.item(i).imagen,results.rows.item(i).id)
                    }
                    $.post(ruta,{
                        id : results.rows.item(i).id,
                        nombre : results.rows.item(i).nombre,
                        apellido : results.rows.item(i).apellido,
                        correo : results.rows.item(i).correo,
                        dia : results.rows.item(i).dia,
                        mes : results.rows.item(i).mes,
                        ano : results.rows.item(i).ano,
                        telefono : results.rows.item(i).telefono,
                        marca : results.rows.item(i).marca,
                        modelo : results.rows.item(i).modelo,
                        operador : results.rows.item(i).operador,
                        origen : results.rows.item(i).origen,
                        qrespuestas : results.rows.item(i).qrespuestas,
                        tiempo : results.rows.item(i).tiempo,
                        imagen : results.rows.item(i).imagen,
                        subio : results.rows.item(i).subio, //img 
                        unico : results.rows.item(i).unico, //unico 
                        created_at : results.rows.item(i).created_at,
                        updated_at : results.rows.item(i).updated_at

                        },function(data){

                        //extras.debugms('ingresado -> '+data);

                    }).fail(function(xhr, textStatus, errorThrown){

                        extras.debugms('error servidor '+xhr.responseText);

                    })


                //extras.debugms('len: ' + (len-1) + ' i: ' + i);
                

                
                if((len-1)==i){

                    $('#actualizaServidor').html('Fin de la actualización')
                    extras.debugms('fin de la actualización');
                    setTimeout(function(){
                        $('#actualizaServidor').html('Actualizar');
                        config.registrosServidor();
                    },2000)
                    
                    
                }
                

                }
            }
           
        

    },

    elimina : function(id){

    },

    truncaTabla : function(){
        db.transaction(datos.trunca , datos.error , datos.ok('La tabla registros se vació') );
        
    } ,

    trunca : function(tx){
        tx.executeSql('DROP TABLE IF EXISTS REGISTROS');
        extras.debugms('tabla registros truncada');
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

    carga : function(){
        
            $.ajax({
            crossDomain: true,
            url: 'trivia.json',
            dataType: 'json',
            //contentType: "application/json; charset=utf-8",
            })
            .done(function(data){
            extras.debugms('preguntas cargadas ok ')
            objJson = data;
             $.each( data, function( i, item ) {
                            extras.debugms(item.length)
                        });
            //app.trivia();
             })
            .fail(function( jqxhr, textStatus, error ) {
            var err = textStatus + ", " + error;
            extras.debugms('error -> '+err)
            })
        
         
    },

    inicia : function(){

        extras.debugms('cantidad de grupos '+objJson.preguntas.length)
        extras.debugms('genrando random grupos de preguntas');

        grupo = Math.floor( Math.random() * 4 ); 

        extras.debugms('cargando preguntas para el grupo '+grupo);

        $('#trivia').html('');
        

        var preguntasGrupo;

        //extras.debugms(objJson.preguntas[grupo]['grupo'+grupo].length)

        preguntasGrupo = objJson.preguntas[grupo]['grupo'+grupo];
        extras.debugms('se obtiene las preguntas del grupo '+grupo)
        //preguntasGrupo.reverse();
        
        indices = 3;
        localStorage.correctas = 0;

        $.each( preguntasGrupo, function( i, item ) {

                        extras.debugms('indice '+indices +' id '+i)
                        
                        
                        bg = '<img src="img/bg.png" width="100%" class="vista_pregunta_bg">';
                        circle = '<span class="fa-stack fa-lg fatrivia"><i class="fa fa-circle fa-stack-2x fa-inverse"></i><i class="fa fa-circle-o fa-stack-2x "></i></span>';
                        
                        correcta = item.correcta;


                        wrapp = $('#trivia');
                        wrapp.append( '<div class="trivia_panel" id="respuesta'+i+'" style="z-index:'+indices+'">'+
                                     bg+
                                     '<div class="trivia_wrapp">'+
                                     '<img src="trivia/img/'+item.img+'" width="100%">'+
                                     '<div class="vista_pregunta">'+(i+1)+') '+ item.pregunta+'</div>'+
                                     '<div class="trivia_container">'+
                                     '<div class="trivia_list"><span class="seleccion"  id="'+i+'" data="'+correcta+'" data-valor="a">'+circle+item.a+'</span></div>'+
                                     '<div class="trivia_list"><span class="seleccion"  id="'+i+'" data="'+correcta+'" data-valor="b">'+circle+item.b+'</span></div>'+
                                     '<div class="trivia_list"><span class="seleccion"  id="'+i+'" data="'+correcta+'" data-valor="c">'+circle+item.c+'</span></div>'+
                                     //'correcta: '+correcta+
                                     '</div>'+ //fin container
                                     '</div>'+ //fin trivia_wrapp
                                     '</div>');//fin trivia_panel
                        indices--;

                        });
                        
                        

                        $('.seleccion').on('touchstart',function(){


                            $(this).find('i').each(function(index){

                                index == 0 ? $(this).removeClass('fa-inverse') : '';
                                index == 1 ? $(this).addClass('fa-inverse') : '';

                            })
                            
                        
                        trivia.selecciona( $(this).attr('id') , $(this).attr('data-valor') );
                        $('#respuesta'+$(this).attr('id')).hide();
                        
                        if( $(this).attr('data-valor')==$(this).attr('data') ){
                          
                            localStorage.correctas = eval(localStorage.correctas)+1;
                            extras.debugms('correcto '+localStorage.correctas)
                            $('#qrespuestas').html( localStorage.correctas )


                        }
                           
                            
                            
                        });

                        
                        //inicia timer
                        reloj.inicia();



    },

    selecciona : function(id,val){

        //obtiene el id del registro y acumula las respuestas correctas
        //etTimeout( function(id,val){

        
        //$('#respuesta'+id).css('margin-top','400px')
        extras.debugms('resultado: '+id+' '+val)

        ocultos = 0;
        $('.trivia_panel').each(function(){
            if( $(this).is(':hidden') ){
                ocultos++
            }
        })
        //extras.debugms('ocultos'+ocultos)

        if(ocultos==2){
            $('.panelapp').hide();

            datos.update();
            $('#tiempo').html(localStorage.crono)
            localStorage.tiempoTrivia = $('#tiempo').html();
            reloj.reiniciar();

            //.fadeIn()
            $('#resultados').show().on('touchstart',function(){

                //muestra las respuesta correctas y el timepo luego al tocar va al formulario
                setTimeout(function(){
                    app.formulario('muestra');
                },500)
                
                ocultos = 0;
            });
            
        }
        

    //},300)

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

        
        //alert('empieza reloj')
        reloj.empezar();

    },

    empezar : function(){

      emp=new Date() //fecha inicial (en el momento de pulsar)
      elcrono=setInterval(reloj.tiempo,10); //función del temporizador.
      localStorage.marcha=1 //indicamos que se ha puesto en marcha.

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
        
    //alert('termino reloj')

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
     if (cs<10) {cs="0"+cs;} 
     if (sg<10) {sg="0"+sg;} 
     if(mn>0){
        if(mn==3){ localStorage.marcha = 0; alert('Tiempo limite'); app.formulario('muestra') }
     if (mn<10) {mn="0"+mn;} 
     }else{
        mn = '';
     }
    
    //llevar resultado al visor.         

     localStorage.crono = mn+sg+":"+cs;
     //$('#relojTest').html(localStorage.crono)

    }

    },

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
            //extras.debugms('conexion -> '+states[networkState]);
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
        config.origen();
        config.registrosServidor();

        $('#actualizaServidor').html('Actualizar');

    },

    registrosLocales : function(){
        datos.consulta();
    
    },

    registrosServidor : function(){
        extras.debugms('consultando servidor');
        servidor.consulta();
    
    },

    origen : function(){

        $('#vistaOrigen').html( localStorage.origenDatos )

    },

    actualizaRegistroServidor : function(){

        connect.check();

        if(conectado==0){
            alert('Debe estar conectado a internet');
            return false;

        }

        if(totalServidor==totalLocales){
            alert('El servidor está actualizado');
            return false;
        }

        
        $('#actualizaServidor').html('Actualizando...');
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
                origen.reset();
                alert('La app ha sido reiniciada correctamente.')
                //navigator.app.exitApp();
                window.location.reload()
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
    }

}




// --------------------------------------------------------------
// 
// --------------------------------------------------------------



var servidor = {


    consulta : function(){
        
        ruta = rutaServidor+'svc/app/cantidad';
        //extras.debugms('ruta -> '+ruta);
        $.post(ruta,{unico:localStorage.origenMicrotime},function(data){ ///cambio origen por unico

            //totalLocales
            totalServidor = data;
            $('#cantidadServidor').html( totalServidor );

            extras.debugms('cantidad servidor -> '+data);
        }).fail(function(){
            extras.debugms('error servidor');
        })
        

    },

    estado : function(){

    }

}





// --------------------------------------------------------------
// 
// --------------------------------------------------------------




var videocontroller = {

    descarga : function(){
       
        videocontroller.descargando();

        var fileTransfer = new FileTransfer();

        fileTransfer.onprogress = function(progressEvent) {
         var percent =  progressEvent.loaded / progressEvent.total * 100;
         percent = Math.round(percent)+'%';
         $('#descargaVideo').find('div').html(percent);
        };


        var assetURL = encodeURI("http://samsungapp.p-per.com/app/descargaapp/video.mp4");
        var store = cordova.file.dataDirectory;
        var fileName = "video.mp4";

        //alert(store + fileName)

        fileTransfer.download(assetURL, store + fileName, 
        function(entry) {
           // videocontroller.actulaizaUrl();
           // alert("Success!");
             videocontroller.descargaFin();
           
        }, 
        function(err) {
            alert("Error");
            //console.dir(err);
        });
        
        
    },

    comprueba : function(){
    //videocontroller.actulaizaUrl();
    store = cordova.file.dataDirectory;
    fileName = "video.mp4";
    window.resolveLocalFileSystemURL(store + fileName, function(){
            //alert('existe')
            $('#descargaVideo').hide();
            }, function(){
            //alert('no existe descarga')
            videocontroller.descarga()
            });

    },

    actulaizaUrl : function(url){
        $('#vurl').attr('src',cordova.file.dataDirectory+"video.mp4");
    },

    descargando : function(){
        $('#descargaVideo').show();
    },

    descargaFin : function(){
        $('#descargaVideo').fadeOut();
        window.location.reload()
    }

}



// --------------------------------------------------------------
// 
// --------------------------------------------------------------


var pictureSource; // picture source
var destinationType; // sets the format of returned value
var rutaLocalImg = '/storage/emulated/0';
var rutaUpload = rutaServidor+'upload';

var foto = {

    init : function(){
        console.log("console.log works well");
        pictureSource = navigator.camera.PictureSourceType;
        destinationType = navigator.camera.DestinationType;


    },

    captura : function(){

       navigator.camera.getPicture(foto.okCaptura, foto.errorCaptura, {
        quality: 50,
        destinationType: destinationType.FILE_URI,
        encodingType: Camera.EncodingType.JPEG,
        //targetWidth: 628,
        //targetHeight: 471,
        saveToPhotoAlbum: false
        });

    },

    okCaptura : function(imageURI){
        //alert(imageURI)
        foto.mueve(imageURI);

    },

    errorCaptura : function(message){
        alert('Error al tomar foto '+message);
    },

     mueve : function(fileUri){
    //alert(cordova.file.dataDirectory)
     window.resolveLocalFileSystemURL(
          fileUri,
          function(fileEntry){
          
                var newFileName = fileEntry.name;
                window.resolveLocalFileSystemURL(cordova.file.dataDirectory,
                        function(dirEntry) {
                            // move the file to a new directory and rename it
                            fileEntry.moveTo(dirEntry, newFileName, foto.successMove, foto.resOnError);
                        },
                        foto.resOnError);
          },
          foto.resOnError);

    },

    mueveO : function(file){ //se remplazo por el move
        //alert(file)
         window.resolveLocalFileSystemURI(file, foto.okMueve, foto.errorMueve);
    },

    okMueve : function(entry){ //se remplazo por el move
        //alert(entry.name)
        var d = new Date();
        var n = d.getTime();
        //new file name
        // var newFileName = n + ".jpg";
        var newFileName = entry.name;
        var myFolderApp = "galaxya"; //OK
        //var myFolderApp = cordova.file.dataDirectory+'galaxya';
        //alert(cordova.file.dataDirectory)

 
        window.requestFileSystem(LocalFileSystem.PERSISTENT, 0, function (fileSys) {
                //The folder is created if doesn't exist
                
                fileSys.root.getDirectory(myFolderApp, {
                        create: true,
                        exclusive: false
                    },
                    function (directory) {

                        entry.moveTo(directory, newFileName, foto.successMove, foto.resOnError);


                    },
                    foto.resOnError);
            },
            foto.resOnError);



    },

    errorMueve : function(error){
        alert('Error al mover la imgen code '+error.code);
    },

    successMove : function(entry){

            //devuelve la ruta de la imagen
            //alert(entry.fullPath)

            to = entry.fullPath.split('/');
            imgTemporal = to[7];
            mgTemporalCompleta = entry.fullPath;
            //alert(entry)
            $('#smallImage').attr('src', cordova.file.dataDirectory+entry.fullPath).show()//.fadeIn()
            $('#imagen').val(cordova.file.dataDirectory+entry.fullPath)

    },

    resOnError : function(error){
        alert('Error al subir la imagen code '+error.code);
    },


    sube : function(imageURI,id){
            //imageURI = $('#smallImage').attr('src');//para test upload
            var options = new FileUploadOptions();
            options.fileKey = "file";
            //options.fileName=imageURI.substr(imageURI.lastIndexOf('/')+1);
            options.fileName = imageURI.replace(" ", "");
            options.mimeType = "image/jpeg";

            var params = {};
            params.unico = localStorage.origenMicrotime;
            

            options.params = params;
            //alert(rutaUpload)

            var ft = new FileTransfer();
            ft.upload(imageURI, encodeURI(rutaUpload), foto.okSube(id), foto.resOnError, options);

    },

    okSube : function(id){
        //alert('subio '+id);
        datos.updateSubio(id)
        //actializa el registro local a subida a 1 asi no la vuelve a subir
    },

}



var terminos = {

    carga : function(){

        $('#terminostexto').load('terminos.html',function(){
            console.log('carga terminos')
        });
        

    },

    abre : function(){
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


document.addEventListener("deviceready", app.inicia, false);





