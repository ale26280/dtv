<?php

/*
 *
 * 		Controller para administracion de "PORTFOLIO"
 *
 */
class AdmNewsletterController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'success' => 0, 'data' => array());

	Private $newsletter = NULL;
	
	

	/*
	
		CONTROL DE SESION
		
	*/
	Public function __construct() {
	
		# CONTROL DE PERMISOS - Si el usuario no es de perfil ADMINISTRADOR forzamos la salida
		
		if ( Auth::check() && Auth::user()->perfil_id == 1 ) {
		
			$this->usuario = Newsletter::find( Auth::id() );

		} else {
		
			exit("No tiene permiso para acceder a este sitio");
		}
	}
	
	/*
	
		EXPORTACION COMPLETA
	
	*/
    Public function getExport( $element = 'newsletter' ) {
	
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
		
		$newsletters = Newsletter::all();
		
		Return View::make('admin/newsletter/listar')
			->with('registros', $newsletters->toArray() );
	}
	
	
	
	/*
	
		EDITAR SLIDER :: VISTA
		
	*/
	Public function getEditar( $id ) {
	
		$newsletter = Newsletter::find( $id );
	
		$newsletter = $newsletter->toArray();
		

		# Vista
		
		Return View::make('admin/newsletter/editar')
			->with('registro', $newsletter );
	}
	
	

	/*
	
		SLIDER AGREGAR :: VISTA
		
	*/
	Public function getAgregar() {	

		# Vista
		
		Return View::make('admin/newsletter/agregar');		
	}	
	
	
	
	/*
	
		SLIDER EDITAR :: POST
		
	*/
	Public function postEditar( $id ) {

	
		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'nombre' => 'required',
			'correo' => 'required|email',
			'empresa' => 'required',
			'color' => ''
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {	

			Return Redirect::to( route('newsletter_editar', $id) )
				->withErrors( $validation->messages() )
				->withInput();
		}		
		
		
		# Actualizacion del registro
		
		$newsletter = Newsletter::find( $id );
		$newsletter->correo = $input['correo'];
		$newsletter->nombre = $input['nombre'];
		$newsletter->empresa = $input['empresa'];
		$newsletter->color = $input['color'];
		
		$newsletter->save();
		
		Return Redirect::to( route('newsletter_listar') );
	}
	
	
	
	/*
	
		SLIDER AGREGAR :: POST
		
	*/
	Public function postAgregar() {

		# Validacion
		
		$input = Input::all();
		
		$rules = array(
			'nombre' => 'required',
			'correo' => 'required|email',
			'empresa' => 'required',
			'color' => ''
		);
		
    	$validation = Validator::make($input, $rules);

		if ( $validation->fails() ) {

			Return Redirect::to( route('newsletter_agregar') )
				->withErrors( $validation->messages() )
				->withInput();
		}
		
		
		# Actualizacion del registro
		
		$newsletter = new Newsletter();
		$newsletter->correo = $input['correo'];
		$newsletter->nombre = $input['nombre'];
		$newsletter->empresa = $input['empresa'];
		$newsletter->color = $input['color'];
		
		$newsletter->save();
		
		
		# Vista
		
		Return Redirect::to( route('newsletter_listar') );
	}
	
	
	
	/*
	
		SLIDER BORRAR :: POST (ajax)
		
	*/
	Public function getBorrar( $id ) {
	
		try {
		
			# Busco el usuario
			
			$newsletter = Newsletter::find( $id );

			# Borro el usuario
			
			$newsletter->delete();
		
		} catch (Exception $e) {
		
			$this->response['error'] = 1;
			$this->response['error_message'] = $e->getMessage();
		}

		
		# Respuesta
		
		$this->response['success'] = 1;
		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
	}
	
	
} // END CLASS


?>