<?php

class ExportController extends Controller {    



	/*
	
		EXPORTACION COMPLETA XLS
	
	*/
    Public function getExportXls2( $element ) {


    	/* Paginacion */
    	$porPagina = 50;
    	$totalRegistros = $element::count();
    	$paginas = $totalRegistros > $porPagina ? ceil( $totalRegistros / $porPagina ):1;
    	$procesados = 0;


    	/* Exportacion */
		$tabla_nombre = with(new $element)->getTable();
		$fileName = 'export/' . $element . "_" . time() . ".xls";
		$content = '';


		/* Obtengo los campos de la tabla con la que voy a trabajar */
		$campos = Campo::where('tabla',$tabla_nombre)->get()->toArray();
		$totalCampos = count($campos);



		/* Recorrido */
    	for ( $x=0; $x<$paginas; $x++ ) {
			
    		$registrosPagina = DB::Select("SELECT * FROM `". $tabla_nombre ."` LIMIT ".$procesados.",".$porPagina);
			//$registrosPagina = $element::take( $porPagina )->skip( $procesados )->get()->toArray();
			$procesados += $porPagina;


			if ( count($registrosPagina) > 0 ) {


				foreach ( $registrosPagina as $elemento ) {


					# Si no creo nada aun, crea titulos
					if( $content == '' ){
						$content .= '<table><tr>';



						

							
					foreach ( $elemento as $key => $val ) {

							if( $key == 'contenido_id' || $key == 'created_at' || $key == 'updated_at') {
								continue;
							}


							if ( $key == "file" || $key == "image"  || $key == "foto") {

								$content .= "<td>" . ucfirst( $key ) . "</td>";

							} else if( strpos( $key, 'pais_')  > -1 ) {

								$campoVisual = str_replace('_id','_nombre', $key);
								$content .= "<td>" . ucfirst($campoVisual) . "</td>";

							}else{

							# Agrega campo normal
								$content .= "<td>" . ucfirst( $key ) . "</td>";
								$content .= "";
							}

						}

						$content .= '</tr>';
					}




					# Crea contenido
					$content .= '<tr>';

					foreach ( $elemento as $key => $val ) {

						if( $key == 'contenido_id' || $key == 'created_at' || $key == 'updated_at') {
							continue;
						}




						if ( $key == "file" || 
							 $key == "image" || 
							 $key == "foto" || 
							 $key == 'autorizacion1' || 
							 $key == 'autorizacion2' || 
							 $key == 'fotoobra1' || 
							 $key == 'fotoobra2' || 
							 $key == 'fotoobra3' ||
							 $key == 'foto1' ||
							 $key == 'foto2' ||
							 $key == 'foto3' ||
							 $key == 'foto4' ||
							 $key == 'logo' ||
							 $key == 'postal' ||
							 $key == 'imagen_seleccionada' ||
							 $key == 'constancia') {

							if( $val ){

								$content .= "<td><a href='http://".$_SERVER['SERVER_NAME']."/descargar_file". $val."' download='file_". $elemento->id ."_".$val."'>Descargar ". $val ."</a></td>";
								//$content .= "<td><a href='http://festivales.buenosaires.gob.ar/descargar_file". $val."' download='file_". $elemento->id ."_".$val."'>Descargar ". $val ."</a></td>";
							} else {

								$content .= "<td></td>";
							}								

						} else if( strpos( $key, 'pais_')  > -1 ){

							$campoVisual = str_replace('_id','_nombre', $val );
							$content .= "<td>" . ucfirst($campoVisual) . "</td>";

						}else{

						# Agrega campo normal
							$content .= "<td>" . ucfirst( $val ) . "</td>";
							$content .= "";
						}

						
					}

					$content .= '</tr>';

				}
			}

    	}



		$content .= '</table>';

		# Imprime contenido
 		header('Content-type: application/ms-excel');
		header("Content-Disposition: attachment; filename=$fileName");
		header("Pragma: no-cache");
		header("Expires: 0");

		# Convierte de UTF-8 (DB) a Windows-1252 (Excel). Para los acentos y demas
		//$content = iconv("UTF-8", "Windows-1252", $content);
		$content = iconv("UTF-8", "windows-1252//TRANSLIT//IGNORE", $content);
		
		echo $content;
	}




	Public function getExportXls($element) {
	
		$parejas = Registros::all();
		
		$fileName = 'export/r_' . time() . ".csv";

		$content = '';

		foreach ($parejas as $elemento) {

			# Si no creo nada aun, crea titulos
			if( $content == '' ){

				foreach ($elemento->toArray() as $key => $value) {

					# Agrega campo normal
					$content .= $key;
					$content .= ';';
				}

				$content .= "\r\n";
			}

			# Crea contenido
			foreach ($elemento->toArray() as $key => $value) {

				$content .= '' . utf8_decode(  $value  ) . ';';

			}

			$content .= "\r\n";		
		}		

		# Imprime contenido
 		//header('Content-type: application/ms-excel');
 		header('Content-Type: text/csv');
		header("Content-Disposition: attachment; filename=$fileName");
		header("Pragma: no-cache");
		header("Expires: 0");

		# Convierte de UTF-8 (DB) a Windows-1252 (Excel). Para los acentos y demas
		#$content = iconv("UTF-8", "Windows-1252", $content);

		echo $content;
	}






	}