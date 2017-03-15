<?php

/*
 *
 * 		INSCRIPCION CONTROLLER
 *
 */
class InscripcionController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'success' => 0, 'data' => array());


	/*
	
		INSCRIPCION AL SISTEMA - Vista
		
	*/
	Public function getInscripcion() {
	
		Return View::make('inscripcion');
		
	}
	
	


	/*
	
		INSCRIPCION AL SISTEMA - Post
		
	*/
	Public function postInscripcion() {

		$input = Input::all();

		
		/*
				CONTROL DE ERRORES
		*/
    	$rules = array(
		    'nombre' => 'required',
		    'apellido'  => 'required',
			'email' => 'required|email',
			'email_confirm' => 'required|email',
			'password' => 'required|min:6',
			'password_confirm' => 'required|min:6',
			'codigo' => 'required|min:10|max:10',
			'acuerdo' => 'required'
		);
		

    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {	

			$mensajes = "";
			
			foreach ( $validation->messages()->all() as $msg ) {
				$mensajes .= $msg . "<br/>";
			}
		
			$this->response['error'] = 1;
			$this->response['error_message'] = $mensajes;
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}
		
		

		/*
				VALIDACION LOGICA
		*/
		
		try {
		
		# PASSWORD
		
		if ( $input['password'] != $input['password_confirm'] ) {
			$this->response['error'] = 1;
			$this->response['error_message'] = "Los passwords no coinciden";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}

		# EMAIL
		
		if ( $input['email'] != $input['email_confirm'] ) {
			$this->response['error'] = 1;
			$this->response['error_message'] = "Los emails no coinciden";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}
		
		
		# CODIGO EXISTENTE

		$codigo = Codigo::where('codigo', '=', $input['codigo'])->get();
		
		if ( count($codigo) != 1 ) {
			$this->response['error'] = 1;
			$this->response['error_message'] = "El codigo ingresado es invalido";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}
		
		
		# CODIGO EN USO
		
		if ( $codigo[0]->usuarios->count() > 0 ) {
			$this->response['error'] = 1;
			$this->response['error_message'] = "El codigo ingresado no esta disponible";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}
		
		

		/*
				INGRESO DE LA PETICION
		*/
		

		
		$inscripcion = new Inscripcion();
		
		$inscripcion->nombre = $input['nombre'];
		$inscripcion->apellido = $input['apellido'];
		$inscripcion->email = $input['email'];
		$inscripcion->codigo = $input['codigo'];
		$inscripcion->pass_hash = Hash::make( $input['password'] );
		$inscripcion->hash = md5( (string)time() );
		$inscripcion->time = time();
		$inscripcion->save();
		
		
		
		/*
				ENVIO DEL EMAIL
		*/
		

		require $_SERVER['DOCUMENT_ROOT'] . '/class/phpmailer/PHPMailerAutoload.php';

		$mail = new PHPMailer;

		$mail->isSMTP();                                      // Set mailer to use SMTP
		$mail->Host = 'mail.kood.com.ar';  				// Specify main and backup server
		$mail->SMTPAuth = true;                               // Enable SMTP authentication
		$mail->Username = 'envio@kood.com.ar';        // SMTP username
		$mail->Password = 'Envio2014';                           // SMTP password
		$mail->SMTPSecure = 'tls';                            // Enable encryption, 'ssl' also accepted
		
		$mail->From = 'no-reply@provincia.net';
		$mail->FromName = "P-NET BOX";
		$mail->addAddress($inscripcion->email, 'admin');  // Add a recipient
		
		$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
		$mail->isHTML(true);                                  // Set email format to HTML
		
		
		$subject = "Bienvenido a P-NET BOX!";
		$message = "
		Bienvenido a P-NET BOX<br/>
		<br/>
		Solamente queda un paso para confirmar tu cuenta.<br/>
		
		Hacé click en el link y disfrutá de 500 MB de storage:<br/>".
		route('inscripcion_confirmacion', array( $inscripcion->email, $inscripcion->codigo, $inscripcion->hash ) );

		$mail->Subject = $subject;
		$mail->Body    = $message;
		$mail->CharSet = 'UTF-8';
		$mail->send();
		
		
		
		} catch (Exception $e) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = $e->getMessage();
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}
		

		
		
		/*
				RESPUESTA EN LA VISTA
		*/
		$this->response['error'] = 0;
		$this->response['success'] = 1;

		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);

	}
	
	
	
	
	

	/*
	
		INSCRIPCION AL SISTEMA - Confirmacion
		
	*/
	Public function getConfirmacion( $email = null, $codigo = null, $hash = null ) {
	
		$error = 0;
		$error_message = "";
	
		$input = array(
			'email' => $email,
			'codigo' => $codigo,
			'hash' => $hash
		);

		
		/*
				CONTROL DE ERRORES
		*/
    	$rules = array(
			'email' => 'required|email',
			'hash' => 'required',
			'codigo' => 'required|min:10|max:10'
		);
		

    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {
			
			$error = 1;
			
			foreach ( $validation->messages()->all() as $msg ) {
				$error_message .= $msg . "<br/>";
			}
			
			Return View::make("confirmacion")
				->with("error", $error)
				->with("error_message", $error_message);

			return false;
		}
		
		
		
		/*
				VALIDACION LOGICA
		*/
		
		# Eliminamos inscripciones viejas (+ de 12 hs)
		
		Inscripcion::where('time', '<', time() - 43200)->delete();
		
		
		# Buscamos la inscripcion correspondiente
		
		$inscripcion = Inscripcion::where('codigo', '=', $input['codigo'])->where('email', '=', $input['email'])->where('hash', '=', $input['hash'])->get();

		if ( count($inscripcion) < 1 ) {		
			$error = 1;

			$error_message = "La operacion es invalida";

			
			Return View::make("confirmacion")
				->with("error", $error)
				->with("error_message", $error_message);

			return false;
		}
		
		
		# El codigo existe?
		
		$codigo = Codigo::where( 'codigo', '=', $input['codigo'])->get();
		
		if ( count($codigo) < 1 ) {
			$error = 1;

			$error_message = "Codigo invalido";

			
			Return View::make("confirmacion")
				->with("error", $error)
				->with("error_message", $error_message);

			return false;
		}
		
		
		# Creamos el nuevo usuario
		
		$usuario = new Usuario();
		
		$usuario->nombre = $inscripcion[0]->nombre;
		$usuario->apellido = $inscripcion[0]->apellido;
		$usuario->username = $inscripcion[0]->email;		
		$usuario->email = $inscripcion[0]->email;
		$usuario->password = $inscripcion[0]->pass_hash;
		$usuario->perfil_id = 2;
		$usuario->active = 1;

		$usuario->save();
		
		$usuario->remember_token = md5( $usuario->id . time() );
		
		$usuario->save();
		
		
		
		$usuario->codigo()->sync( array($codigo[0]->id, $usuario->id ) );
		$usuario->push();
		
		
		# Creamos el directorio raiz virtual
		
		$dir = new Directorio();
		$dir->directorio_id = 0;
		$dir->usuario_id = $usuario->id;
		$dir->save();
		
		
		# Creamos el directorio fisico
		
		@mkdir( $_SERVER['DOCUMENT_ROOT'] . "/storage/user".$usuario->id );
		
		
		# Limpiamos todo lo anterior
		
		foreach ( $inscripcion as $i ) {
			$i->delete();
		}

		Return View::make("confirmacion")
			->with("error", $error)
			->with("error_message", $error_message);
	}
	

	
	/*
	
		RECUPERACION DE CONTRASEÑA - Vista
		
	*/
	Public function getRecovery( $token ) {
	
		$usuario = Usuario::where("remember_token", "=", $token)->where("recovery", "=", 1)->get();
		
		if ( count($usuario) < 1 ) {
		
			exit("Error de validacion");
		
		}
	
		Return View::make("recovery")
			->with('id', $usuario[0]->id);	
	}
	
	
	
	/*
	
		RECUPERACION DE CONTRASEÑA - Post
		
	*/
	Public function postRecovery() {
		
		$input = Input::all();

		
		/*
				CONTROL DE ERRORES
		*/
    	$rules = array(
			'email' => 'required|email'
		);
		

    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = "Por favor, ingrese un email valido";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			exit();
		}
		
		
		
		/*
				VALIDACION LOGICA
		*/
			
		
		# Buscamos el usuario

		$usuario = Usuario::where('email', '=', $input['email'])->get();

		if ( count($usuario) < 1 ) {		
		
			$this->response['error'] = 1;
			$this->response['error_message'] = "El email ingresado no existe en la base de datos";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}
		
		
		# Pongo al usuario en estado "recovery"
		
		try {
		
			$usuario[0]->recovery = 1;
			$usuario[0]->remember_token = md5( time() . $usuario[0]->id );
			$usuario[0]->save();
			
			# Envio el token por email
			
			$token = $usuario[0]->remember_token;
			
			
			# Envio del correo
			
			require $_SERVER['DOCUMENT_ROOT'] . '/class/phpmailer/PHPMailerAutoload.php';
			

			$mail = new PHPMailer;

			$mail->isSMTP();                                      // Set mailer to use SMTP
			$mail->Host = 'mail.kood.com.ar';  				// Specify main and backup server
			$mail->SMTPAuth = true;                               // Enable SMTP authentication
			$mail->Username = 'envio@kood.com.ar';        // SMTP username
			$mail->Password = 'Envio2014';                           // SMTP password
			$mail->SMTPSecure = 'tls';                            // Enable encryption, 'ssl' also accepted
			
			$mail->From = 'no-reply@provincia.net';
			$mail->FromName = "P-NET BOX";
			$mail->addAddress($usuario[0]->email, 'admin');  // Add a recipient
			
			$mail->WordWrap = 50;                                 // Set word wrap to 50 characters
			$mail->isHTML(true);                                  // Set email format to HTML
			
			
			$subject = "Cambio de contraseña";
			$message = "
			Solicitaste que cambiemos tu contraseña, para continuar confirmar al siguiente link:<br/>" .
			route('recovery', $usuario[0]->remember_token );

			$mail->Subject = $subject;
			$mail->Body    = $message;
			$mail->CharSet = 'UTF-8';
			
			$mail->send();

		} catch ( Exception $e ) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = "Ha ocurrido un error al intentar recuperar la contraseña, por favor intente mas tarde";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}
		
		
		# Preparo la respuesta 
		
		$this->response['success']  = 1;
		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
		
	}
	
	
	
	/*
	
		RECUPERACION DE CONTRASEÑA - Post
		
	*/
	Public function postReset() {
	
		$input = Input::all();
		
		/*
				CONTROL DE ERRORES
		*/
    	$rules = array(
			'id' => 'required',
			'password' => 'required',
			'password_confirm' => 'required'			
		);
		

    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = "Por favor, ingrese un password valido";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			exit();
		}
		
		
		
		/*
				VALIDACION LOGICA
		*/

		# Passwords
		
		if ( $input['password'] != $input['password_confirm'] ) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = "Los passwords no coinciden";
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			exit();
			
		}
		
		
		try {

			# Buscamos el usuario
			
			$usuario = Usuario::find( $input['id'] );

			if ( !$usuario || $usuario->recovery != 1 ) {		
			
				$this->response['error'] = 1;
				$this->response['error_message'] = "El usuario no existe en la base de datos";
				echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
				
				exit();
			}

		
			# Reseteo el password
			
			$usuario->password = Hash::make( $input['password'] );
			$usuario->recovery = 0;
			$usuario->save();

		} catch ( Exception $e ) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = $e->getMessage();
			echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
			
			exit();
		}
		
		# Preparo la respuesta 
		
		$this->response['success']  = 1;
		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);

	}
	
} // END CLASS

?>
