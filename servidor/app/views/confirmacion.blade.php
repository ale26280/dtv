<!DOCTYPE html>
<html lang="es">

	<head>
	
		<meta charset="utf-8">
		<title>:: Provincia Net ::</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="Provincia Net">
		<meta name="keywords" content="">
		
		<link rel="shortcut icon" href="">
		
		{{ HTML::style('css/bootstrap.3.min.css') }}
		{{ HTML::style('css/estilos.css') }}
		
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		{{ HTML::script('js/lib/bootstrap.3.min.js') }}
		{{ HTML::script('js/app.login.js') }}

	</head>

	<body>

	<div class="layout">
	
		<div class="manoFondo"></div>

		<div class="container">
		
			<div class="login">
			
				<h1>Confirmacion del registro</h1>
				
				<br/>
				
				<br/>
				
				
				@if ( $error == 1 ) 
				
				<div class="error"> {{ $error_message }} </div>
				
				@else
				
				<p>
				
					Felicitaciones! Tu cuenta ha sido creada exitosamente.<br/>
					<br/>
					Ya podes disfrutar de tus 500mb de storage online.<br/>
					<br/>
					<a href="{{ route('login') }}" title="Ingresar al sistema">Ingres&aacute;</a> al sistema para comenzar.
				
				</p>
				
				@endif
			


		
			</div>
	
	
			<div class="logos"></div>
	
		</div>
		
	</div>
	
	</body>
	
</html>