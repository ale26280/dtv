<?php

class AdmRegistrosController extends BaseController {

	Public function getListar() {
		
		$registros = Registros::orderBy('id','desc')->get();
		
		return View::make('admin/registros/listar')
			->with('registros', $registros );
	}


	Public function ingresa(){

			$datos = Input::get('reg');
			$manage = (array) json_decode($datos,true);

			//dd($manage);

			foreach ($manage as $registros){
				//print_r($registros);
				/*
				$query = DB::table("registros");
				
				foreach ($registros as $key => $value) {
					echo $key .' => '.$value.'<br>';
					$query->where($key,$value);
				}
				$todos =  $query->count();
				echo $todos.'------------<br>';
				*/
				$ex = Registros::where('id_registro_device','=',$registros['id_registro_device'])->where('usuario','=',$registros['usuario'])->count();
				//echo $registros['id_registro_device'];
				//echo $ex.'------------<br>';
				if($ex==0){
				DB::table("registros")->insert($registros);
				}
				/*
				foreach ($registros as $registro) {
					echo $registro.'<br>';
				}
				echo '------------<br>';
				*/

			}



	}




	Public function consulta(){

		//dd(Input::get('origen'));

		return Registros::where('usuario','=',Input::get('usuario'))->count();
	}



	Public function postFoto(){
		
	$ruta = "storage/fotos/". $_POST['unico'] .'/';
	//mkdir("storage/fotos/".$_POST['unico'],777);
	$path = "storage/fotos/".$_POST['unico'];
	if(!is_dir($path)){
  	mkdir($path);
	}

	$nombre_imagen =  $_FILES["file"]["name"];
   	move_uploaded_file($_FILES["file"]["tmp_name"], $ruta.$nombre_imagen);

	}
	

	Public function descarga($file){
		$pathToFile = 'storage/fotos/'.$file;
		return Response::download($pathToFile);

	}
	


}


?>