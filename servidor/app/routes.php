<?php

/*
|--------------------------------------------------------------------------
| Aplicacion
|--------------------------------------------------------------------------
|
*/

//Route::get('/', 'FrontController@getHome');		# Landing page


Route::get('/', function() {

	if( Auth::guest() ){
		return Redirect::to('adm/login');
	}else{
		return Redirect::to('adm/dashboard');
	}

});

Route::get('/login', function() {

	if( Auth::guest() ){
		return Redirect::to('adm/login');
	}else{
		return Redirect::to('adm/dashboard');
	}

});


Route::get('portfolio/{id}', array('as' => 'portfolio_ver', 'uses' =>'FrontController@getPortfolio') );		# Porfolio work
Route::post('contacto', array('as' => 'contacto', 'uses' =>'FrontController@postContacto') );		# Contacto post
Route::post('newsletter', array('as' => 'newsletter', 'uses' =>'FrontController@postNewsletter') );		# Newsletter post
Route::any('fichas/{cat}/{index}', array('as' => 'fichas_pag', 'uses' =>'FrontController@getFichas') );		# Fichas paginadas



/*
|--------------------------------------------------------------------------
| Administrador
|--------------------------------------------------------------------------
*/

Route::group( array('before' => 'auth' ), function() {

	Route::get('adm/dashboard', array('as' => 'dashboard', 'uses' => 'AdmMainController@getDashboard') );

	# MODULO 'usuarios'
	
	Route::get('adm/usuarios', array('as' => 'usuario_listar', 'uses' => 'AdmAdministradorController@getListar') );
	Route::get('adm/usuarios/agregar', array('as' => 'usuario_agregar', 'uses' => 'AdmAdministradorController@getAgregar') );
	Route::post('adm/usuarios/agregar', array('as' => 'usuario_agregar_post', 'uses' => 'AdmAdministradorController@postAgregar') );	
	Route::get('adm/usuarios/{id}', array('as' => 'usuario_editar', 'uses' => 'AdmAdministradorController@getEditar') );
	Route::post('adm/usuarios/{id}/editar', array('as' => 'usuario_editar_post', 'uses' =>'AdmAdministradorController@postEditar') );
	Route::get('adm/usuarios/{id}/borrar', array('as' => 'usuario_borrar', 'uses' => 'AdmAdministradorController@getBorrar') );
	
	# MODULO 'Fichas'
	
	Route::get('adm/fichas', array('as' => 'ficha_listar', 'uses' => 'AdmFichaController@getListar') );
	Route::get('adm/fichas/agregar', array('as' => 'ficha_agregar', 'uses' => 'AdmFichaController@getAgregar') );
	Route::post('adm/fichas/agregar', array('as' => 'ficha_agregar_post', 'uses' => 'AdmFichaController@postAgregar') );	
	Route::get('adm/fichas/{id}', array('as' => 'ficha_editar', 'uses' => 'AdmFichaController@getEditar') );
	Route::post('adm/ficha/{id}/editar', array('as' => 'ficha_editar_post', 'uses' =>'AdmFichaController@postEditar') );
	Route::get('adm/fichas/{id}/borrar', array('as' => 'ficha_borrar', 'uses' => 'AdmFichaController@getBorrar') );
	
	Route::any('adm/fichas/video/agregar/{ficha_id?}', array('as' => 'ficha_video_agregar', 'uses' => 'AdmFichaController@postVideoAgregar') );				
	Route::any('adm/fichas/foto/agregar/{ficha_id?}', array('as' => 'ficha_foto_upload', 'uses' => 'AdmFichaController@postFotoUpload') );			
	Route::post('adm/fichas/video/reordenar/{tipo?}', array('as' => 'ficha_video_reordenar', 'uses' => 'AdmFichaController@postVideosReorder') );	
	Route::post('adm/fichas/foto/reordenar/{tipo?}', array('as' => 'ficha_foto_reordenar', 'uses' => 'AdmFichaController@postFotosReorder') );	

	
	# MODULO 'Sliders'
	
	Route::get('adm/sliders', array('as' => 'slider_listar', 'uses' => 'AdmSliderController@getListar') );
	Route::get('adm/sliders/agregar', array('as' => 'slider_agregar', 'uses' => 'AdmSliderController@getAgregar') );
	Route::post('adm/sliders/agregar', array('as' => 'slider_agregar_post', 'uses' => 'AdmSliderController@postAgregar') );	
	Route::get('adm/sliders/{id}', array('as' => 'slider_editar', 'uses' => 'AdmSliderController@getEditar') );
	Route::post('adm/slider/{id}/editar', array('as' => 'slider_editar_post', 'uses' =>'AdmSliderController@postEditar') );
	Route::get('adm/sliders/{id}/borrar', array('as' => 'slider_borrar', 'uses' => 'AdmSliderController@getBorrar') );
	
	Route::any('adm/slider/foto/agregar/{portfolio_id?}', array('as' => 'slider_foto_upload', 'uses' => 'AdmSliderController@postFotoUpload') );			
	Route::any('adm/slider/foto/reordenar/{tipo?}', array('as' => 'slider_foto_reordenar', 'uses' => 'AdmSliderController@postFotosReorder') );	
	Route::get('adm/slider/foto/get/{id}/{temporal?}', array('as' => 'slider_foto_get', 'uses' => 'AdmSliderController@postFotoGet') );	
	Route::get('adm/slider/foto/editar/{temporal?}', array('as' => 'slider_foto_editar', 'uses' => 'AdmSliderController@postFotoEditar') );		
	Route::get('adm/slider/{tipo}/{id}/borrar', array('as' => 'galeria_borrar', 'uses' => 'AdmSliderController@getBorrarUpload') );	
	

	# UNICAMENTE para galerias de foto / vide

	Route::any('adm/{elemento}/{tipo}/{id}/borrar', array('as' => 'galeria_borrar', 'uses' => 'AdmFichaController@getBorrarUpload') );	
	
	
	# MODULO 'Newsletter'
	
	Route::get('adm/newsletters/export', array('as' => 'newsletter_export', 'uses' => 'AdmNewsletterController@getExport') );	
	Route::get('adm/newsletters', array('as' => 'newsletter_listar', 'uses' => 'AdmNewsletterController@getListar') );
	Route::get('adm/newsletters/agregar', array('as' => 'newsletter_agregar', 'uses' => 'AdmNewsletterController@getAgregar') );
	Route::post('adm/newsletters/agregar', array('as' => 'newsletter_agregar_post', 'uses' => 'AdmNewsletterController@postAgregar') );	
	Route::get('adm/newsletters/{id}', array('as' => 'newsletter_editar', 'uses' => 'AdmNewsletterController@getEditar') );
	Route::post('adm/newsletter/{id}/editar', array('as' => 'newsletter_editar_post', 'uses' =>'AdmNewsletterController@postEditar') );
	Route::get('adm/newsletters/{id}/borrar', array('as' => 'newsletter_borrar', 'uses' => 'AdmNewsletterController@getBorrar') );
	
	
	# MODULO 'Tags'
	
	Route::get('adm/tags', array('as' => 'tag_listar', 'uses' => 'AdmTagController@getListar') );
	Route::get('adm/tags/agregar', array('as' => 'tag_agregar', 'uses' => 'AdmTagController@getAgregar') );
	Route::post('adm/tags/agregar', array('as' => 'tag_agregar_post', 'uses' => 'AdmTagController@postAgregar') );	
	Route::get('adm/tags/{id}', array('as' => 'tag_editar', 'uses' => 'AdmTagController@getEditar') );
	Route::post('adm/tag/{id}/editar', array('as' => 'tag_editar_post', 'uses' =>'AdmTagController@postEditar') );
	Route::get('adm/tags/{id}/borrar', array('as' => 'tag_borrar', 'uses' => 'AdmTagController@getBorrar') );
	
	
	# MODULO 'Ficha Categoria'
	
	Route::get('adm/categorias/export', array('as' => 'fichacategoria_export', 'uses' => 'AdmFichaCategoriaController@getExport') );	
	Route::get('adm/categorias', array('as' => 'fichacategoria_listar', 'uses' => 'AdmFichaCategoriaController@getListar') );
	Route::get('adm/categorias/agregar', array('as' => 'fichacategoria_agregar', 'uses' => 'AdmFichaCategoriaController@getAgregar') );
	Route::post('adm/categorias/agregar', array('as' => 'fichacategoria_agregar_post', 'uses' => 'AdmFichaCategoriaController@postAgregar') );	
	Route::get('adm/categorias/{id}', array('as' => 'fichacategoria_editar', 'uses' => 'AdmFichaCategoriaController@getEditar') );
	Route::post('adm/fichacategoria/{id}/editar', array('as' => 'fichacategoria_editar_post', 'uses' =>'AdmFichaCategoriaController@postEditar') );
	Route::get('adm/categorias/{id}/borrar', array('as' => 'fichacategoria_borrar', 'uses' => 'AdmFichaCategoriaController@getBorrar') );
	Route::get('adm/categorias/tags/{id?}/{parent_id?}', array('as' => 'fichacategoria_tags', 'uses' => 'AdmFichaCategoriaController@getTags') );
	

	# MODULO 'Registros'

	Route::get('adm/registros', array('as' => 'registro_listar', 'uses' => 'AdmRegistrosController@getListar') );

	

		# MODULO 'Trivia'
	
	Route::get('adm/trivia', array('as' => 'trivia_listar', 'uses' => 'AdmTriviaController@getListar') );
	Route::get('adm/trivia/agregar', array('as' => 'trivia_agregar', 'uses' => 'AdmTriviaController@getAgregar') );
	Route::post('adm/trivia/agregar', array('as' => 'trivia_agregar_post', 'uses' => 'AdmTriviaController@postAgregar') );	
	Route::get('adm/trivia/{id}', array('as' => 'trivia_editar', 'uses' => 'AdmTriviaController@getEditar') );
	Route::post('adm/trivia/{id}/editar', array('as' => 'trivia_editar_post', 'uses' =>'AdmTriviaController@postEditar') );
	Route::get('adm/trivia/{id}/borrar', array('as' => 'trivia_borrar', 'uses' => 'AdmTriviaController@getBorrar') );



		# MODULO 'memotest'
	
	Route::get('adm/memotest', array('as' => 'memotest_listar', 'uses' => 'AdmMemotestController@getListar') );
	Route::get('adm/memotest/agregar', array('as' => 'memotest_agregar', 'uses' => 'AdmMemotestController@getAgregar') );
	Route::post('adm/memotest/agregar', array('as' => 'memotest_agregar_post', 'uses' => 'AdmMemotestController@postAgregar') );	
	Route::get('adm/memotest/{id}', array('as' => 'memotest_editar', 'uses' => 'AdmMemotestController@getEditar') );
	Route::post('adm/memotest/{id}/editar', array('as' => 'memotest_editar_post', 'uses' =>'AdmMemotestController@postEditar') );
	Route::get('adm/memotest/{id}/borrar', array('as' => 'memotest_borrar', 'uses' => 'AdmMemotestController@getBorrar') );




		# MODULO 'quien es'
	
	Route::get('adm/quienes', array('as' => 'quienes_listar', 'uses' => 'AdmQuienesController@getListar') );
	Route::get('adm/quienes/agregar', array('as' => 'quienes_agregar', 'uses' => 'AdmQuienesController@getAgregar') );
	Route::post('adm/quienes/agregar', array('as' => 'quienes_agregar_post', 'uses' => 'AdmQuienesController@postAgregar') );	
	Route::get('adm/quienes/{id}', array('as' => 'quienes_editar', 'uses' => 'AdmQuienesController@getEditar') );
	Route::post('adm/quienes/{id}/editar', array('as' => 'quienes_editar_post', 'uses' =>'AdmQuienesController@postEditar') );
	Route::get('adm/quienes/{id}/borrar', array('as' => 'quienes_borrar', 'uses' => 'AdmQuienesController@getBorrar') );




		# MODULO 'que fue'
	
	Route::get('adm/quefue', array('as' => 'quefue_listar', 'uses' => 'AdmQuefueController@getListar') );
	Route::get('adm/quefue/agregar', array('as' => 'quefue_agregar', 'uses' => 'AdmQuefueController@getAgregar') );
	Route::post('adm/quefue/agregar', array('as' => 'quefue_agregar_post', 'uses' => 'AdmQuefueController@postAgregar') );	
	Route::get('adm/quefue/{id}', array('as' => 'quefue_editar', 'uses' => 'AdmQuefueController@getEditar') );
	Route::post('adm/quefue/{id}/editar', array('as' => 'quefue_editar_post', 'uses' =>'AdmQuefueController@postEditar') );
	Route::get('adm/quefue/{id}/borrar', array('as' => 'quefue_borrar', 'uses' => 'AdmQuefueController@getBorrar') );









	# MODULO 'Configuracion'
	
	Route::get('adm/configuracion/{id}', array('as' => 'configuracion_editar', 'uses' => 'AdmConfiguracionController@getEditar') );
	Route::post('adm/configuracion/{id}/editar', array('as' => 'configuracion_editar_post', 'uses' =>'AdmConfiguracionController@postEditar') );

	Route::get('adm/terminos/{id}', array('as' => 'configuracion_terminos', 'uses' => 'AdmConfiguracionController@getEditarTerminos') );
	Route::post('adm/terminos/{id}/editar', array('as' => 'configuracion_terminos_post', 'uses' =>'AdmConfiguracionController@postEditarTerminos') );

	
	
});



