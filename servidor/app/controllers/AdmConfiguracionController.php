<?php

/*
 *
 * 		Controller para administracion de "PORTFOLIO"
 *
 */
class AdmConfiguracionController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'success' => 0, 'data' => array());

	Private $configuracion = NULL;
	
	

	/*
	
		CONTROL DE SESION
		
	*/
	Public function __construct() {
	
		# CONTROL DE PERMISOS - Si el usuario no es de perfil ADMINISTRADOR forzamos la salida
		
		if ( Auth::check() && Auth::user()->perfil_id == 1 ) {
		
			$this->usuario = Configuracion::find( Auth::id() );

		} else {
		
			exit("No tiene permiso para acceder a este sitio");
		}
	}
	
	
	

	
	/*
	
		EDITAR SLIDER :: VISTA
		
	*/
	Public function getEditar( $id ) {
	
		$configuracion = Configuracion::find( $id )->toArray();
		

		# Vista
		
		return View::make('admin/configuracion/editar')
			->with('registro', $configuracion );
	}
	


	/*
	
		EDITAR TERINOS
		
	*/
	Public function getEditarTerminos( $id ) {
	
		$terminos = Terminos::find( $id );
		
		//dd($terminos);
		# Vista
		
		return View::make('admin/configuracion/terminos')
			->with('registro', $terminos );
	}

	
	
	/*
	
		SLIDER EDITAR :: POST
		
	*/
	Public function postEditar( $id ) {

	
		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'titulo' => 'required',
			'descripcion' => '',
			'metadatos' => '',
			'analytics' => '',
			'correo_nuevo_registro' => 'email',
			'correo_alertas' => 'email',
			'memo_test' => '',
			'que_fue' => '',
			'que_es' => '',
			'trivia' => '',
			
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {	

			return Redirect::to( route('configuracion_editar', $id) )
				->withErrors( $validation->messages() )
				->withInput();
		}		
		
		if ( ($file = Input::file( 'video_promo' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/videos/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['video_promo'] = $filename;
			}
		}
		


		if ( ($file = Input::file( 'video_buen_resultado' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/videos/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['video_buen_resultado'] = $filename;
			}
		}
		

		if ( ($file = Input::file( 'video_mal_resultado' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/videos/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['video_mal_resultado'] = $filename;
			}
		}


		
		/** PROCESAR LA URL DE VIDEO Y DISTINGUIR VIMEO / YOUTUBE 
		
		$videoCode = "";
		$videoSitio = "";
		$arUrl = explode("/", $input['video']);
		
		if ( strlen($arUrl[ count($arUrl) - 1 ]) == 8 && is_numeric( $arUrl[ count($arUrl) - 1 ] ) ) {
			
			$videoCode = $arUrl[ count($arUrl) - 1 ];
			$videoSrc = "vimeo";
		
		} else {
		
			$arUrl = explode("=", $arUrl[ count($arUrl) - 1 ]);
			
			if ( strlen($arUrl[ count($arUrl) - 1 ]) == 11 ) {
			
				$videoCode = $arUrl[ count($arUrl) - 1 ];
				$videoSrc = "youtube";
				
			} else {
			
				$this->response['error'] = '1';
				$this->response['error_message'] = $arUrl[ count($arUrl) - 1 ];
				echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
				exit();
			}
		
		}
		
		unset($arUrl);
		**/
			
		
		# Actualizacion del registro
		
		$configuracion = Configuracion::find( $id );
		$configuracion->titulo = $input['titulo'];
		$configuracion->descripcion = $input['descripcion'];
		$configuracion->metadatos = $input['metadatos'];
		$configuracion->analytics = $input['analytics'];
		$configuracion->correo_nuevo_registro = $input['correo_nuevo_registro'];
		$configuracion->correo_alertas = $input['correo_alertas'];
		$configuracion->memo_test = isset($input['memo_test']) ? $input['memo_test'] : 0;
		$configuracion->que_es = isset($input['que_es']) ? $input['que_es'] : 0;
		$configuracion->que_fue = isset($input['que_fue']) ? $input['que_fue'] : 0;
		$configuracion->trivia = isset($input['trivia']) ? $input['trivia'] : 0;

		$configuracion->video_promo = $input['video_promo'] != "" ? $input['video_promo']:$configuracion->video_promo;
		$configuracion->video_promo_act =   $input['video_promo'] != "" ? date('Y-m-d H:i:s') : $configuracion->video_promo_act;

		$configuracion->video_buen_resultado = $input['video_buen_resultado'] != "" ? $input['video_buen_resultado']:$configuracion->video_buen_resultado;
		$configuracion->video_buen_resultado_act =   $input['video_buen_resultado'] != "" ? date('Y-m-d H:i:s') : $configuracion->video_buen_resultado_act;

		$configuracion->video_mal_resultado = $input['video_mal_resultado'] != "" ? $input['video_mal_resultado']:$configuracion->video_mal_resultado;
		$configuracion->video_mal_resultado_act = $input['video_mal_resultado'] != "" ? date('Y-m-d H:i:s') :$configuracion->video_mal_resultado_act;
	
		
		$configuracion->save();
		
		return Redirect::to( route('configuracion_editar', 1) );
	}
	
	
	


		Public function postEditarTerminos( $id ) {

	
		# Validacion
		
		$input = Input::all();
		

		
		$terminos = Terminos::find( $id );
		$terminos->terminos_usuarios = $input['terminos_usuarios'];
		$terminos->terminos_registros = $input['terminos_registros'];

		$terminos->save();
		
		return Redirect::to( route('configuracion_terminos', 1) );
	}
	







	
	
} // END CLASS


?>