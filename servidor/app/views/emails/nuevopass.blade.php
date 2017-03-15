<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
		<title>DIRECTV - Sportistas .: recuperar contraseña :.</title>
            <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height, target-densitydpi=device-dpi" />


<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>

		  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">

  <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
	


	<style type="text/css">
		

* {
    -webkit-tap-highlight-color: rgba(0,0,0,0); /* make transparent link selection, adjust last value opacity 0 to 1.0 */
}

body {
    -webkit-touch-callout: none;                /* prevent callout to copy image, etc when tap to hold */
    -webkit-text-size-adjust: none;             /* prevent webkit from resizing text to fit */
    -webkit-user-select: none;                  /* prevent copy paste, to allow, change 'none' to 'text' */
    background-color:#00609c;
    /*font-family: 'effra_heavyregular';*/
    font-family: 'helvetica';
    font-size:15px;
    height:100%;
    margin:0px;
    padding:0px;
    width:100%;
    font-weight: 300;
    

}


body {
      display: flex;
      min-height: 100vh;
      flex-direction: column;
    }


main {
      flex: 1 0 auto;
    }


 .input-field input[type=date]:focus + label,
    .input-field input[type=text]:focus + label,
    .input-field input[type=email]:focus + label,
    .input-field input[type=password]:focus + label {
      color: #e91e63;
    }

    .input-field input[type=date]:focus,
    .input-field input[type=text]:focus,
    .input-field input[type=email]:focus,
    .input-field input[type=password]:focus {
      border-bottom: 2px solid #e91e63;
      box-shadow: none;
    }


.box-l{
    box-sizing: border-box;
  width: 50%;
  min-width: 300px;
  margin: 0 auto;
  box-shadow: 2px 2px 5px 1px rgba(0, 0, 0, 0.2);
  padding: 0px 30px 20px 30px;
  border-radius: 3px;
}

.res{
	display: none;
}

	</style>




	</head>





	<body>
		


		<div id="login" class="panelapp">



    <main>
    <center>
     
    <div class="section"></div>
    <div class="section"><img src="../img/logo.png" align="center"></div>
      <div class="container">
      
        <div class="white box-l">





            <div id="correcta" class="res">
             <div class='row'>
              <div class='col s6'>
              </div>
            </div>
            	<p>El cambio de contraseña se ha realizado ocn éxito.</p>
            </div>


            <div id="error" class="res">
            <div class='row'>
              <div class='col s6'>
              </div>
            </div>

            	<p>Hubo un error al cambiar la contraseña por favor inténtelo más tarde.</p>
            </div>





          <form  id="form">
          <input type="hidden" name="id" value="{{$id}}">
            <div class='row'>
              <div class='col s6'>
              </div>
            </div>


            <div class='row'>
              <div class='input-field col s12'>
                <input class='validate' type='password' name='password' id='password' />
                <label for='password'>Ingrese password</label>
              </div>
             
            </div>


             <div class='row'>
              <div class='input-field col s12'>
                <input class='validate' type='password' name='repassword' id='repassword' />
                <label for='password'>Re-ingrese password</label>
              </div>
           
            </div>



            <br />
            <center>
              <div class='row'>
                <button type='submit' name='btn_login' class='col s12 btn btn-large waves-effect indigo'>Cambiar contraseña</button>
              </div>
            </center>




            </form>


             

        </div>
      </div>
      
    </center>

    <div class="section"></div>
    <div class="section"></div>
    </main>



    </div>


    <script type="text/javascript">
    	


    	$('#form').on('submit',function(e){
            e.preventDefault();
            correcto = true;
            $('#form .validate').each(function(){
            if($(this).val()=='')
            {
                correcto = false;
                
            }
            })

            if(correcto==true){
            //valida pass iguales 
            if( $('#password').val() != $('#repassword').val() ){
                alert('Las contraseñas deben ser iguales ')
                return false;
            }


                

                ruta = '../rp';
                dat = $(this).serialize();
                $.post(ruta,dat,function(data){ 
                    //console.log(data)
                    $('#form').fadeOut();

                    if(data['respuesta']=='Ok'){
                        
                        $('#correcta').fadeIn();

                    }else{
                        
						$('#error').fadeIn();                      
                        
                    }
                    

                }).fail(function(){
                    
                    console.log('error');
                
                })



                
            }else{
                alert('Todos los campos son requeridos')
            }
            
        })



    
    </script>


	</body>
</html>