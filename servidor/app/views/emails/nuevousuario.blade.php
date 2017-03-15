<!DOCTYPE html>
<html lang="en-US">
	<head>
		<meta charset="utf-8">
	</head>
	<body>
		<h3>Hola {{$destinatario}},</h3>

		<p>
			Este correo se ha generado automáticamente notificarle que un usuario nuevo se ha registrado. Por favor haga click en el siguiente enlace: {{ URL::to('adm/usuarios', $idregistro) }} para tomar un acción.
		</p>
	

		<p>
			Muchas gracias.
			Saludos,
		</p>



	</body>
</html>
