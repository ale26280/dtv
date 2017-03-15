<?php

/*
 *
 * 		SERVICIOS CONTROLLER
 *
 */
Class LoginController extends BaseController {


	Public function getUser() {

		$arEstados = array(1 => 'Activo',0 => 'Inctivo',2 => 'Pendiente de activación');
		
    	$input = array(
    		'username' => Input::get('user'),
    		'password' => Input::get('pass')
    	);

    	$rules = array(
		    'username' => 'required',
		    'password'  => 'required'

		);
		

    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() )
		{	
    		return Response::json( $validation->messages() ) ;
		}
  
  
    	if ( Auth::attempt( $input ) )
    	{
		
			if ( Auth::user()->perfil_id == 2 ) {
				$r = Auth::user()->active==1 ? 'Activo' : 'Su usuario se encuentra '.$arEstados[Auth::user()->active];
				return Response::json( array('respuesta' => $r) ) ;
				
			}
    	}
		
    	$wrong_user = "El usuario o la contraseña son incorrectos.";
    			return Response::json( array('respuesta' => $wrong_user) ) ;
	

	}

	


	Public function postUser(){
		$input = Input::all();
		//dd($input);

		$existe = Usuario::where('email','=',Input::get('correo_u'))->count();

		if($existe!=0){
			return Response::json( array('respuesta' => 'El correo ya está ingresado.') ) ;
			exit();
		}

		$inscripcion = new Usuario();
		$inscripcion->perfil_id = 2;
		$inscripcion->active = 2;
		$inscripcion->username = $input['correo_u'];
		$inscripcion->nombre = $input['nombre_u'];
		$inscripcion->apellido = $input['apellido_u'];
		$inscripcion->email = $input['correo_u'];
		$inscripcion->dni = $input['dni_u'];
		$inscripcion->celtrabajo = $input['celtrabajo_u'];
		//$inscripcion->provincia = $input['provincia_u'];
		//$inscripcion->localidad = $input['localidad_u'];
		$inscripcion->password = Hash::make( $input['password_u'] );
		$inscripcion->created_at = time();
		if($inscripcion->save()){

			# Envio al adminsitrador infroma nuevo usuario
			
			
			$asunto = 'DIRECTV Nuevo usuario';
			$conf = Configuracion::find( 1 );
			$correo = $conf->correo_nuevo_registro;
			$destinatario = 'Adminsitrador';
			$data = array('idregistro' => $inscripcion->id,'destinatario' => $destinatario);
			$correoEnvia = 'no-reply@directv.com.ar';
			$envia  = Mail::send('emails.nuevousuario',$data, function($message) use ($asunto,$correoEnvia,$destinatario,$correo){
    			$message->to( $correo, $destinatario )->replyTo($correoEnvia, $destinatario)->subject($asunto);

			});


			$r = 'Ok';
		}else{
			$r = 'Error al crear usuario';
		}

		return Response::json( array('respuesta' => $r) ) ;

	}




	Public function getRecuperacorreo(){
		//dd(Input::all());
		$correo = Input::get('correorecupera');
		//se fija si existe correo 
		$usuario = Usuario::where("email", "=", $correo)->get();

		if(count($usuario)==1){
			//si exite envia correo con link y token
		
			$usuario[0]->recovery = 1;
			$usuario[0]->remember_token = md5( time() . $usuario[0]->id );
			$usuario[0]->save();

			# Envio el token por email
			
			$token = $usuario[0]->remember_token;
			$asunto = 'DIRECTV restablecer contraseña';
			$correo = $usuario[0]->email;
			$destinatario = $usuario[0]->nombre.' '.$usuario[0]->apellido;
			$data = array('destinatario' => $destinatario,'token'=>$token);
			$correoEnvia = 'no-reply@directv.com.ar';
			$envia  = Mail::send('emails.recupera',$data, function($message) use ($asunto,$correoEnvia,$destinatario,$correo){
    			$message->to( $correo, $destinatario )->replyTo($correoEnvia, $destinatario)->subject($asunto);

			});


			if($envia){
			$r = 'Ok';//'Se ha enviado un correo para recuper la contraseña';
			}else{
			$r = 'Hubo un error al enviar el correo. Por favor inténtelo en otro momento.';
			}



		}else{
			$r = 'El correo no existe';
		}

		

		return Response::json( array('respuesta' => $r) ) ;

	}





	/*
	
		RECUPERACION DE CONTRASEÑA - Vista
		
	*/
	Public function getToken( $token ) {
	
		$usuario = Usuario::where("remember_token", "=", $token)->where("recovery", "=", 1)->get();
		
		if ( count($usuario) < 1 ) {
		
			return View::make("emails.error");	
		
		}
	
		return View::make("emails.nuevopass")
			->with('id', $usuario[0]->id);	
	}
	





	/*
	
		RECUPERACION DE CONTRASEÑA - Post
		
	*/
	Public function postReset() {
		
		$input = Input::all();
		//dd($input);

		
		/*
				CONTROL DE ERRORES
		*/
    	$rules = array(
			'id' => 'required',
			'password' => 'required',
			'repassword' => 'required'			
		);
		

    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {
		
			return Response::json( array('respuesta' => 'Error') ) ;
		}
		
		
		
		/*
				VALIDACION LOGICA
		*/

		# Passwords
		
		if ( $input['password'] != $input['repassword'] ) {
		
			return Response::json( array('respuesta' => 'Error') ) ;
			
		}
		
		
		

			# Buscamos el usuario
			
			$usuario = Usuario::find( $input['id'] );

			if ( !$usuario || $usuario->recovery != 1 ) {		
			
				return Response::json( array('respuesta' => 'Error') ) ;
			}

		
			# Reseteo el password
			
			$usuario->password = Hash::make( $input['password'] );
			$usuario->recovery = 0;
			$usuario->save();

		
		
		# Preparo la respuesta 
		
		return Response::json( array('respuesta' => 'Ok') ) ;

	}










} // END CLASS


?>