/*
|--------------------------------------------------------------------------
| Servicios
|--------------------------------------------------------------------------
*/


Route::get('/svc/generico/{elemento}/{id?}', 'SvcGenericoController@getServicio');




/*
|--------------------------------------------------------------------------
| ADMIN Login / Logout
|--------------------------------------------------------------------------
*/

Route::get('/adm/', function() {

	if( Auth::guest() ){
		return Redirect::to('adm/login');
	}else{
		return Redirect::to('adm/dashboard');
	}

});

Route::get('adm/login', array('as' => 'adm_login', 'uses' => 'AdmLoginController@getLogin') );

Route::post('adm/login', 'AdmLoginController@postLogin');

Route::get('adm/logout', array('as' => 'logout', function()
{
	Auth::logout();
	return Redirect::to( route('adm_login') );
}));




/*
|--------------------------------------------------------------------------
| RUTAS PARA APP
|--------------------------------------------------------------------------
*/


Route::any('svc/app/cantidad','AdmRegistrosController@consulta' );
Route::any('svc/app/ingresa','AdmRegistrosController@ingresa' );
Route::any('upload','AdmRegistrosController@postFoto');//carga foto
Route::any('descarga/{file}',array('as' => 'descarga', 'uses' =>'AdmRegistrosController@descarga'));//carga foto


Route::get('/adm/export_full_xls/{elemento}', array('as' => 'export_full_xls', 'uses' => 'ExportController@getExportXls') );
	


/*
Route::get('recovery/{token}', array('as' => 'recovery', 'uses' => 'InscripcionController@getRecovery') );
Route::post('recovery-post', array('as' => 'recovery_post', 'uses' => 'InscripcionController@postRecovery') );
Route::post('reset-post', array('as' => 'reset_post', 'uses' => 'InscripcionController@postReset') );
*/


Route::any('loginuser', array('as' => 'loginuser', 'uses' => 'LoginController@getUser') );
Route::any('creausuario', array('as' => 'creausuario', 'uses' => 'LoginController@postUser') );

Route::any('recuperarcorreo', 'LoginController@getRecuperacorreo' );
Route::get('r/{token}', array('as' => 'recuperatoken', 'uses' =>'LoginController@getToken' ));
Route::any('rp', array('as' => 'recuperatoken', 'uses' =>'LoginController@postReset' ));;