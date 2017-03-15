<?php

/*
 *
 * 		Controller para administracion de "quefueS"
 *
 */
class AdmQuefueController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'success' => 0, 'data' => array());

	Private $quefue = NULL;

	Private $respuestas = array(1,2,3,4);
	
	

	/*
	
		CONTROL DE SESION
		
	*/
	Public function __construct() {
	
		# CONTROL DE PERMISOS - Si el usuario no es de perfil ADMINISTRADOR forzamos la salida
		
		if ( Auth::check() && Auth::user()->perfil_id == 1 ) {
		
			$this->usuario = quefue::find( Auth::id() );

		} else {
		
			exit("No tiene permiso para acceder a este sitio");
		}
	}
	
	
	
	/*
	
		EXPORTACION COMPLETA
	
	*/
    Public function getExport( $element = 'quefue' ) {
	
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
		
		$quefues = quefue::all();
		
		return View::make('admin/quefue/listar')
			->with('registros', $quefues->toArray() );
	}
	
	
	
	/*
	
		EDITAR SLIDER :: VISTA
		
	*/
	Public function getEditar( $id ) {
	
		$quefue = quefue::find( $id );
	
		$quefue = $quefue->toArray();
		

		# Vista
		
		return View::make('admin/quefue/editar')
			->with('registro', $quefue );
	}
	
	

	/*
	
		SLIDER AGREGAR :: VISTA
		
	*/
	Public function getAgregar() {	

		# Vista
		
		return View::make('admin/quefue/agregar');		
	}	
	
	
	
	/*
	
		SLIDER EDITAR :: POST
		
	*/
	Public function postEditar( $id ) {

	
		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'tema' => 'required',
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {	

			return Redirect::to( route('quefue_editar', $id) )
				->withErrors( $validation->messages() )
				->withInput();
		}		
		

		if ( ($file = Input::file( 'video' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/quefue/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['video'] = $filename;
			}
		}
		

		


		# Actualizacion del registro
		
		$quefue = quefue::find( $id );
		$quefue->tema = $input['tema'];
		$quefue->video = $input['video'] != "" ? $input['video']:$quefue->video;
		$quefue->fue =  isset($input['fue']) ? $input['fue'] : 0;
		
		
		
		$quefue->save();
		
		return Redirect::to( route('quefue_listar') );
	}
	
	
	
	/*
	
		SLIDER AGREGAR :: POST
		
	*/
	Public function postAgregar() {

		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'tema' => 'required',
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {

			return Redirect::to( route('quefue_agregar') )
				->withErrors( $validation->messages() )
				->withInput();
		}
		

		if ( ($file = Input::file( 'video' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/quefue/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['video'] = $filename;
			}
		}
		

	
		


		# Actualizacion del registro
		
		$quefue = new quefue();
		$quefue->tema = $input['tema'];
		$quefue->video = $input['video'] != "" ? $input['video']:'';
		$quefue->fue =  isset($input['fue']) ? $input['fue'] : 0;

	
		
		$quefue->save();
		
		
		# Vista
		
		return Redirect::to( route('quefue_listar') );
	}
	
	
	
	/*
	
		SLIDER BORRAR :: POST (ajax)
		
	*/
	Public function getBorrar( $id ) {
	
		try {
		
			# Busco el usuario
			
			$quefue = quefue::find( $id );

			# Borro el usuario
			
			$quefue->delete();
		
		} catch (Exception $e) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = $e->getMessage();
		}

		
		# Respuesta
		
		$this->response['success'] = 1;
		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_quefue);
	}
	
	
} // END CLASS


?>