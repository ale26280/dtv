<?php

/*
 *
 * 		Controller para administracion de "memotestS"
 *
 */
class AdmMemotestController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'success' => 0, 'data' => array());

	Private $memotest = NULL;

	Private $respuestas = array(1,2,3,4);
	
	

	/*
	
		CONTROL DE SESION
		
	*/
	Public function __construct() {
	
		# CONTROL DE PERMISOS - Si el usuario no es de perfil ADMINISTRADOR forzamos la salida
		
		if ( Auth::check() && Auth::user()->perfil_id == 1 ) {
		
			$this->usuario = memotest::find( Auth::id() );

		} else {
		
			exit("No tiene permiso para acceder a este sitio");
		}
	}
	
	
	
	/*
	
		EXPORTACION COMPLETA
	
	*/
    Public function getExport( $element = 'memotest' ) {
	
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
		
		$memotests = memotest::all();
		
		return View::make('admin/memotest/listar')
			->with('registros', $memotests->toArray() );
	}
	
	
	
	/*
	
		EDITAR SLIDER :: VISTA
		
	*/
	Public function getEditar( $id ) {
	
		$memotest = memotest::find( $id );
	
		$memotest = $memotest->toArray();
		

		# Vista
		
		return View::make('admin/memotest/editar')
			->with('registro', $memotest );
	}
	
	

	/*
	
		SLIDER AGREGAR :: VISTA
		
	*/
	Public function getAgregar() {	

		# Vista
		
		return View::make('admin/memotest/agregar');		
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

			return Redirect::to( route('memotest_editar', $id) )
				->withErrors( $validation->messages() )
				->withInput();
		}		
		

				if ( ($file = Input::file( 'img1' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/memotest/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['img1'] = $filename;
			}
		}
		

		if ( ($file = Input::file( 'img2' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/memotest/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['img2'] = $filename;
			}
		}
		


		# Actualizacion del registro
		
		$memotest = memotest::find( $id );
		$memotest->tema = $input['tema'];
		$memotest->img1 = $input['img1'] != "" ? $input['img1']:$memotest->img1;
		$memotest->img2 = $input['img2'] != "" ? $input['img2']:$memotest->img2;
		
		
		
		$memotest->save();
		
		return Redirect::to( route('memotest_listar') );
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

			return Redirect::to( route('memotest_agregar') )
				->withErrors( $validation->messages() )
				->withInput();
		}
		

		if ( ($file = Input::file( 'img1' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/memotest/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['img1'] = $filename;
			}
		}
		

		if ( ($file = Input::file( 'img2' )) ) {
			$extension = $file->getClientOriginalExtension();

			$destinationPath = 'storage/memotest/';
			$filename = md5( Auth::user()->id . microtime() ) . "." . $extension;		
			$uploadSuccess = $file->move($destinationPath, $filename);
			
			if ( $uploadSuccess ) {
				$input['img2'] = $filename;
			}
		}
		


		# Actualizacion del registro
		
		$memotest = new memotest();
		$memotest->tema = $input['tema'];
		$memotest->img1 = $input['img1'];
		$memotest->img2 = $input['img2'];

	
		
		$memotest->save();
		
		
		# Vista
		
		return Redirect::to( route('memotest_listar') );
	}
	
	
	
	/*
	
		SLIDER BORRAR :: POST (ajax)
		
	*/
	Public function getBorrar( $id ) {
	
		try {
		
			# Busco el usuario
			
			$memotest = memotest::find( $id );

			# Borro el usuario
			
			$memotest->delete();
		
		} catch (Exception $e) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = $e->getMessage();
		}

		
		# Respuesta
		
		$this->response['success'] = 1;
		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_memotest);
	}
	
	
} // END CLASS


?>