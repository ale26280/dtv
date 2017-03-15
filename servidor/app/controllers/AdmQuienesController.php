<?php

/*
 *
 * 		Controller para administracion de "quienesS"
 *
 */
class AdmquienesController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'success' => 0, 'data' => array());

	Private $quienes = NULL;

	Private $respuestas = array(1,2,3,4);
	
	

	/*
	
		CONTROL DE SESION
		
	*/
	Public function __construct() {
	
		# CONTROL DE PERMISOS - Si el usuario no es de perfil ADMINISTRADOR forzamos la salida
		
		if ( Auth::check() && Auth::user()->perfil_id == 1 ) {
		
			$this->usuario = quienes::find( Auth::id() );

		} else {
		
			exit("No tiene permiso para acceder a este sitio");
		}
	}
	
	
	
	/*
	
		EXPORTACION COMPLETA
	
	*/
    Public function getExport( $element = 'quienes' ) {
	
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
		
		$quieness = quienes::all();
		
		return View::make('admin/quienes/listar')
			->with('registros', $quieness->toArray() );
	}
	
	
	
	/*
	
		EDITAR SLIDER :: VISTA
		
	*/
	Public function getEditar( $id ) {
	
		$quienes = quienes::find( $id );
	
		$quienes = $quienes->toArray();
		

		# Vista
		
		return View::make('admin/quienes/editar')
			->with('registro', $quienes )
			->with('respuestas',$this->respuestas);
	}
	
	

	/*
	
		SLIDER AGREGAR :: VISTA
		
	*/
	Public function getAgregar() {	

		# Vista
		
		return View::make('admin/quienes/agregar')
		->with('respuestas',$this->respuestas);		
	}	
	
	
	
	/*
	
		SLIDER EDITAR :: POST
		
	*/
	Public function postEditar( $id ) {

	
		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'nombre' => 'required',
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {	

			return Redirect::to( route('quienes_editar', $id) )
				->withErrors( $validation->messages() )
				->withInput();
		}		
		

				if ( ($file = Input::file( 'img' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/quienes/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['img'] = $filename;
			}
		}
		

		


		# Actualizacion del registro
		
		$quienes = quienes::find( $id );
		$quienes->nombre = $input['nombre'];
		$quienes->img = $input['img'] != "" ? $input['img']:$quienes->img;
		
		foreach ($this->respuestas as $i) {
		$r = 'res_'.$i;
		$quienes->$r = $input['res_'.$i];
		}
		$quienes->correcta = $input['correcta'];
		
		
		
		$quienes->save();
		
		return Redirect::to( route('quienes_listar') );
	}
	
	
	
	/*
	
		SLIDER AGREGAR :: POST
		
	*/
	Public function postAgregar() {

		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'nombre' => 'required',
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {

			return Redirect::to( route('quienes_agregar') )
				->withErrors( $validation->messages() )
				->withInput();
		}
		

		if ( ($file = Input::file( 'img' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/quienes/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['img'] = $filename;
			}
		}
		

	
		


		# Actualizacion del registro
		
		$quienes = new quienes();
		$quienes->nombre = $input['nombre'];
		$quienes->img = $input['img'];
		
		foreach ($this->respuestas as $i) {
		$r = 'res_'.$i;
		$quienes->$r = $input['res_'.$i];
		}
		$quienes->correcta = $input['correcta'];

	
		
		$quienes->save();
		
		
		# Vista
		
		return Redirect::to( route('quienes_listar') );
	}
	
	
	
	/*
	
		SLIDER BORRAR :: POST (ajax)
		
	*/
	Public function getBorrar( $id ) {
	
		try {
		
			# Busco el usuario
			
			$quienes = quienes::find( $id );

			# Borro el usuario
			
			$quienes->delete();
		
		} catch (Exception $e) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = $e->getMessage();
		}

		
		# Respuesta
		
		$this->response['success'] = 1;
		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_quienes);
	}
	
	
} // END CLASS


?>