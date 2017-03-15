<?php

/*
 *
 * 		Controller General de Administracion de Contenidos
 *
 */
class AdmMainController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'success' => 0, 'data' => array());

	Private $usuario = NULL;

	

	/*
	
		CONTROL DE SESION
		
	*/
	Public function __construct() {
	
		# CONTROL DE PERMISOS - Si el usuario no es de perfil ADMINISTRADOR forzamos la salida
		
		if ( Auth::check() && Auth::user()->perfil_id == 1 ) {
		
			$this->usuario = Usuario::find( Auth::id() );

		} else {
		
			exit("No tiene permiso para acceder a este sitio");
		}
	}
	
	
	
	/*
	
		DASHBOARD del CMS
		
	*/
	Public function getDashboard() {
		
		//$totalFichas = Ficha::count();
		$totalUsers = Usuario::count();
		//$totalRegistros = Registros::count();  $totalRegistros
		//dd($totalUsers);
		return View::make('admin/dashboard')
			//->with('fichas', $totalFichas)
			->with('users', $totalUsers)
			->with('registros','')
			;
	}
	
	
	
} // END CLASS


?>