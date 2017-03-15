<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
		
	</head>
	<body>
		<h3>Hola {{$destinatario}},</h3>

		<p>
			Este correo se ha generado automáticamente para restablecer su contraseña. Por favor haga click en el siguiente enlace: {{ URL::to('r', $token) }}.
		</p>
	

		<p>
			Muchas gracias.
			Saludos,
		</p>



	</body>
</html>
