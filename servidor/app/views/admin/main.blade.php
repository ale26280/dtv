
<?php 
error_reporting(E_ALL);
ini_set('display_errors', '1');
$currentRoute = Route::getCurrentRoute()->getPath(); ?>

<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>: Admin ::</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="shortcut icon" type="image/x-icon" href="{{ URL::to('favicon.ico')}}">
    
    {{ HTML::style('css/bootstrap.min.css') }}
    {{ HTML::style('css/bootstrap-responsive.css') }}
    {{ HTML::style('css/smoothness/jquery-ui-1.9.2.custom.min.css') }}
    {{ HTML::style('css/uniform.css') }}
    {{ HTML::style('css/style.css') }}
    {{ HTML::style('css/admin.css') }}
	{{ HTML::style('css/jquery.datetimepicker.css') }}
	{{ HTML::style('css/jquery.datatables.css') }}
	{{ HTML::style('css/TableTools.css') }}	

    {{ HTML::script('js/lib/jquery.js') }}
    {{ HTML::script('js/lib/jquery-ui.js') }}
    {{ HTML::script('js/lib/uniform.js') }}
    {{ HTML::script('js/lib/chosen.js') }}
    {{ HTML::script('js/lib/jquery.datetimepicker.js') }}
	{{ HTML::script('js/lib/jquery.datatables.min.js') }}
	{{ HTML::script('js/lib/TableTools.min.js') }}
	{{ HTML::script('js/lib/ZeroClipboard.js') }}
	{{ HTML::script('js/tinymce/tinymce.min.js') }}
	
  </head>
  <body>

    <div id="header">
      <h1>Gestión del sistema</h1>   
    </div>

    <div id="user-nav" class="navbar">
		<ul class="nav btn-group">
			<li class="btn btn-mini btn-inverse"><a title="Administración" href="{{ route('dashboard') }}"><i class="icon icon-cog"></i> <span class="text">Dashboard</span></a></li>
			<li class="btn btn-mini btn-inverse"><a title="Cerrar sesión" href="{{ route('logout') }}"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
		</ul>
	</div>

    <div id="sidebar">

		<a href="#" class="visible-phone"><i class="icon icon-list"></i> Menu</a>
		
		<ul>
			
			
			<li class="submenu">
				<a href="#"><i class="icon icon-cog"></i> <span>Configuración</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/configuracion')) ||  is_numeric(strpos($currentRoute, 'adm/terminos')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('configuracion_editar', array(1)) }}" title="Gestionar Configuraci&oacute;n"><i class="icon icon-list"></i> Ver y editar Configuración</a>
					</li>

					<li>
						<a href="{{ route('configuracion_terminos', array(1)) }}" title="Gestionar T&eacute;rminos y condiciones"><i class="icon icon-list"></i> Ver y editar T&eacute;rminos y condiciones</a>
					</li>

				</ul>
			</li>
			

			<li class="submenu">
				<a href="#"><i class="icon icon-user"></i> <span> Usuarios</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/usuarios')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('usuario_listar') }}" title="Gestionar Usuarios"><i class="icon icon-list"></i> Listado de Usuarios</a>
					</li>

					<li>
						<a href="{{ route('usuario_agregar') }}" title="Agregar Usuario"><i class="icon icon-list"></i> Agregar Usuario</a>
					</li>

				</ul>
			</li>

			<li class="submenu">
				<a href="#"><i class="icon icon-list"></i> <span>Registros</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/registros')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('registro_listar') }}" title="Listado de Registros"><i class="icon icon-list"></i> Listado de Registros</a>
					</li>
					

				</ul>
			</li>


			<li class="submenu">
				<a href="#"><i class="icon icon-star"></i> <span>Trivia</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/trivia')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('trivia_listar') }}" title="Gestionar Trivia"><i class="icon icon-list"></i> Listado de Trivia</a>
					</li>
					
					<li>
						<a href="{{ route('trivia_agregar') }}" title="Agregar a Trivia"><i class="icon icon-list"></i> Agregar a Trivia</a>
					</li>

				</ul>
			</li>



			<li class="submenu">
				<a href="#"><i class="icon icon-star"></i> <span>Memotest</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/memotest')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('memotest_listar') }}" title="Gestionar Memotest"><i class="icon icon-list"></i> Listado de Memotest</a>
					</li>
					
					<li>
						<a href="{{ route('memotest_agregar') }}" title="Agregar a Memotest"><i class="icon icon-list"></i> Agregar a Memotest</a>
					</li>

				</ul>
			</li>




			<li class="submenu">
				<a href="#"><i class="icon icon-star"></i> <span>Qui&eacute;n es?</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/quienes')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('quienes_listar') }}" title="Gestionar Qui&eacute;n es?"><i class="icon icon-list"></i> Listado de Qui&eacute;n es?</a>
					</li>
					
					<li>
						<a href="{{ route('quienes_agregar') }}" title="Agregar a Qui&eacute;n es?"><i class="icon icon-list"></i> Agregar a Qui&eacute;n es?</a>
					</li>

				</ul>
			</li>






			<li class="submenu">
				<a href="#"><i class="icon icon-star"></i> <span>Qu&eacute; fue?</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/quefue')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('quefue_listar') }}" title="Gestionar Qu&eacute; fue?"><i class="icon icon-list"></i> Listado de Qu&eacute; fue?</a>
					</li>
					
					<li>
						<a href="{{ route('quefue_agregar') }}" title="Agregar a Qu&eacute; fue?"><i class="icon icon-list"></i> Agregar a Qu&eacute; fue?</a>
					</li>

				</ul>
			</li>





			{{--
			<li class="submenu">
				<a href="#"><i class="icon icon-file"></i> <span>Fichas</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/ficha')) || is_numeric(strpos($currentRoute, 'adm/categorias')) || is_numeric(strpos($currentRoute, 'adm/categorias')) ) || )  style="display:block;" @endif>

					<li>
						<a href="{{ route('ficha_listar') }}" title="Gestionar Fichas"><i class="icon icon-list"></i> Listado de Fichas</a>
					</li>
					
					<li>
						<a href="{{ route('ficha_agregar') }}" title="Agregar Ficha"><i class="icon icon-list"></i> Agregar Ficha</a>
					</li>
					
					<li>
						<a href="{{ route('tag_listar') }}" title="Gestionar Tags de Portfolios"><i class="icon icon-list"></i> Listado de Tags</a>
					</li>
					
					<li>
						<a href="{{ route('tag_agregar') }}" title="Agregar Tag de Portfolio"><i class="icon icon-list"></i> Agregar Tag</a>
					</li>
					
					<li>
						<a href="{{ route('fichacategoria_listar') }}" title="Gestionar Categorias"><i class="icon icon-list"></i> Categorias</a>
					</li>

				</ul>
			</li>
			
			<li class="submenu">
				<a href="#"><i class="icon icon-picture"></i> <span>Sliders</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/slider')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('slider_listar') }}" title="Gestionar Sliders"><i class="icon icon-list"></i> Listado de Sliders</a>
					</li>
					
					<li>
						<a href="{{ route('slider_agregar') }}" title="Agregar Slider"><i class="icon icon-list"></i> Agregar Slider</a>
					</li>

				</ul>
			</li>
			
			
			<li class="submenu">
				<a href="#"><i class="icon icon-envelope"></i> <span>Newsletters</span></a>
				
				<ul @if ( is_numeric(strpos($currentRoute, 'adm/newsletter')) )  style="display:block;" @endif>

					<li>
						<a href="{{ route('newsletter_listar') }}" title="Gestionar Newsletter"><i class="icon icon-list"></i> Listado de Newsletter</a>
					</li>
					
					<li>
						<a href="{{ route('newsletter_agregar') }}" title="Agregar a Newsletter"><i class="icon icon-list"></i> Agregar a Newsletter</a>
					</li>

				</ul>
			</li>
			--}}

		</ul>

    </div>
    
    <div id="content">
	
	<div id="content-header">

		<h1 style="text-transform:capitalize">Dashboard</h1>

	</div>

	<div id="breadcrumb">

		<a data-original-title="Dashboard" href="{{ route('dashboard') }}" class="tip-bottom"><i class="icon-globe"></i> Inicio</a>
		
		<a data-original-title="Modulo" class="current" href="javascript:void%200;" class="tip-bottom"><i class="icon-pencil"></i> Modulo</a>

	</div>
	  
	<div class="container-fluid">

		@yield('content')

		<div class="row-fluid">
			<div id="footer" class="span12"></div>
		</div>

	</div>


	
      {{ HTML::script('js/lib/bootstrap.min.js') }}
      {{ HTML::script('js/app.admin.js') }}

  <ul class="typeahead dropdown-menu"></ul>
</body>
</html>
