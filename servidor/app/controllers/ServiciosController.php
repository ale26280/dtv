<?php

/*
 *
 * 		SERVICIOS CONTROLLER
 *
 */
Class ServiciosController extends BaseController {

	Private $response = array('error' => 0, 'error_message' => '', 'total' => 0, 'totalRegistros' => 0, 'data' => array());
	
	Private $usuario = NULL;
	
	
	
	/*
	
		CONTROL DE SESION
		
	*/
	Public function __construct() {
	
		if ( !Auth::check() )
		{			
			exit("Debe ingresar al sistema");
		}
		
		$this->usuario = Usuario::find( Auth::id() );
		
		return true;
	}
	

	/*
	
		LISTAR DIRECTORIO - Genero un listado de todos los archivos y directorios en un directorio dado
	
	*/
	Public function getListado( $dirId = NULL ) {
	
	
		# Si no recibo un ID de directorio, busco el directorio RAIZ del usuario
		
		if ( $dirId === NULL ) {
		
			$raiz = $this->usuario->directorios()->where('directorio_id', '=', 0)->get();
			$dirId = $raiz[0]->id;
			
			unset($raiz);
		}
		
		
		
		# Busco el directorio por ID
		
		$directorio = $this->usuario->directorios->find( $dirId );
		
		
		
		# Genero el listado de directorios y archivos
		
		$listado = array( 'directorios' => array(), 'archivos' => array() );
	
		foreach ( $directorio->directorios as $dir ) {
		
			$tmp = $dir->toArray();
			
			$tmp['nombre_full'] = $tmp['nombre'];
			
			if ( strlen($tmp['nombre']) > 15 ) {
				$tmp['nombre'] = substr($tmp['nombre'], 0, 15) . "...";
			}
			
			$listado['directorios'][] = $tmp;
			
		}

		foreach ( $directorio->archivos as $file) {
		
			$tmp = $file->toArray();
			
			$tmp['nombre_full'] = $tmp['nombre'];
			$tmp['download'] = route('descarga', array($tmp['hash']) );
			
			if ( strlen($tmp['nombre']) > 15 ) {
				$tmp['nombre'] = substr($tmp['nombre'], 0, 15) . "...";
			}
		
			$listado['archivos'][] = $tmp;
			
		}
		
		
		# Buscamos el PATH
		
		$raiz = $directorio->directorio_id;
		$path = array();
		
		$path[] = array(
			'id' => $directorio->id,
			'nombre' => $directorio->nombre
		);
		
		while ( $raiz != 0 ) {
		
			$path[] = array(
				'id' => $this->usuario->directorios->find( $raiz )->id,
				'nombre' => $this->usuario->directorios->find( $raiz )->nombre
			);
			
			$raiz = $this->usuario->directorios->find( $raiz )->directorio_id;
		}
		
		$path = array_reverse( $path );
		
		
		# Paso los datos a la respuesta
		
		$this->response['data'] = $listado;
		$this->response['current_id'] = $dirId;
		$this->response['directorio_id'] = $directorio->directorio_id;
		$this->response['path'] = $path;
	}



	
	
	
	/*
	
		DESTRUIR OBJETO - Al final de cualquier servicio imprimo un JSON
	
	*/
	Public function __destruct()  {
	
		echo json_encode($this->response, JSON_HEX_QUOT | JSON_HEX_TAG);
		
	}
	
	
} // END CLASS


?>