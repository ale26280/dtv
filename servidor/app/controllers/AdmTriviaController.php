<?php

/*
 *
 * 		Controller para administracion de "triviaS"
 *
 */
class AdmtriviaController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'success' => 0, 'data' => array());

	Private $trivia = NULL;

	Private $respuestas = array(1=>1,2=>2,3=>3);
	
	

	/*
	
		CONTROL DE SESION
		
	*/
	Public function __construct() {
	
		# CONTROL DE PERMISOS - Si el usuario no es de perfil ADMINISTRADOR forzamos la salida
		
		if ( Auth::check() && Auth::user()->perfil_id == 1 ) {
		
			$this->usuario = Trivia::find( Auth::id() );

		} else {
		
			exit("No tiene permiso para acceder a este sitio");
		}
	}
	
	
	
	/*
	
		EXPORTACION COMPLETA
	
	*/
    Public function getExport( $element = 'trivia' ) {
	
		$elementos = $element::all();
		
		$path = 'storage/export/';
		$fileName = date("Y-m-d_h-i-s") . ".xls";
		
		touch($_SERVER['DOCUMENT_ROOT'] . "/" . $path . $fileName);
		
		$file = fopen($fileName, 'w');
		
		foreach ($elementos as $row) {
		
			$rowAr = $row->toArray();
			$rowEdit = array();
			
			# TITULOS
			
			foreach ($rowAr as $key => $value) {
			
				if ($key == "created_at" || $key == "updated_at") {
					continue;
				}
				
				$rowEdit[ $key ] = strtoupper($key);
				
			}
		
			fputcsv($file, $rowEdit, "\t");

			
			# DATOS
			
			foreach ($rowAr as $key => $value) {
			
				if ($key == "created_at" || $key == "updated_at") {
					continue;
				}
				
				$rowEdit[ $key ] = utf8_decode( $value );
				
			}
		
			fputcsv($file, $rowEdit, "\t");
		}
		

		
		fclose($file);
		
		$fp = fopen($fileName, "r");
		
		header("Content-type: application/octet-stream");
		header("Content-Disposition: attachment; filename=\"$fileName\"\n");

		fpassthru($fp);

		fclose($fp);
	}
	
	
	
	
	
	
	/*
	
		SLIDERS :: LISTAR
		
	*/
	Public function getListar() {
		
		$trivias = Trivia::all();
		
		return View::make('admin/trivia/listar')
			->with('registros', $trivias->toArray() );
	}
	
	
	
	/*
	
		EDITAR SLIDER :: VISTA
		
	*/
	Public function getEditar( $id ) {
	
		$trivia = Trivia::find( $id );
	
		$trivia = $trivia->toArray();
		

		# Vista
		
		return View::make('admin/trivia/editar')
			->with('registro', $trivia )
			->with('respuestas',$this->respuestas);
	}
	
	

	/*
	
		SLIDER AGREGAR :: VISTA
		
	*/
	Public function getAgregar() {	

		# Vista
		
		return View::make('admin/trivia/agregar')
					->with('respuestas',$this->respuestas);		
	}	
	
	
	
	/*
	
		SLIDER EDITAR :: POST
		
	*/
	Public function postEditar( $id ) {

	
		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'pregunta' => 'required',
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {	

			return Redirect::to( route('trivia_editar', $id) )
				->withErrors( $validation->messages() )
				->withInput();
		}		
		
		
		# Actualizacion del registro
		
		$trivia = Trivia::find( $id );
		$trivia->pregunta = $input['pregunta'];
		foreach ($this->respuestas as $i) {
		$r = 'res_'.$i;
		$trivia->$r = $input['res_'.$i];
		}
		$trivia->correcta = $input['correcta'];
		
		$trivia->save();
		
		return Redirect::to( route('trivia_listar') );
	}
	
	
	
	/*
	
		SLIDER AGREGAR :: POST
		
	*/
	Public function postAgregar() {

		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'pregunta' => 'required',
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {

			return Redirect::to( route('trivia_agregar') )
				->withErrors( $validation->messages() )
				->withInput();
		}
		
		
		# Actualizacion del registro
		
		$trivia = new trivia();
		$trivia->pregunta = $input['pregunta'];
		foreach ($this->respuestas as $i) {
		$r = 'res_'.$i;
		$trivia->$r = $input['res_'.$i];
		}
		$trivia->correcta = $input['correcta'];
	
		
		$trivia->save();
		
		
		# Vista
		
		return Redirect::to( route('trivia_listar') );
	}
	
	
	
	/*
	
		SLIDER BORRAR :: POST (ajax)
		
	*/
	Public function getBorrar( $id ) {
	
		try {
		
			# Busco el usuario
			
			$trivia = Trivia::find( $id );

			# Borro el usuario
			
			$trivia->delete();
		
		} catch (Exception $e) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = $e->getMessage();
		}

		
		# Respuesta
		
		$this->response['success'] = 1;
		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
	}
	

	//despues de cualquier accion genero file
	Public function __destruct()  {
		$configuracion = Configuracion::find( 1 );
		$configuracion->trivia_act = date('Y-m-d H:i:s');
		$configuracion->save();
		SvcGenericoController::generaFile('trivia');
		
	}





	
} // END CLASS


?>